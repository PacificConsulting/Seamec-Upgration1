page 50005 "Bank Acc Led. Mdfy"
{
    PageType = List;
    Permissions = TableData 271 = rimd;
    SourceTable = "Bank Account Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Bank Acc. Posting Group"; Rec."Bank Acc. Posting Group")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Our Contact Code"; Rec."Our Contact Code")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field(Positive; Rec.Positive)
                {
                }
                field("Closed by Entry No."; Rec."Closed by Entry No.")
                {
                }
                field("Closed at Date"; Rec."Closed at Date")
                {
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("Statement Status"; Rec."Statement Status")
                {
                }
                field("Statement No."; Rec."Statement No.")
                {
                }
                field("Statement Line No."; Rec."Statement Line No.")
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
                field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                }
                field("Check Ledger Entries"; Rec."Check Ledger Entries")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Location Code"; '')// Rec."Location Code") //pcpl-065
                {
                }
                field("Cheque No."; '')// Rec."Cheque No.") //pcpl-065
                {
                }
                field("Cheque Date"; '')// Rec."Cheque Date") //pcpl-065
                {
                }
                field("Stale Cheque"; '')// Rec."Stale Cheque") //pcpl-065
                {
                }
                field("Stale Cheque Expiry Date"; '')//Rec."Stale Cheque Expiry Date") //pcpl-065
                {
                }
                field("Cheque Stale Date"; '')// Rec."Cheque Stale Date") //pcpl-065
                {
                }
                field("Clearing Date"; Rec."Clearing Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

