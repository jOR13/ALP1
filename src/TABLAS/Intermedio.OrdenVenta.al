table 50700 OrdendeVenta

{
    DataClassification = ToBeClassified;
    fields

    {

        //CABEZADO
        field(1; Item; Integer)

        {

            DataClassification = ToBeClassified;

            AutoIncrement = true;

        }



        field(2; NDocumento; TEXT[100])
        {
            DataClassification = ToBeClassified;


        }
        field(3; Nombrecliente; Text[100])

        {

            DataClassification = ToBeClassified;
            TableRelation = Customer.Name;
            Caption = 'Nombre Cliente';
            ValidateTableRelation = false;

        }



        //DETALLES




        field(4; Cantidad; Decimal)

        {

            DataClassification = ToBeClassified;



        }


        field(5; PLACA; CODE[90])
        {
            DataClassification = ToBeClassified;
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