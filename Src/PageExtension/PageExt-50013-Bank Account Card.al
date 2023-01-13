pageextension 50013 BankAccCard extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    var
        recUsersetup: Record 91;
    Begin
        recUsersetup.RESET;
        recUsersetup.SETRANGE("User ID", USERID);
        IF recUsersetup.FINDFIRST THEN
            IF recUsersetup."Bank Master" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);
    End;

    var
        myInt: Integer;
}