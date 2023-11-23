pageextension 50019 VendorList extends "Vendor List"
{
    layout
    {
        addafter("Location Code")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }

            field(Address; Rec.Address)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vendor''s address.';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies additional address information.';
            }
            field("P.A.N. Reference No."; Rec."P.A.N. Reference No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the PAN Reference No. in case the PAN is not available or applied by the party';
            }
            field("GST Registration No."; Rec."GST Registration No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vendors GST registration number issued by authorized body.';
            }
        }
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

    trigger OnDeleteRecord(): Boolean
    var
        recusersetup: Record "User Setup";
    begin
        recusersetup.Reset();
        recusersetup.SetRange("User ID", UserId);
        if recusersetup.FindFirst() then begin
            if recusersetup."Vendor Deletion" = false then begin
                Error('You do not have permission');

            end;

        end;



    end;


    var
        myInt: Integer;
}