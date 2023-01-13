page 50028 "Update GST Led Entry"
{
    PageType = List;
    Permissions = TableData "GST Ledger Entry" = rim;
    SourceTable = "GST Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("GST Base Amount"; Rec."GST Base Amount")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field("Purchase Group Type"; Rec."Purchase Group Type")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("GST Component Code"; Rec."GST Component Code")
                {
                }
                field("GST on Advance Payment"; Rec."GST on Advance Payment")
                {
                }
                field("Reverse Charge"; Rec."Reverse Charge")
                {
                }
                field("GST Amount"; Rec."GST Amount")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                }
                field(UnApplied; Rec.UnApplied)
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Payment Type"; Rec."Payment Type")
                {
                }
                field("Input Service Distribution"; Rec."Input Service Distribution")
                {
                }
                field(Availment; Rec.Availment)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Bal. Account No. 2"; Rec."Bal. Account No. 2")
                {
                }
                field("Account No. 2"; Rec."Account No. 2")
                {
                }
                field("E-Way Bill"; '')// Rec."E-Way Bill") //pcpl-065
                {
                }
            }
        }
    }

    actions
    {
    }
}

