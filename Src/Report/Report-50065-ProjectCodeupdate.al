report 50065 ProjectCodeupdate
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/ProjectCodeupdate.rdl';
    Permissions = TableData 112 = rmd;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE("No.", 'S3-467-002');
        IF SalesInvHeader.FINDSET THEN BEGIN
            SalesInvHeader."Shortcut Dimension 2 Code" := 'S3-433';
            SalesInvHeader.MODIFY;
        END;
    end;

    var
        SalesInvHeader: Record 112;
}

