page 50014 "dimension setid"
{
    PageType = List;
    SourceTable = "G/L Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
            }
        }
    }

    actions
    {
    }
}

