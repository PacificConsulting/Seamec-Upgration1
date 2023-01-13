tableextension 50014 GLAccountExt extends "G/L Account"
{
    fields
    {
        // Add changes to table fields here
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