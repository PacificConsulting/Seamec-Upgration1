pageextension 50026 PurchInvList extends "Purchase Invoices"

{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("P&osting")
        {
            action("Purchase Data Upload")
            {
                ApplicationArea = Basic, Suite;
                Image = EditList;
                Caption = 'Purchase  Data Upload';
                RunObject = xmlport "Purchase Document Upload";
            }
        }
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