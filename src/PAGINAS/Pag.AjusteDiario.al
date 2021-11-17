page 50702 DiarioAjuste



{



    PageType = List;



    ApplicationArea = Basic, Suite;



    UsageCategory = Lists;



    SourceTable = AjusteDiario;




    layout



    {



        area(Content)



        {



            repeater(group)



            {

                field(Fecha; Fecha)

                {

                    ApplicationArea = all;

                }

                field(Ndocumento; Rec.Ndocumento)



                {



                    ApplicationArea = All;



                }

                field(Cantidad; Rec.Cantidad)



                {



                    ApplicationArea = All;



                }



                field(CLIENTE; Rec.CLIENTE)



                {



                    ApplicationArea = All;



                }



                field(PLACAJP; Rec.PLACAJP)



                {



                    ApplicationArea = All;



                }

            }



        }



    }



}

