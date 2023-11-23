pageextension 50022 PurchPay extends "Purchases & Payables Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("TDS Salary GL"; Rec."TDS Salary GL")
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