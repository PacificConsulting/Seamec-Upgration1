page 50009 "Detailed GSTLE  Modify"
{
    PageType = List;
    Permissions = TableData "Detailed GST Ledger Entry" = rim;
    SourceTable = "Detailed GST Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                }
                field("GST Component Code"; Rec."GST Component Code")
                {
                }
                field("GST Group Code"; Rec."GST Group Code")
                {
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                }
                field("GST Base Amount"; Rec."GST Base Amount")
                {
                }
                field("GST %"; Rec."GST %")
                {
                }
                field("GST Amount"; Rec."GST Amount")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Amount Loaded on Item"; Rec."Amount Loaded on Item")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("GST Without Payment of Duty"; Rec."GST Without Payment of Duty")
                {
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("User ID"; '')// Rec."User ID") //pcpl-065
                {
                }
                field(Positive; '')// Rec.Positive) //pcpl-065
                {
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                }
                field("Item Charge Entry"; Rec."Item Charge Entry")
                {
                }
                field("Reverse Charge"; Rec."Reverse Charge")
                {
                }
                field("GST on Advance Payment"; Rec."GST on Advance Payment")
                {
                }
                field("Nature of Supply"; '') //Rec."Nature of Supply") //pcpl-065
                {
                }
                field("Payment Document No."; Rec."Payment Document No.")
                {
                }
                field("GST Exempted Goods"; Rec."GST Exempted Goods")
                {
                }
                field("Location State Code"; '')// Rec."Location State Code") //pcpl-065
                {
                }
                field("Buyer/Seller State Code"; '')// Rec."Buyer/Seller State Code") //pcpl-065
                {
                }
                field("Shipping Address State Code"; '')// Rec."Shipping Address State Code") //pcpl-065
                {
                }
                field("Location  Reg. No."; Rec."Location  Reg. No.")
                {
                }
                field("Buyer/Seller Reg. No."; Rec."Buyer/Seller Reg. No.")
                {
                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                }
                field("GST Credit"; Rec."GST Credit")
                {
                }
                field("Reversal Entry"; Rec."Reversal Entry")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                }
                field("Application Doc. Type"; Rec."Application Doc. Type")
                {
                }
                field("Application Doc. No"; Rec."Application Doc. No")
                {
                }
                field("Original Doc. Type"; '')// Rec."Original Doc. Type") //pcpl-065
                {
                }
                field("Original Doc. No."; '')// Rec."Original Doc. No.") // pcpl-065
                {
                }
                field("Applied From Entry No."; Rec."Applied From Entry No.")
                {
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                }
                field("Remaining Closed"; Rec."Remaining Closed")
                {
                }
                field("GST Rounding Precision"; Rec."GST Rounding Precision")
                {
                }
                field("GST Rounding Type"; Rec."GST Rounding Type")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("GST Customer Type"; Rec."GST Customer Type")
                {
                }
                field("GST Vendor Type"; Rec."GST Vendor Type")
                {
                }
                field("CLE/VLE Entry No."; '')// Rec."CLE/VLE Entry No.")  pcpl-065
                {
                }
                field("Bill Of Export No."; '')// Rec."Bill Of Export No.")  pcpl-065
                {
                }
                field("Bill Of Export Date"; '')// Rec."Bill Of Export Date")  pcpl-065
                {
                }
                field("e-Comm. Merchant Id"; '')// Rec."e-Comm. Merchant Id")  pcpl-065
                {
                }
                field("e-Comm. Operator GST Reg. No."; '')// Rec."e-Comm. Operator GST Reg. No.")  pcpl-065
                {
                }
                field("Sales Invoice Type"; '')// Rec."Sales Invoice Type")
                {
                }
                field("Original Invoice No."; Rec."Original Invoice No.")
                {
                }
                field("Original Invoice Date"; '')// Rec."Original Invoice Date")  pcpl-065
                {
                }
                field("Reconciliation Month"; Rec."Reconciliation Month")
                {
                }
                field("Reconciliation Year"; Rec."Reconciliation Year")
                {
                }
                field(Reconciled; Rec.Reconciled)
                {
                }
                field("Credit Availed"; Rec."Credit Availed")
                {
                }
                field(Paid; Rec.Paid)
                {
                }
                field("Amount to Customer/Vendor"; '')// Rec."Amount to Customer/Vendor")  pcpl-065
                {
                }
                field("Credit Adjustment Type"; Rec."Credit Adjustment Type")
                {
                }
                field("Adv. Pmt. Adjustment"; '')// Rec."Adv. Pmt. Adjustment")  pcpl-065
                {
                }
                field("Original Adv. Pmt Doc. No."; '')// Rec."Original Adv. Pmt Doc. No.")  pcpl-065
                {
                }
                field("Original Adv. Pmt Doc. Date"; '')// Rec."Original Adv. Pmt Doc. Date")  pcpl-065
                {
                }
                field("Payment Document Date"; '')// Rec."Payment Document Date")  pcpl-065
                {
                }
                field(Cess; '')// Rec.Cess)  pcpl-065
                {
                }
                field(UnApplied; Rec.UnApplied)
                {
                }
                field("Item Ledger Entry No."; '')// Rec."Item Ledger Entry No.")  pcpl-065
                {
                }
                field("Credit Reversal"; '')// Rec."Credit Reversal")  pcpl-065
                {
                }
                field("GST Place of Supply"; Rec."GST Place of Supply")
                {
                }
                field("Item Charge Assgn. Line No."; '')// Rec."Item Charge Assgn. Line No.")  pcpl-065
                {
                }
                field("Payment Type"; Rec."Payment Type")
                {
                }
                field(Distributed; Rec.Distributed)
                {
                }
                field("Distributed Reversed"; Rec."Distributed Reversed")
                {
                }
                field("Input Service Distribution"; Rec."Input Service Distribution")
                {
                }
                field(Opening; Rec.Opening)
                {
                }
                field("Remaining Amount Closed"; '')// Rec."Remaining Amount Closed")  pcpl-065
                {
                }
                field("Remaining Base Amount"; Rec."Remaining Base Amount")
                {
                }
                field("Remaining GST Amount"; Rec."Remaining GST Amount")
                {
                }
                field("Gen. Bus. Posting Group"; '')// Rec."Gen. Bus. Posting Group")  pcpl-065
                {
                }
                field("Gen. Prod. Posting Group"; '')// Rec."Gen. Prod. Posting Group")  pcpl-065
                {
                }
                field("Reason Code"; '')// Rec."Reason Code") pcpl-065
                {
                }
                field("Dist. Document No."; Rec."Dist. Document No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

