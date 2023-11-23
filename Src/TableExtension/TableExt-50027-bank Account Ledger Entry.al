tableextension 50027 BankAccLedgEntryExt extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50001; "Clearing Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            AccessByPermission = TableData "Bank Account Ledger Entry" = RIM;   //PCPL-25/250923
        }
    }

    var
        myInt: Integer;
}