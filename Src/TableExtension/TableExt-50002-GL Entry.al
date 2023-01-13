tableextension 50002 GLEntryExt extends "G/L Entry"
{
    fields
    {
        field(50001; "Employee Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Invoice Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Inv. Header"."Document Date" WHERE("No." = FIELD("Document No.")));
        }
    }

    var
        myInt: Integer;
}