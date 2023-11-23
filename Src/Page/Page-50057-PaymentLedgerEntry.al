page 50057 "Payment Ledger Entry"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payment Ledger Entry";
    ApplicationArea = All;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Applied VLE Entry No."; Rec."Applied VLE Entry No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Payment Posting Date"; Rec."Payment Posting Date")
                {
                }
                field("Payment Document No."; Rec."Payment Document No.")
                {
                }
                field("Invoice Document No."; Rec."Invoice Document No.")
                {
                }
                field("Invoice Posting Date"; Rec."Invoice Posting Date")
                {
                }
                field("Invoice Amount"; Rec."Invoice Amount")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Applied Amount (LCY)"; Rec."Applied Amount (LCY)")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                // field("Replicate in EAM"; "Replicate in EAM") //pcpl-065
                // {
                // }
                // field("Replicated in EAM"; "Replicated in EAM") //pcpl-065
                // {
                // }
                field("VLE Entry No."; Rec."VLE Entry No.")
                {
                }
                field(Unapply; Rec.Unapply)
                {
                }
                field("Purchase Order No"; Rec."Purchase Order No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

