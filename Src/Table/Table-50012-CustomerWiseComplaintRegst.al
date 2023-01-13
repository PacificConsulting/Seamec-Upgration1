table 50012 "Customer Wise Complaint Regst"
{

    fields
    {
        field(1; "Customer No"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2; "Complaint Details"; Text[30])
        {
        }
        field(3; "Salesperson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code WHERE(Code = CONST());
        }
        field(4; "CAPA/ Customer Prob."; Option)
        {
            OptionCaption = 'CAPA,Customer Problem.';
            OptionMembers = CAPA,"Customer Problem.";
        }
        field(5; "CAPA Taken Details"; Text[30])
        {
        }
        field(6; Status; Option)
        {
            OptionCaption = ' ,Open,Close';
            OptionMembers = " ",Open,Close;
        }
    }

    keys
    {
        key(Key1; "Customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

