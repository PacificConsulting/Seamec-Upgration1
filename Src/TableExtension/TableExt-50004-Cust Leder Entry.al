tableextension 50004 CustLedgEntryExt extends "Cust. Ledger Entry"
{
    fields
    {
        field(50001; "Applied Gen. Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Customer Invoice Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."Document Date" WHERE("Sell-to Customer No." = FIELD("Customer No.")));
        }
        field(50003; "Exchange Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}