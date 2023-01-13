tableextension 50027 BankAccLedgEntryExt extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50001; "Clearing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}