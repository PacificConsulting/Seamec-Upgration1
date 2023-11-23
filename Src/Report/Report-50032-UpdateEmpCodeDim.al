report 50032 "Update Emp Code Dim"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No.");

                trigger OnAfterGetRecord()
                begin

                    //RecLedDimEntry.SETRANGE(RecLedDimEntry."Table ID", 17); pcpl-064
                    //RecLedDimEntry.SETRANGE(RecLedDimEntry."Entry No.", "Entry No.");  pcpl-064
                    RecLedDimEntry.SETRANGE(RecLedDimEntry."Dimension Code", 'EMPLOYEE');
                    IF RecLedDimEntry.FINDFIRST THEN BEGIN
                        // "Employee Code" = '' THEN BEGIN
                        // "Employee Code" := RecLedDimEntry."Dimension Value Code"; pcpl-064

                        MODIFY;
                    END;
                END;
                //end; pcpl-064
            }
        }
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

    var
        RecLedDimEntry: Record 355;
}

