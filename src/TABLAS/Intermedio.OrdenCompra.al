table 50701 OrdenCompra
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; Item; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; NombreProveedor; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor.Name;
            Caption = 'Nombre Provedor';
            ValidateTableRelation = false;
        }

        field(4; Ndocumento; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(5; "Nº factura proveedor"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        //DETALLE COMPRA
        field(13; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(15; CodAlmacen; Text[30])
        {
            DataClassification = ToBeClassified;
            ObsoleteState = Removed;
        }

        field(3; Cliente; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(16; PLaca; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }
}