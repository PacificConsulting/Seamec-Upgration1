pageextension 50019 VendorList extends "Vendor List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(PayVendor)
        {
            action(EditVendor)
            {
                Caption = 'Approve Vendor';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
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

    var
        myInt: Integer;
}