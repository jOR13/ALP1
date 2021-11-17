page 50701 EnvioOrdenVenta

{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = OrdendeVenta;

    layout
    {
        area(Content)

        {

            repeater(General)

            {
                field(Nombrecliente; rec.Nombrecliente)

                {

                    ApplicationArea = all;


                }




                // field(ShipmentSeries; rec.ShipmentSeries)
                // {
                //     ApplicationArea = all;
                // }




                // DETALLES
                FIELD(NDocumento; REC.NDocumento)
                {
                    ApplicationArea = ALL;

                }

                field(Cantidad; rec.Cantidad)

                {
                    ApplicationArea = all;
                }

                field(PLACA; REC.PLACA)
                {
                    ApplicationArea = ALL;

                }















            }

        }





    }

}

