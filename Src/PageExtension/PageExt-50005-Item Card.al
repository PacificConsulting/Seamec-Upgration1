pageextension 50005 Itemcard extends "Item Card"
{
    layout
    {
        addafter("Qty. on Asm. Component")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
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