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
        addafter("Gen. Bus. Posting Group")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
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
        Text1: array[3] of Text[1024];
    begin
        recUserSetup.RESET;
        recUserSetup.SETRANGE("User ID", USERID);
        IF recUserSetup.FINDFIRST THEN
            IF recUserSetup."Vendor Master" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);

        //PCPL-0070 << 08Feb2023
        if (Rec."Phone No." = '') OR (Rec."E-Mail" = '') then Begin
            Text1[1] := 'Do not forget to add Phone No. OR E-Mail';
            NotificationAction.Message(Text1[1]);
            NotificationAction.Scope := NotificationAction.Scope::LocalScope;
            NotificationAction.Send();
        end;
    end;
    //end;
    // PCPL-0070 >> 08Feb2023

    trigger OnClosePage()// PCPL-064
    var
        myInt: Integer;
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        myInt: Integer;
    begin
        if Rec.MSME = true then begin
            if Rec."MSME No." = '' then
                Error('MSME No. is blank');
        end;

        if Rec."Phone No." = '' then
            MEssage('Phono No. is blank');

        if Rec."E-Mail" = '' then
            Message('E-mail is blank');

        //PCPL-0070 23Feb2023 <<
        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("Table ID", 23);
        DocumentAttachment.SetRange("No.", Rec."No.");
        if not DocumentAttachment.FindFirst() then
            Message('Attachment is missing on Vendor Card');
        //PCPL-0070 23Feb2023 >>

        //PCPL-064 21feb2023<<
        rec.TestField(Name);
        rec.TestField(Address);
        rec.TestField("Address 2");
        rec.TestField("E-Mail");
        rec.TestField("Phone No.");
        rec.TestField("Gen. Bus. Posting Group");
        rec.TestField("P.A.N. No.");
        if (rec."GST Vendor Type" = rec."GST Vendor Type"::Registered) then
            rec.TestField("GST Registration No.");

        //rec.TestField(MSME);
        //rec.TestField("MSME No.");

        RecBankAcc.Reset();
        RecBankAcc.SetRange("Vendor No.", rec."No.");
        RecBankAcc.Setfilter(Code, '<>%1', '');
        if NOT RecBankAcc.find('-') then
            Error('Please add vendor Bank Account');
        //PCPL-064 21feb2023<<
    end;



    var
        //myInt: Codeunit 22;
        NoText: text[5];
        RecBankAcc: Record "Vendor Bank Account";
        DocumentAttachment: Record "Document Attachment";
}