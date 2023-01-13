page 50002 "50002"
{
    PageType = List;
    Permissions =;
    SourceTable = "Detailed Cust. Ledg. Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Cust. Ledger Entry No."; Rec."Cust. Ledger Entry No.")
                {
                }
                field("Entry Type"; Rec."Entry Type")
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
                field(Amount; Rec.Amount)
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                }
                field("Reason Code"; Rec."Reason Code")
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
                field("Initial Entry Due Date"; Rec."Initial Entry Due Date")
                {
                }
                field("Initial Entry Global Dim. 1"; Rec."Initial Entry Global Dim. 1")
                {
                }
                field("Initial Entry Global Dim. 2"; Rec."Initial Entry Global Dim. 2")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("Use Tax"; Rec."Use Tax")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                }
                field("Initial Document Type"; Rec."Initial Document Type")
                {
                }
                field("Applied Cust. Ledger Entry No."; Rec."Applied Cust. Ledger Entry No.")
                {
                }
                field(Unapplied; Rec.Unapplied)
                {
                }
                field("Unapplied by Entry No."; Rec."Unapplied by Entry No.")
                {
                }
                field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
                {
                }
                field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
                {
                }
                field("Tax Jurisdiction Code"; Rec."Tax Jurisdiction Code")
                {
                }
                field("Application No."; Rec."Application No.")
                {
                }
                field("Ledger Entry Amount"; Rec."Ledger Entry Amount")
                {
                }
                field("TDS Nature of Deduction"; '')// Rec."TDS Nature of Deduction") //pcpl-065
                {
                }
                field("TDS Group"; '')// Rec."TDS Group")  //pcpl-065
                {
                }
                field("Total TDS/TCS Incl. SHECESS"; '')// Rec."Total TDS/TCS Incl. SHECESS")  //pcpl-065
                {
                }
                field("TCS Nature of Collection"; '')//Rec."TCS Nature of Collection")  //pcpl-065
                {
                }
                field("TCS Type"; '')// Rec."TCS Type")  //pcpl-065
                {
                }
            }
        }
    }

    actions
    {
    }
}

