tableextension 50006 VendLedgEntryExt extends "Vendor Ledger Entry"
{
    fields
    {
        field(50001; "Print Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Applied Gen. Line No."; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Purchase Order No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Vendor Invoice Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Inv. Header"."Document Date" WHERE("No." = FIELD("Document No.")));
        }
        field(50005; "Exchange Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Replicated in PLE"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}