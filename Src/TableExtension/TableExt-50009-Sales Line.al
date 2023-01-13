tableextension 50009 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50001; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Starting Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; "Ending Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50005; "No. Of Days"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "Line Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        modify("Qty. to Ship")
        {
            trigger OnBeforeValidate()
            begin
                IF vItem.GET("No.") THEN;
                vTolerance := Quantity * (vItem.Tolerance / 100);
            end;
        }
    }

    var
        myInt: Integer;
        vItem: Record Item;
        vTolerance: Decimal;
}