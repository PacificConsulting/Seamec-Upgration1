tableextension 50024 JobLedgEntryExt extends "Job Ledger Entry"
{
    fields
    {
        field(50001; "Invoice Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(50002; " Invoice Currency Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}