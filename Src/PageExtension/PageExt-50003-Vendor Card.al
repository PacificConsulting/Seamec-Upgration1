pageextension 50003 VendorCardExt1 extends "Vendor Card"
{
    layout
    {
        modify("GST Registration No.")
        {
            trigger OnBeforeValidate()
            var
                RecVendor: Record Vendor;
            Begin
                RecVendor.RESET;
                RecVendor.SETRANGE(RecVendor."GST Registration No.", Rec."GST Registration No.");
                IF RecVendor.FINDFIRST THEN
                    ERROR('GST Registration No is same Please Re-Enter GST Registration No.' + 'Vendor No.' + ' ' + RecVendor."No.");
            End;
        }
    }

    actions
    {
        addafter(CancelApprovalRequest)
        {
            action(EditVendor)
            {
                Caption = 'Edit Vendor';
                trigger OnAction()
                var
                    RecVendor: Record Vendor;
                    recUserSetup: Record "User Setup";
                Begin
                    RecVendor.GET(Rec."No.");
                    recUserSetup.RESET;
                    recUserSetup.SETRANGE(recUserSetup."User ID", USERID);
                    IF recUserSetup.FINDFIRST THEN BEGIN
                        IF recUserSetup."Approve Vendor" = TRUE THEN BEGIN
                            RecVendor.VALIDATE(Blocked, RecVendor.Blocked::" ");
                            RecVendor.MODIFY;
                        END ELSE
                            ERROR('You Do Not have Permission to Approve Vendor..!!');
                    END;

                End;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    Begin
        Rec.Blocked := Rec.Blocked::All;
        Rec.modify();
    End;

    trigger OnOpenPage()
    var
        recUserSetup: Record "User Setup";
    begin
        recUserSetup.RESET;
        recUserSetup.SETRANGE("User ID", USERID);
        IF recUserSetup.FINDFIRST THEN
            IF recUserSetup."Vendor Master" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);
    end;

    var
        myInt: Integer;
}