pageextension 50020 ChartofAccExt extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field("Account Group"; Rec."Account Group")
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