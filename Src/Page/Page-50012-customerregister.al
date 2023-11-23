page 50012 "customer register"
{
    SourceTable = "Customer Wise Complaint Regst";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            field("Customer No"; Rec."Customer No")
            {
            }
            field("Complaint Details"; Rec."Complaint Details")
            {
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
            }
            field("CAPA/ Customer Prob."; Rec."CAPA/ Customer Prob.")
            {
            }
            field("CAPA Taken Details"; Rec."CAPA Taken Details")
            {
            }
            field(Status; Rec.Status)
            {
                Editable = false;
            }
        }
    }

    actions
    {
    }
}

