tableextension 50031 PurchPayableSetup extends "Purchases & Payables Setup"
{
    fields
    {

        field(50002; "Default G/L"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." WHERE("Account Type" = FILTER(Posting), Blocked = CONST(false));
        }
        field(50003; "Default Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(50004; "Enable For Masters"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Enable For Processed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Default VAT Bus. Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }
        field(50007; "Import Port Receipt"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

    }

    var
        myInt: Integer;
}