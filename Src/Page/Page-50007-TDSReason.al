page 50007 "TDS Reason"
{
    PageType = List;
    SourceTable = "50003";

    layout
    {
        area(content)
        {
            repeater(Group)
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

