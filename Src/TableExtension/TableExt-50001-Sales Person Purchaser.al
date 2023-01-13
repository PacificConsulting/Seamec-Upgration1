tableextension 50000 SalesPersonPurchaserExt extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; Designation; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}