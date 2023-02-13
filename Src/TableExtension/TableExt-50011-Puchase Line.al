tableextension 50011 PurchLineExt extends "Purchase Line"
{
    fields
    {
        field(50001; "Sr. No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "TDS Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "TDS Reason";
        }
        modify(Type)
        {
            trigger OnAfterValidate()
            var
            Begin
                if Type = 4 then
                    "Use Duplication List" := true
                Else
                    Rec."Use Duplication List" := false;
            End;
        }
    }

    var
        myInt: Integer;
}