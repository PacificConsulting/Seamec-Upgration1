table 50001 "Invoice Type"
{
    //  Name             Version          Date         Description
    //  -----------------------------------------------------------------------------------
    //  Dhanashri        001              11.03.11     New Field is added-resource group no

    //LookupPageID = 50001; //pcpl-065

    fields
    {
        field(1; "Code"; Code[20])
        {
            Description = 'GITL';
        }
        field(2; Description; Text[50])
        {
            Description = 'GITL';
        }
        field(3; "Resource Group No."; Code[20])
        {
            Description = '001';
            TableRelation = "Resource Group";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

