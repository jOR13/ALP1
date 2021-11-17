
page 50700 EnvioOrdenCompra



{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = OrdenCompra;

    layout

    {
        area(Content)

        {
            repeater(GroupName)

            {
                field(NombreProveedor; NombreProveedor)
                {
                    ApplicationArea = All;
                }

                field(Ndocumento; Ndocumento)
                {
                    ApplicationArea = All;
                }

                field("Nº factura proveedor"; Rec."Nº factura proveedor")
                {
                    ApplicationArea = All;
                }

                field(Cantidad; Rec.Cantidad)
                {
                    ApplicationArea = All;
                }

                field(PLaca; PLaca)
                {
                    ApplicationArea = All;
                }

            }

        }
    }
}


