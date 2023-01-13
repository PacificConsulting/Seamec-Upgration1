pageextension 50004 VendLedgEntrExt extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field("Print Document"; Rec."Print Document")
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