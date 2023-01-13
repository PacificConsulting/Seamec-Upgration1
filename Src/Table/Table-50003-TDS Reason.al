table 50003 "TDS Reason"
{
    //DrillDownPageID = 50007; //pcpl-065
    //LookupPageID = 50007; //pcpl-065

    fields
    {
        field(1; "TDS Reason Code"; Code[20])
        {
        }
        field(2; "TDS Reason Discription"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "TDS Reason Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

