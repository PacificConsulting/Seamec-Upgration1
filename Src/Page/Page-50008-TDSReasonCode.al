page 50008 "TDS Reason Code"
{
    Caption = 'Gen. Product Posting Groups';
    PageType = List;
    SourceTable = "TDS Reason";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(control1)
            {
                field("TDS Reason Code"; Rec."TDS Reason Code")
                {
                }
                field("TDS Reason Discription"; Rec."TDS Reason Discription")
                {
                }
            }
        }
    }

    actions
    {
    }
}

