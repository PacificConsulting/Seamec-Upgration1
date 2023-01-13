tableextension 50019 SalesCrMemohdrExt extends "Sales Cr.Memo Header"
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
        field(50003; "Invoice Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}