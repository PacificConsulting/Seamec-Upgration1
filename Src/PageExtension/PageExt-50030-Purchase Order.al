pageextension 50030 PurchOrd extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        modify("Due Date")
        {
            Visible = false;
        }
        modify("VAT Reporting Date")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = false;
        }
        modify("Requested Receipt Date")
        {
            Visible = false;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            trigger OnAfterValidate()
            begin
                Rec.Validate("Expected Receipt Date", CalcDate('<90D>', Rec."Order Date"));
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}