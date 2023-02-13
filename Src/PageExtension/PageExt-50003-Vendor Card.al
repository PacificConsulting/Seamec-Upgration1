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
        modify("E-Mail")
        {
            ShowMandatory = true;
        }
        modify("Phone No.")
        {
            ShowMandatory = true;
        }
        addafter("Balance (LCY)")
        {
            field(MSME; Rec.MSME)
            {
                ApplicationArea = all;
            }
            field("MSME No."; Rec."MSME No.")
            {
                ApplicationArea = all;

            }
        }
        addafter("No.")
        {
            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = all;
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
                ApplicationArea = Basic, Suite;
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


    trigger OnModifyRecord(): Boolean
    Begin
        Rec.Blocked := Rec.Blocked::All;
        Rec.modify();
    End;



    trigger OnOpenPage()
    var
        recUserSetup: Record "User Setup";
        NotificationAction: Notification;
    begin
        recUserSetup.RESET;
        recUserSetup.SETRANGE("User ID", USERID);
        IF recUserSetup.FINDFIRST THEN
            IF recUserSetup."Vendor Master" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);

        //PCP-0070 << 08Feb2023
        if (Rec."Phone No." = '') OR (Rec."E-Mail" = '') then begin
            NotificationAction.Message('Do not forget to add Phone No. OR E-Mail');
            NotificationAction.Scope := NotificationAction.Scope::LocalScope;
            NotificationAction.Send();
        end;
        // PCPL-0070 >> 08Feb2023
    end;

    trigger OnClosePage()// PCPL-064
    var
        myInt: Integer;
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        myInt: Integer;
    begin
        if Rec.MSME = true then
            if Rec."MSME No." = '' then
                Message('MSME No. is blank');

        if Rec."Phone No." = '' then
            MEssage('Phono No. is blank');

        if Rec."E-Mail" = '' then
            Message('E-mail is blank');
    end;



    var
        myInt: Integer;
        NoText: text[5];
}