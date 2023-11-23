pageextension 50029 PostedPurchRecpList extends "Posted Purchase Receipts"

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
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
    //PCPL-25/050723
    trigger OnOpenPage();
    var
        UserSet: Record 91;
        TmpCostCentr: Text;
    begin
        UserSet.RESET;
        UserSet.SETRANGE(UserSet."User ID", USERID);
        IF UserSet.FINDFIRST THEN BEGIN
            TmpCostCentr := UserSet."Costcentre Code";
        END;

        IF TmpCostCentr <> '' THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETFILTER("Shortcut Dimension 1 Code", TmpCostCentr);
            rec.FILTERGROUP(0);
        END;
    end;
    //PCPL-25/050723

}