tableextension 50037 FALedgEntryExt extends "FA Ledger Entry"
{
    fields
    {
        field(50001; "Put to Use Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Ready To Use Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Purch/Sales Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}