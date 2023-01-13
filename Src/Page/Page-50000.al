page 50000 "50000"
{
    PageType = List;
    Permissions = TableData 25 = rim;
    SourceTable = "Vendor Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
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
                field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
                {
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Purchase (LCY)"; Rec."Purchase (LCY)")
                {
                }
                field("Inv. Discount (LCY)"; Rec."Inv. Discount (LCY)")
                {
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("On Hold"; Rec."On Hold")
                {
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                }
                field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Rcd.(LCY)"; Rec."Pmt. Disc. Rcd.(LCY)")
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
                field("Closed by Amount"; Rec."Closed by Amount")
                {
                }
                field("Applies-to ID"; Rec."Applies-to ID")
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
                field("Closed by Amount (LCY)"; Rec."Closed by Amount (LCY)")
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
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Closed by Currency Code"; Rec."Closed by Currency Code")
                {
                }
                field("Closed by Currency Amount"; Rec."Closed by Currency Amount")
                {
                }
                field("Adjusted Currency Factor"; Rec."Adjusted Currency Factor")
                {
                }
                field("Original Currency Factor"; Rec."Original Currency Factor")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Tolerance Date"; Rec."Pmt. Disc. Tolerance Date")
                {
                }
                field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
                {
                }
                field("Accepted Payment Tolerance"; Rec."Accepted Payment Tolerance")
                {
                }
                field("Accepted Pmt. Disc. Tolerance"; Rec."Accepted Pmt. Disc. Tolerance")
                {
                }
                field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
                {
                }
                field("Amount to Apply"; Rec."Amount to Apply")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                }
                field("Applying Entry"; Rec."Applying Entry")
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
                field(Prepayment; Rec.Prepayment)
                {
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                }
                field("Applies-to Ext. Doc. No."; Rec."Applies-to Ext. Doc. No.")
                {
                }
                field("Recipient Bank Account"; Rec."Recipient Bank Account")
                {
                }
                field("Message to Recipient"; Rec."Message to Recipient")
                {
                }
                field("Exported to Payment File"; Rec."Exported to Payment File")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("TDS Nature of Deduction"; '') //Rec."TDS Nature of Deduction")//pcpl-065
                {
                }
                field("TDS Group"; '')// Rec."TDS Group") //pcpl-065
                {
                }
                field("Total TDS Including SHE CESS"; Rec."Total TDS Including SHE CESS")
                {
                }
                field("Serv. Tax on Advance Payment"; '')// Rec."Serv. Tax on Advance Payment") //pcpl-065
                {
                }
                field("Input Service Distribution"; '')// Rec."Input Service Distribution") //pcpl-065
                {
                }
                field(PoT; '')// Rec.PoT) //pcpl-065
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("GST on Advance Payment"; Rec."GST on Advance Payment")
                {
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                }
                field("GST Reverse Charge"; Rec."GST Reverse Charge")
                {
                }
                field("Adv. Pmt. Adjustment"; Rec."Adv. Pmt. Adjustment")
                {
                }
                field("Location State Code"; Rec."Location State Code")
                {
                }
                field("Buyer State Code"; Rec."Buyer State Code")
                {
                }
                field("Buyer GST Reg. No."; Rec."Buyer GST Reg. No.")
                {
                }
                field("GST Vendor Type"; Rec."GST Vendor Type")
                {
                }
                field("Location GST Reg. No."; Rec."Location GST Reg. No.")
                {
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                }
                field("GST Input Service Distribution"; Rec."GST Input Service Distribution")
                {
                }
                field("Print Document"; Rec."Print Document")
                {
                }
                field("Applied Gen. Line No."; Rec."Applied Gen. Line No.")
                {
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                }
                field("Vendor Invoice Date"; Rec."Vendor Invoice Date")
                {
                    AccessByPermission = TableData 25 = RIM;
                }
            }
        }
    }

    actions
    {
    }
}

