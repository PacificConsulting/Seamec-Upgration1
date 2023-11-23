page 50020 "G/L entry Manipulation"
{
    PageType = List;
    Permissions = TableData 17 = rim;
    SourceTable = "G/L Entry";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

