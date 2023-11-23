pageextension 50021 GLAccCardExt extends "G/L Account Card"
{
    layout
    {
        addafter("Account Type")
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