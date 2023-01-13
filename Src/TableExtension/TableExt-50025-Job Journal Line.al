tableextension 50025 JobJournalLineExt extends "Job Journal Line"
{
    fields
    {
        field(50001; "Invoice Currency Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}