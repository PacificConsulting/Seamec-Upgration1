tableextension 50023 JobExt extends Job
{
    fields
    {
        field(50001; "Our Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(50002; "Contract Ref."; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Salesperson Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
    }

    var
        myInt: Integer;
}