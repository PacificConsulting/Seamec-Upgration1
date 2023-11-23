page 50059 PurchRcptHeader
{
    PageType = List;
    Permissions = TableData "Purch. Rcpt. Header" = rim;
    SourceTable = "Purch. Rcpt. Header";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Purchase Receipt Header Modify';
    Editable = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        UserSet: Record "User Setup";
    begin
        if UserSet.Get((UserId)) then;
        if UserSet."Posted Purchase Rcpt Modify" = false then
            Error('You do not have permission to open this page');
    end;


    var
        myInt: Integer;
}