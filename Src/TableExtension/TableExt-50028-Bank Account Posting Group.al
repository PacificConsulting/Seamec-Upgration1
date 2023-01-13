tableextension 50028 BankAccountPostingGroupExt extends "Bank Account Posting Group"
{
    fields
    {
        field(50001; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}