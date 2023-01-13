tableextension 50018 SalesInvLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(50001; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Starting Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Ending Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "No. Of Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Line Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}