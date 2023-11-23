pageextension 50032 PostedPurchaseREceiptLine extends "Posted Purchase Receipt Lines"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = all;
            }
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}