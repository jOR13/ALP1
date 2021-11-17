codeunit 50700 ServicioFS
{
    procedure InsertarOrdenVenta(
    Nombrecliente: text[100];
    //ShipmentSeries: code[90];
    //DocumentType: Code[30];
    //OperationType: Code[30];
    //TipoOperacionFE: Code[30];
    //detalles
    // NDocumento: Code[100];
    //"Códalmacén": Text[30];
    NDocumento: text[100];
    Cantidad: Decimal;
    PLACA: CODE[90]): Text
    var
        TableOrdendeVentaCab: Record "Sales Header";
        TableOrdendeVentaDet: Record "Sales Line";
        NroSerieLinea: Record "No. Series Line";
        LoteVenta: Codeunit "Sales Batch Post Mgt.";
        NroLinea: Integer;
        RecConf: Record "General Ledger Setup";
        LoteaProcesar: Codeunit "Batch Processing Mgt.";
        Parametros: Codeunit "Batch Post Parameter Types";
        RecItem: Record Item;
        FuncionSerie: Codeunit NoSeriesManagement;
    begin
        TableOrdendeVentaCab.Init();
        TableOrdendeVentaCab.Validate("Document Type", TableOrdendeVentaCab."Document Type"::Order);
        TableOrdendeVentaCab.Validate("No.", NDocumento);
        TableOrdendeVentaCab.Validate("Sell-to Customer Name", Nombrecliente);
        TableOrdendeVentaCab.Validate("Bill-to Name", Nombrecliente);
        TableOrdendeVentaCab.Validate("No. Series", 'V-PED');//Shipment Series
                                                             // TableOrdendeVentaCab.Validate("LOCPE_Doc. Type SUNAT", '01');//Tyoe Docuemnt
                                                             // TableOrdendeVentaCab.Validate("LOCPE_Operation Type SUNAT", '01'); //Operation Type
                                                             // TableOrdendeVentaCab.Validate("LOCPE_Operation Type FE", '0101'); //Operation Type FE
        TableOrdendeVentaCab.Insert(True);
        //DETALLES
        TableOrdendeVentaDet.Init();
        TableOrdendeVentaDet.Validate("Document Type", TableOrdendeVentaDet."Document Type"::Order);
        TableOrdendeVentaDet.Validate("Document No.", NDocumento);
        TableOrdendeVentaDet.Validate(Type, TableOrdendeVentaDet.Type::Item);
        TableOrdendeVentaDet.Validate("No.", 'DIESEL-N');// COMO DATO DE NDOCUMENTO (este deberia ser cod del item)   
        TableOrdendeVentaDet.Validate("Location Code", 'ALM PET');// ADATO DURO DEL CAMPO COD.ALAMACEN
        TableOrdendeVentaDet.Validate(Quantity, Cantidad);
        //TableOrdendeVentaDet.Validate("Unit Price", '16.52'); // Precio de cada galon
        TableOrdendeVentaDet.Validate("Shortcut Dimension 2 Code", PLACA);
        TableOrdendeVentaDet.Insert(true);
    end;

    procedure DiarioProducto(
        Fecha: Date;
    Tipomovi: Text;
    Ndocumento: Code[30];
    Cantidad: Decimal;
    CLIENTE: Code[30];
    PLACAJP: Code[30]
   ): Text
    var
        TablaDiarioProducto: Record "Item Journal Line";
        NroSerieLinea: Record "No. Series Line";
        TablaSeccion: Record "Item Journal Batch";
        NroLinea: Integer;
        NroVoucher: Text;
        Numerox: Integer;
        Largo: Integer;
        Respuesta: Text;
    begin

        TablaSeccion.Reset();
        TablaSeccion.SetRange("Journal Template Name", 'PRODUCTO');
        TablaSeccion.SetRange(Name, 'GENERICO');
        Respuesta := '';
        TablaDiarioProducto.Reset();
        TablaDiarioProducto.SetFilter("Journal Template Name", 'PRODUCTO');
        TablaDiarioProducto.SetFilter("Journal Batch Name", 'GENERICO');


        if (TablaDiarioProducto.FindLast()) then begin
            NroLinea := TablaDiarioProducto."Line No." + 10000;
        end
        else begin
            NroLinea := 10000;
        end;
        TablaDiarioProducto.Init();
        TablaDiarioProducto.Validate("Journal Template Name", 'PRODUCTO');
        TablaDiarioProducto.Validate("Journal Batch Name", 'GENERICO');
        TablaDiarioProducto.Validate("Line No.", NroLinea);
        TablaDiarioProducto.Validate("Posting Date", Fecha);
        TablaDiarioProducto.Validate("Document No.", Ndocumento);
        if (Tipomovi = 'Ajuste negativo') then begin
            TablaDiarioProducto.Validate("Entry Type", TablaDiarioProducto."Entry Type"::"Positive Adjmt.");
        end

        else begin
            TablaDiarioProducto.Validate("Entry Type", TablaDiarioProducto."Entry Type"::"Negative Adjmt.");
        end;
        // TablaDiarioProducto.Validate("LOCPE_Operation Type SUNAT", '27');
        // TablaDiarioProducto.Validate("LOCPE_Doc. Type SUNAT", '00');
        TablaDiarioProducto.Validate("Item No.", 'D2-B5-S-50UV');
        TablaDiarioProducto.Validate("Location Code", 'JP LIMA');
        TablaDiarioProducto.Validate(Quantity, Cantidad);
        TablaDiarioProducto.Validate("Shortcut Dimension 2 Code", PLACAJP);
        TablaDiarioProducto.Validate("Shortcut Dimension 1 Code", CLIENTE);
        if TablaDiarioProducto.Insert(true) then begin
            Respuesta := '1';
        end;
        exit(Respuesta);

    end;

    procedure InsertarOrdenCompra(
        NombreProveedor: Text;
    Ndocumento: Text;
    "Nº factura proveedor": Text;
    //DETALLE COMPRA
    Cantidad: Decimal;
    Placa: text
    ): Text
    var
        TableOrdendeCompraCab: Record "Purchase Header";
        TableOrdendeCompraDet: Record "Purchase Line";
        NroSerieLinea: Record "No. Series Line";
        LoteVenta: Codeunit "Purchase Batch Post Mgt.";
        NroLinea: Integer;
        RecConf: Record "General Ledger Setup";
        FuncionSerie: Codeunit NoSeriesManagement;
    begin

        TableOrdendeCompraCab.Reset();
        TableOrdendeCompraCab.Validate("Document Type", TableOrdendeCompraCab."Document Type"::Order);
        TableOrdendeCompraCab.Validate("Pay-to Name", NombreProveedor);
        TableOrdendeCompraCab.Validate("Buy-from Vendor Name", NombreProveedor);
        TableOrdendeCompraCab.Validate("No.", Ndocumento);
        TableOrdendeCompraCab.Validate("Vendor Invoice No.", "Nº factura proveedor");
        // TableOrdendeCompraCab.Validate("LOCPE_Shipment Series", 'COT-CMP');
        TableOrdendeCompraCab.Validate("Posting No. Series", 'C-FAC+');
        // TableOrdendeCompraCab.Validate("LOCPE_Doc. Type SUNAT", '01');
        // TableOrdendeCompraCab.Validate("LOCPE_Operation Type SUNAT", '02');
        TableOrdendeCompraCab.Insert(True);
        //DETALLES
        TableOrdendeCompraDet.Init();
        // TableOrdendeCompraDet.Reset();
        // TableOrdendeCompraDet.SetRange("Document Type", TableOrdendeCompraDet."Document Type"::Order);
        // if (TableOrdendeCompraDet.FindLast()) then begin
        //     NroLinea := TableOrdendeCompraDet."Line No." + 10000;
        // end
        // else begin
        //     NroLinea := 10000;
        // end;
        TableOrdendeCompraDet.Validate("Document Type", TableOrdendeCompraDet."Document Type"::Order);
        TableOrdendeCompraDet.Validate("Document No.", Ndocumento);
        TableOrdendeCompraDet.Validate(Type, TableOrdendeCompraDet.Type::Item);
        TableOrdendeCompraDet.Validate("No.", 'DIESEL-N');
        TableOrdendeCompraDet.Validate("Location Code", 'ALM PET');
        TableOrdendeCompraDet.Validate(Quantity, Cantidad);
        TableOrdendeCompraDet.Validate("Shortcut Dimension 2 Code", Placa);
        TableOrdendeCompraDet.Insert(true);
    end;
}