pageextension 50009 PurchaseCreditMemoExt extends "Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                Rec.TestField("Purchaser Code");
            end;
        }
        modify(Post)
        {
            Trigger OnBeforeAction()
            begin
                Rec.TestField("Purchaser Code");
            end;
        }
    }

    var
        myInt: Integer;
}