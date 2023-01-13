tableextension 50040 TDSENtryExt extends "TDS Entry"
{
    fields
    {
        field(50001; "Vendor Discrioption"; Text[100])
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Party Code")));
        }
        field(50002; "Expense Head"; Code[20])
        {
            DataClassification = ToBeClassified;
            // FieldClass=FlowField;
            // CalcFormula=Lookup("Purch. Inv. Line"."No." WHERE ("Document No."=FIELD("Document No."),"TDS Nature of Deduction"=FIELD("TDS Nature of Deduction")));
        }
    }

    var
        myInt: Integer;
}