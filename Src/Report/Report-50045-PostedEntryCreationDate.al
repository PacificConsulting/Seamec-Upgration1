report 50045 "Posted Entry Creation Date"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/PostedEntryCreationDate.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "G/L Account No.", "Posting Date";
            column(Amount_GLEntry; "G/L Entry".Amount)
            {
            }
            column(GLAccountName_GLEntry; "G/L Entry"."G/L Account Name")
            {
            }
            column(GLAccountNo_GLEntry; "G/L Entry"."G/L Account No.")
            {
            }
            column(UserID_GLEntry; "G/L Entry"."User ID")
            {
            }
            column(EntryNo_GLEntry; "G/L Entry"."Entry No.")
            {
            }
            column(DebitAmount_GLEntry; "G/L Entry"."Debit Amount")
            {
            }
            column(CreditAmount_GLEntry; "G/L Entry"."Credit Amount")
            {
            }
            column(PostingDate_GLEntry; "G/L Entry"."Posting Date")
            {
            }
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            {
            }
            column(CreationDate; CreationDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                RecGLRegister.RESET;
                RecGLRegister.SETRANGE(RecGLRegister."From Entry No.", "Entry No.");
                IF RecGLRegister.FINDFIRST THEN BEGIN
                    CreationDate := RecGLRegister."Creation Date";
                END
            end;
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
        CreationDate: Date;
        RecGLRegister: Record 45;
}

