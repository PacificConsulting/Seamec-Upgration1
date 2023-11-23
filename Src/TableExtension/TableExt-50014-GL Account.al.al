tableextension 50014 GLAccountExt extends "G/L Account"
{
    fields
    {
        field(50001; "Account Group"; Enum "Accoount Group GL Acc")
        {
            DataClassification = ToBeClassified;
            Description = 'PCPL-0070 21June23';
        }
    }
    trigger OnAfterInsert()
    begin
        IF UserSetupnew.GET(USERID) THEN;
        IF UserSetupnew."G/L Account" = FALSE THEN
            ERROR('You Do Not Have Permission Please Contact Admin');
    end;

    trigger OnAfterModify()
    Begin
        IF UserSetupnew.GET(USERID) THEN;
        IF UserSetupnew."G/L Account" = FALSE THEN
            ERROR('You Do Not Have Permission Please Contact Admin');
    End;

    trigger OnAfterDelete()
    Begin
        IF UserSetupnew.GET(USERID) THEN;
        IF UserSetupnew."G/L Account" = FALSE THEN
            ERROR('You Do Not Have Permission Please Contact Admin');
    End;

    var
        myInt: Integer;
        UserSetupnew: Record "User Setup";
}