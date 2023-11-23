pageextension 50011 UserSetupExt extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field("Vendor Master"; Rec."Vendor Master")
            {
                ApplicationArea = all;
            }
            field("Delete Vendor"; Rec."Vendor Deletion")
            {
                ApplicationArea = all;
            }
            field("Customer Master"; Rec."Customer Master")
            {
                ApplicationArea = All;
            }
            field("Fixed Asset"; Rec."Fixed Asset")
            {
                ApplicationArea = All;
            }
            field("G/L Account"; Rec."G/L Account")
            {
                ApplicationArea = All;
            }
            field("Bank Master"; Rec."Bank Master")
            {
                ApplicationArea = All;
            }
            field("Journal Voucher Approval"; Rec."Journal Voucher Approval")
            {
                ApplicationArea = All;
            }
            field("Journal Voucher Approver ID"; Rec."Journal Voucher Approver ID")
            {
                ApplicationArea = All;
            }
            field("Cash Payment Approval"; Rec."Cash Payment Approval")
            {
                ApplicationArea = All;
            }
            field("Cash Payment Approver ID"; Rec."Cash Payment Approver ID")
            {
                ApplicationArea = All;
            }
            field("Bank Contra Approval"; Rec."Bank Contra Approval")
            {
                ApplicationArea = All;
            }
            field("Bank Contra Approver ID"; Rec."Bank Contra Approver ID")
            {
                ApplicationArea = All;
            }
            field("Bank Payment Approval"; Rec."Bank Payment Approval")
            {
                ApplicationArea = All;
            }
            field("Bank Payment Approver ID"; Rec."Bank Payment Approver ID")
            {
                ApplicationArea = All;
            }
            field("Bank Reciept Approval"; Rec."Bank Reciept Approval")
            {
                ApplicationArea = All;
            }
            field("Bank Reciept Approver ID"; Rec."Bank Reciept Approver ID")
            {
                ApplicationArea = All;
            }
            field("Purchase Journal Approval"; Rec."Purchase Journal Approval")
            {
                ApplicationArea = All;
            }
            field("Purchase Journal Approver ID"; Rec."Purchase Journal Approver ID")
            {
                ApplicationArea = All;
            }
            field("Recurring Approval"; Rec."Recurring Approval")
            {
                ApplicationArea = All;
            }
            field("Recurring Approval ID"; Rec."Recurring Approval ID")
            {
                ApplicationArea = All;
            }
            field("Cash Reciept Approval"; Rec."Cash Reciept Approval")
            {
                ApplicationArea = All;
            }
            field("Cash Reciept Approval ID"; Rec."Cash Reciept Approval ID")
            {
                ApplicationArea = All;
            }
            field("Limited JV Approval Limit"; Rec."Limited JV Approval Limit")
            {
                ApplicationArea = All;
            }
            field("Jounal Voucher Approval Limit"; Rec."Jounal Voucher Approval Limit")
            {
                ApplicationArea = All;
            }
            field("Bank Payment Aproval Limit"; Rec."Bank Payment Aproval Limit")
            {
                ApplicationArea = All;
            }
            field("FA Journal Approval"; Rec."FA Journal Approval")
            {
                ApplicationArea = All;
            }
            field("FA Journal Approval ID"; Rec."FA Journal Approval ID")
            {
                ApplicationArea = All;
            }
            field("Self Approver"; Rec."Self Approver")
            {
                ApplicationArea = All;
            }
            field("Approve Customer"; Rec."Approve Customer")
            {
                ApplicationArea = All;
            }
            field("Approve Vendor"; Rec."Approve Vendor")
            {
                ApplicationArea = All;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = All;
            }
            //PCPL-25/050723

            field("Costcentre Code"; Rec."Costcentre Code")
            {
                ApplicationArea = all;
            }
            //PCPL-25/050723
        }
        //PCPL-25/030823
        addlast(Control1)
        {
            field("Posted Purchase Rcpt Modify"; Rec."Posted Purchase Rcpt Modify")
            {
                ApplicationArea = all;
            }
        }
        //PCPL-25/030823
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}