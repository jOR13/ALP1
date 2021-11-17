codeunit 50701 SuscripcionesFS
{

    [EventSubscriber(ObjectType::Table, 50700, 'OnAfterModifyEvent', '', true, false)]

    local procedure ExecuteOnAfterInsertOrdendeVenta(var Rec: Record OrdendeVenta; RunTrigger: Boolean);
    var
        Codeenvio: Codeunit ServicioFS;
    begin


        Codeenvio.InsertarOrdenVenta(
        Rec.Nombrecliente,
        rec.NDocumento,
        rec.Cantidad,
        rec.PLACA
        );

    end;

    [EventSubscriber(ObjectType::Table, 50702, 'OnAfterModifyEvent', '', true, false)]

    local procedure ExecuteOnAfterInsertEnvioalmacen(var Rec: Record AjusteDiario; RunTrigger: Boolean);

    var

        Codeenvio: Codeunit ServicioFS;

    begin



        if Rec.Ndocumento = '' then exit;

        if Rec.CLIENTE = '' then exit;

        if Rec.PLACAJP = '' then exit;



        Codeenvio.DiarioProducto(

        Rec.Fecha,

        Rec.Tipomovi,

        Rec.Ndocumento,

        Rec.Cantidad,

        Rec.CLIENTE,

        Rec.PLACAJP);



    end;



    [EventSubscriber(ObjectType::Table, 50701, 'OnAfterModifyEvent', '', true, false)]



    local procedure ExecuteOnAfterInsertOrdenCompra(var Rec: Record OrdenCompra; RunTrigger: Boolean);

    var

        Codeenvio: Codeunit ServicioFS;

    begin



        Codeenvio.InsertarOrdenCompra(

        Rec.NombreProveedor,

        Rec.Ndocumento,

        Rec."Nº factura proveedor",

        Rec.Cantidad,

        Rec.PLaca

        );



    end;

}







