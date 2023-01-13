tableextension 50022 PurchInvLineExt extends "Purch. Inv. Line"
{
    fields
    {
        field(50001; "Purchase Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "TDS Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation="TDS Reason";
        }
    }

    var
        myInt: Integer;
}