tableextension 50020 SalesCrMemoLineExt extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50006; "Line Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}