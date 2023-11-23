pageextension 50002 CustomerExt extends "Customer Card"
{
    layout
    {
        addbefore("Phone No.")
        {
            field("Our Bank Account No."; Rec."Our Bank Account No.")
            {
                ApplicationArea = All;
            }
        }
        modify("GST Registration No.")
        {
            trigger OnBeforeValidate()
            var
                RecCustomer: Record Customer;
            Begin
                RecCustomer.RESET;
                RecCustomer.SETRANGE(RecCustomer."GST Registration No.", Rec."GST Registration No.");
                IF RecCustomer.FINDFIRST THEN
                    ERROR('GST Registration No is same Please Re-Enter GST Registration No.' + 'Customer No.' + ' ' + RecCustomer."No.");
            End;
        }
        modify("P.A.N. No.")
        {
            trigger OnBeforeValidate()
            begin
                Rec.CheckPanNo(Rec."P.A.N. No.");
            end;
        }

    }

    actions
    {
        addafter(CancelApprovalRequest)
        {
            action(ApproveCustomer)
            {
                Caption = 'Approve Customer';
                ApplicationArea = all;
                trigger OnAction()
                var
                    RecCust: Record 18;
                    recUserSetup1: Record "User Setup";
                Begin
                    RecCust.GET(Rec."No.");
                    recUserSetup1.RESET;
                    recUserSetup1.SETRANGE(recUserSetup1."User ID", USERID);
                    IF recUserSetup1.FINDFIRST THEN BEGIN
                        IF recUserSetup1."Approve Customer" = TRUE THEN BEGIN
                            RecCust.Blocked := RecCust.Blocked::" ";
                            RecCust.MODIFY;
                        END ELSE
                            ERROR('You Do Not have Permission to Approve customer..!!');
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
            IF recUserSetup."Customer Master" THEN
                CurrPage.EDITABLE(TRUE)
            ELSE
                CurrPage.EDITABLE(FALSE);
    end;

    trigger OnQueryClosePage(closeAction: Action): Boolean
    var
        myInt: Integer;
    begin
        //PCPL-064 21feb2023<<
        rec.TestField(Name);
        rec.TestField(Address);
        rec.TestField("Address 2");
        rec.TestField("E-Mail");
        rec.TestField("Phone No.");
        rec.TestField("Gen. Bus. Posting Group");
        if rec."GST Customer Type" = rec."GST Customer Type"::Registered then begin
            rec.TestField("GST Registration No.");
            rec.TestField("P.A.N. No.");
        end;
        rec.TestField("Customer Posting Group");
    end;
    //PCPL-064 21feb2023<<
    var
        myInt: Integer;
}