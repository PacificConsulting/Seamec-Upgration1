report 50050 "Trial Balance gitl"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/TrialBalancegitl.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            CalcFields = "Net Change", "Balance at Date";
            DataItemTableView = SORTING("No.")
                                WHERE("Account Type" = FILTER(Posting));
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 1 Filter";
            column(CompInfoName; CompInfo.Name)
            {
            }
            column(ComAddress; CompInfo.Address + ' ' + CompInfo."Address 2" + ' ' + CompInfo.City + ' ' + CompInfo."Post Code" + ' ' + CompInfo.County)
            {
            }
            column(FilterShows; "G/L Account".TABLECAPTION + ': ' + GLFilter + ' ' + DimValueName)
            {
            }
            column(GLAccNo; "G/L Account"."No.")
            {
            }
            column(GlNAme; "G/L Account".Name)
            {
            }
            column(BaltoDateDebitOpening; GLAccount."Balance at Date")
            {
            }
            column(BaltoDateCreditOpening; -GLAccount."Balance at Date")
            {
            }
            column(BaltoDateDebitClosing; "G/L Account"."Balance at Date")
            {
            }
            column(DebitAmt; "Debit Amount")
            {
            }
            column(CreditAmt; "Credit Amount")
            {
            }
            column(BaltoDateCreditClosing; -"G/L Account"."Balance at Date")
            {
            }
            column(TotalOPeningDebitNetChange; TotalOPeningDebitNetChange)
            {
            }
            column(TotalOpeningCreditNetChange; TotalOpeningCreditNetChange)
            {
            }
            column(TotalDebitAmount; TotalDebitAmount)
            {
            }
            column(TotalCreditAmount; TotalCreditAmount)
            {
            }
            column(TotalDebitBalanceAtDate; TotalDebitBalanceAtDate)
            {
            }
            column(TotalCreditBalanceAtDate; TotalCreditBalanceAtDate)
            {
            }
            column(Time; TIME)
            {
            }

            trigger OnAfterGetRecord()
            begin
                GLAccount.RESET;
                GLAccount.SETRANGE("Date Filter", 0D, CLOSINGDATE(StartDate - 1));
                GLAccount.SETRANGE(GLAccount."No.", "No.");
                GLAccount.SETRANGE("Account Type", GLAccount."Account Type"::Posting);
                IF GLAccount.FINDSET THEN
                    REPEAT
                        GLAccount.CALCFIELDS("Net Change", "Balance at Date");
                        IF GLAccount."Balance at Date" > 0 THEN
                            TotalOPeningDebitNetChange += GLAccount."Balance at Date"
                        ELSE
                            TotalOpeningCreditNetChange += -GLAccount."Balance at Date";
                    UNTIL GLAccount.NEXT = 0;
                CALCFIELDS("Net Change", "Balance at Date", "Debit Amount", "Credit Amount");  //GITL-003

                IF "G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting THEN BEGIN
                    IF "Net Change" > 0 THEN
                        TotalDebitNetChange += "G/L Account"."Net Change"
                    ELSE
                        TotalCreditNetChange += -"G/L Account"."Net Change";
                END;

                IF "G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting THEN BEGIN
                    IF "Balance at Date" > 0 THEN
                        TotalDebitBalanceAtDate += "G/L Account"."Balance at Date"
                    ELSE
                        TotalCreditBalanceAtDate += -"G/L Account"."Balance at Date";
                END;
                //GITL-003-start
                IF "G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting THEN BEGIN
                    TotalDebitAmount += "G/L Account"."Debit Amount";
                    TotalCreditAmount += "G/L Account"."Credit Amount";
                END;
                ////GITL-003 -end
            end;

            trigger OnPreDataItem()
            begin

                GLFilter := "G/L Account".GETFILTERS;
                PeriodText := "G/L Account".GETFILTER("Date Filter");
                StartDate := "G/L Account".GETRANGEMIN("G/L Account"."Date Filter");
                DimValue := "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter");
                TempExcelBuffer1.DELETEALL;
                CompInfo.GET;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Show Account With Balance"; SHowAccountwithBalance)
                {
                    ApplicationArea = All;
                }
                field("Print To Excel"; "Export To Excel")
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        SHowAccountwithBalance := TRUE;
    end;

    trigger OnPostReport()
    begin
        /*
        IF "Export To Excel" THEN BEGIN
        
          TempExcelBuffer1.CreateBookAndOpenExcel('Trial Balance', '', COMPANYNAME,'', USERID);
          TempExcelBuffer1.GiveUserControl;
        END;
        */

    end;

    var
        TempExcelBuffer1: Record 370 temporary;
        GLFilter: Text[250];
        PeriodText: Text[30];
        PrintToExcel: Boolean;
        CurrFormat: Text[30];
        TotalDebitNetChange: Decimal;
        TotalCreditNetChange: Decimal;
        TotalDebitBalanceAtDate: Decimal;
        TotalCreditBalanceAtDate: Decimal;
        StartDate: Date;
        TotalOPeningDebitNetChange: Decimal;
        TotalOpeningCreditNetChange: Decimal;
        GLAccount: Record 15;
        DimValue: Code[20];
        RowNo: Integer;
        Columnno: Integer;
        "Export To Excel": Boolean;
        CompInfo: Record 79;
        User: Record 2000000120;
        OpeningDB: Decimal;
        OpeningCR: Decimal;
        ClosingDB: Decimal;
        ClosingCr: Decimal;
        SHowAccountwithBalance: Boolean;
        RecDimValue: Record 349;
        DimValueName: Text[150];
        GeneralLedgerSetup: Record 98;
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;

    [Scope('Internal')]
    procedure EnterCell(RowNo: Integer; Columnno: Integer; CellValue: Text[250]; Bold: Boolean; UnderLine: Boolean)
    begin
    end;
}

