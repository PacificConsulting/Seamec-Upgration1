report 50043 "Bank Reco. Statement- New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/BankRecoStatementNew.rdl';
    Caption = 'Bank Reco. Statement- RSPL';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Bank Account Statement"; "Bank Account Statement")
        {
            RequestFilterFields = "Bank Account No.", "Statement No.";
            column(companyname; CompanyInfo.Name)
            {
            }
            column(FORMAT1; FORMAT(TODAY, 0, 4))
            {
            }
            column(StatementDate; "Bank Account Statement"."Statement Date")
            {
            }
            column(PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(BankAccDescription; BankAccDescription)
            {
            }
            column(BankAccountNo; "Bank Account No.")
            {
            }
            column(StatementNo; "Statement No.")
            {
            }
            column(BalanceLastStatement; "Balance Last Statement")
            {
            }
            column(BalanceAsPerBankBook; (TotalUnReconciliedAmtD + "Bank Account Statement"."Balance Last Statement" + "<Bank Account Ledger Entry1>"."Amount (LCY)") - TotalUnReconciliedAmtC)
            {
            }
            dataitem("<Bank Account Ledger Entry1>"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."),
                               "Statement No." = FIELD("Statement No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date");
                column(PostingDate; "Posting Date")
                {
                }
                column(Description_BankAccountLedgerEntry1; "<Bank Account Ledger Entry1>".Description)
                {
                }
                column(ChequeNo; '')//"Cheque No.") //PCPL064
                {
                }
                column(ChequeDate; '')// "<Bank Account Ledger Entry1>"."Cheque Date") //PCPL-064
                {
                }
                column(DocumentNo; "Document No.")
                {
                }
                column(CurrencyCode; "Currency Code")
                {
                }
                column(LCY; "Amount (LCY)")
                {
                }
                column(AmountLCY; "<Bank Account Ledger Entry1>"."Amount (LCY)")
                {
                }
                column(BalanceAmountLCY; "Bank Account Statement"."Balance Last Statement" + "<Bank Account Ledger Entry1>"."Amount (LCY)")
                {
                }

                /*trigger OnAfterGetRecord() //PCPL-064
                begin

                    BankAccRecon.SETRANGE(BankAccRecon."Document No.", "<Bank Account Ledger Entry1>"."Document No.");
                    IF BankAccRecon.FINDFIRST THEN
                end;*/ //PCPL-064
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date")
                                    WHERE("Debit Amount (LCY)" = FILTER(<> 0));
                column(PostingDate1; "Posting Date")
                {
                }
                // column(ChequeNo1; "Cheque No.") //PCL-064
                // {
                // }
                column(DocumentNo1; "Document No.")
                {
                }
                column(PartyName1; "Bank Account Ledger Entry".Description)
                {
                }
                column(CurrencyCode1; "Currency Code")
                {
                }
                column(LCY1; "Amount (LCY)")
                {
                }
                column(TotalUnReconciliedAmtD; TotalUnReconciliedAmtD)
                {
                }
                column(addsec; addsec)
                {
                }
                column(NextStatement1; NextStatement)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //IF addsec = FALSE THEN BEGIN
                    cnt := 0;
                    NextStatement := FALSE;
                    IF totalcnt > 0 THEN BEGIN
                        REPEAT
                            cnt += 1;
                            IF "Bank Account Ledger Entry"."Statement No." = Statement[cnt] THEN
                                NextStatement := TRUE;
                        UNTIL cnt = totalcnt;
                    END;
                    IF ("Bank Account Ledger Entry"."Statement Status" <> "Bank Account Ledger Entry"."Statement Status"::Closed) THEN
                        NextStatement := TRUE;
                    //--------------section code---------

                    CurrReport.SHOWOUTPUT(NextStatement = TRUE);
                    IF NextStatement = TRUE THEN
                        TotalUnReconciliedAmtD += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                    //END;
                end;

                trigger OnPreDataItem()
                begin
                    addsec := 0;
                    "Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Posting Date", '<=%1',
                    "Bank Account Statement"."Statement Date");
                    "Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Statement No.", '<>%1', "Bank Account Statement"."Statement No."
                    );
                    IF "Bank Account Ledger Entry".FINDFIRST THEN BEGIN

                    END ELSE BEGIN
                        addsec := 1;
                        CurrReport.BREAK
                    END;
                end;
            }
            dataitem("<Bank Account Ledger Entry2>"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date")
                                    WHERE("Credit Amount (LCY)" = FILTER(<> 0));
                column(PostingDate2; "Posting Date")
                {
                }
                column(ChequeNo2; '')// "Cheque No.") PCPL-064
                {
                }
                column(DocumentNo2; "Document No.")
                {
                }
                column(PartyName2; "<Bank Account Ledger Entry2>".Description)
                {
                }
                column(CurrencyCode2; "Currency Code")
                {
                }
                column(LCY2; "Amount (LCY)")
                {
                }
                column(TotalUnReconciliedAmtC; TotalUnReconciliedAmtC)
                {
                }
                column(LessSec; LessSec)
                {
                }
                column(NextStatement2; NextStatement)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //IF LessSec = FALSE THEN BEGIN
                    cnt := 0;
                    NextStatement := FALSE;
                    IF totalcnt > 0 THEN BEGIN
                        REPEAT
                            cnt += 1;
                            IF "<Bank Account Ledger Entry2>"."Statement No." = Statement[cnt] THEN
                                NextStatement := TRUE;

                        UNTIL cnt = totalcnt;
                    END;
                    IF ("<Bank Account Ledger Entry2>"."Statement Status" <> "<Bank Account Ledger Entry2>"."Statement Status"::Closed) THEN
                        NextStatement := TRUE;

                    // Sunil
                    BankAcntStaLine.RESET;
                    BankAcntStaLine.SETRANGE(BankAcntStaLine."Document No.", "<Bank Account Ledger Entry2>"."Document No.");
                    IF BankAcntStaLine.FINDFIRST THEN
                        REPEAT
                        //PartyName := BankAcntStaLine."Party Name";
                        UNTIL BankAcntStaLine.NEXT = 0;

                    //-------------------section code-----------------
                    CurrReport.SHOWOUTPUT(NextStatement = TRUE);
                    IF NextStatement = TRUE THEN
                        TotalUnReconciliedAmtC += "<Bank Account Ledger Entry2>"."Credit Amount (LCY)"
                    //END;
                end;

                trigger OnPreDataItem()
                begin
                    LessSec := 0;
                    "<Bank Account Ledger Entry2>".SETFILTER
                    ("<Bank Account Ledger Entry2>"."Posting Date", '<=%1', "Bank Account Statement"."Statement Date");
                    "<Bank Account Ledger Entry2>".SETFILTER
                    ("<Bank Account Ledger Entry2>"."Statement No.", '<>%1', "Bank Account Statement"."Statement No.");
                    IF "<Bank Account Ledger Entry2>".FINDFIRST THEN BEGIN

                    END

                    ELSE BEGIN
                        LessSec := 1;
                        CurrReport.BREAK

                    END
                end;
            }

            trigger OnAfterGetRecord()
            begin

                IF bankAcc.GET("Bank Account Statement"."Bank Account No.") THEN
                    BankAccDescription := bankAcc.Name;

                BankAccStatement.RESET;
                BankAccStatement.SETFILTER(BankAccStatement."Bank Account No.", "Bank Account Statement"."Bank Account No.");
                BankAccStatement.SETFILTER(BankAccStatement."Statement Date", '>%1', "Bank Account Statement"."Statement Date");
                IF BankAccStatement.FINDFIRST THEN BEGIN
                    REPEAT
                        cnt += 1;
                        Statement[cnt] := BankAccStatement."Statement No.";
                    //  MESSAGE('%1, %2',Statement[cnt],cnt);
                    UNTIL BankAccStatement.NEXT = 0;
                END;
                totalcnt := cnt;
                cnt := 1;
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
        BankAccStatement: Record 275;
        Statement: array[2000] of Text[250];
        cnt: Integer;
        totalcnt: Integer;
        NextStatement: Boolean;
        TotalUnReconciliedAmtD: Decimal;
        TotalUnReconciliedAmtC: Decimal;
        CompanyInfo: Record 79;
        bankAcc: Record 270;
        BankAccDescription: Text[50];
        BankAccRecon: Record 274;
        BankAcntStaLine: Record 276;
        PartyName: Text[50];
        addsec: Integer;
        LessSec: Integer;
}

