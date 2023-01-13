tableextension 50043 GenLedgSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(50001; "Credit Memo Without Appl."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}