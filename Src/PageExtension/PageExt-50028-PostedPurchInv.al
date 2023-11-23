pageextension 50028 PostedPurchInvList extends "Posted Purchase Invoices"

{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here

        addafter("Co&mments")
        {
            action("Print Voucher")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    myInt: Integer;
                    GLEntry: Record 17;
                    PIH: Record "Purch. Inv. Header";
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", Rec."No.");
                    GLEntry.SETRANGE("Posting Date", Rec."Posting Date");
                    IF GLEntry.FINDFIRST THEN
                        REPORT.RUNMODAL(REPORT::"Posted Voucher", TRUE, TRUE, GLEntry);
                end;
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