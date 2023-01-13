pageextension 50015 FixedAssetCardExt extends "Fixed Asset Card"
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
    Begin
        recUserSetup.RESET;
        recUserSetup.SETRANGE("User ID", USERID);
        IF recUserSetup.FINDFIRST THEN
            IF recUserSetup."Fixed Asset" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);
    End;

    var
        myInt: Integer;
        recUserSetup: Record "User Setup";

}