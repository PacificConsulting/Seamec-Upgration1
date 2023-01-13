tableextension 50026 BankAccountExt extends "Bank Account"
{
    fields
    {
        field(50001; "Correspondent Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Correspondent Bank SWIFT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Correspondent Bank A/c No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        // field(50004;"IFSC Code";Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
    }

    var
        myInt: Integer;
}