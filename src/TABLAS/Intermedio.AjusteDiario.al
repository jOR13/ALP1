table 50702 AjusteDiario



{



    DataClassification = ToBeClassified;



    fields



    {



        field(1; Item; Integer)

        {

            DataClassification = ToBeClassified;

            AutoIncrement = true;

        }



        field(14; Fecha; Date)



        {



            DataClassification = ToBeClassified;



            Caption = 'Fecha registro';





        }



        field(7; Tipomovi; Text[50])



        {



            DataClassification = ToBeClassified;



            Caption = 'Tipo mov';

        }



        field(8; Ndocumento; Code[30])



        {



            DataClassification = ToBeClassified;



            Caption = 'Nº documento';



        }

        field(17; Cantidad; Decimal)



        {



            DataClassification = ToBeClassified;



        }



        field(24; CLIENTE; Code[30])



        {



            DataClassification = ToBeClassified;



        }



        field(25; PLACAJP; Code[30])



        {



            DataClassification = ToBeClassified;



            Caption = 'PLACA JP';



        }





    }



    keys



    {



        key(Key1; Item)



        {



            Clustered = true;



        }



    }


}