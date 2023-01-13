report 50042 "Bank Reco. Statement- New-2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/BankRecoStatementNew2.rdl';
    Caption = 'Bank Reco. Statement- RSPL';

    dataset
    {
        dataitem("Bank Account Statement"; "Bank Account Statement")
        {
            RequestFilterFields = "Bank Account No.";
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
            column(BankAccCode; BankAccCode)
            {
            }
            column(BankCurrency; BankCurrency)
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
            column(TotAmount; TotAmount)
            {
            }
            column(BankNo; BankAcc2."Bank Account No.")
            {
            }
            column(Name2_BankAcc; BankAcc2."Name 2")
            {
            }
            dataitem("<Bank Account Ledger Entry1>"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."),
                               "Statement No." = FIELD("Statement No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date")
                                    WHERE("Statement Status" = FILTER(<> Closed));
                column(PostingDate; "Posting Date")
                {
                }
                column(Description_BankAccountLedgerEntry1; "<Bank Account Ledger Entry1>".Description)
                {
                }
                column(ChequeNo; '')// "Cheque No.") PCPL-064
                {
                }
                column(ChequeDate; '')// "<Bank Account Ledger Entry1>"."Cheque Date") PCPL-064
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
                                    WHERE(Amount = FILTER(> 0),
                                          Open = FILTER(true));
                RequestFilterFields = "Posting Date";
                column(PostingDate1; "Posting Date")
                {
                }
                column(ChequeNo1; '')// "Cheque No.") PCPL-064
                {
                }
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
                column(AmountLCY111; AmountLCY1)
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

                    // CurrReport.SHOWOUTPUT(NextStatement=TRUE);
                    IF NextStatement = TRUE THEN
                        TotalUnReconciliedAmtD += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                    //END;
                    //>>RSPL-RAHUL
                    IF NextStatement = TRUE THEN BEGIN
                        AmountLCY1 += "Amount (LCY)";
                        //MESSAGE('Bank Ledger Entry AmountLCY1=%1', "Amount (LCY)");
                    END;
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
                                    WHERE(Amount = FILTER(< 0),
                                          Open = FILTER(true));
                RequestFilterFields = "Posting Date";
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
                column(TotAmountLCY2; TotAmountLCY2)
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
                    // CurrReport.SHOWOUTPUT(NextStatement=TRUE);
                    IF NextStatement = TRUE THEN
                        TotalUnReconciliedAmtC += "<Bank Account Ledger Entry2>"."Credit Amount (LCY)";
                    //END;

                    //>>RSPL-RAHUL

                    IF PreNo <> "Document No." THEN
                        TotAmountLCY2 += "Amount (LCY)";

                    PreNo := "Document No.";
                end;

                trigger OnPreDataItem()
                begin
                    LessSec := 0;
                    "<Bank Account Ledger Entry2>".SETFILTER("<Bank Account Ledger Entry2>"."Posting Date", "Bank Account Ledger Entry".GETFILTER("Bank Account Ledger Entry"."Posting Date"));
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
                IF BankAcc2.GET("Bank Account No.") THEN;
                IF bankAcc.GET("Bank Account Statement"."Bank Account No.") THEN BEGIN
                    BankAccDescription := bankAcc.Name;
                    BankAccCode := bankAcc."Name 2";       //RSPL-Rahul
                    IF bankAcc."Currency Code" <> '' THEN
                        BankCurrency := bankAcc."Currency Code"
                    ELSE
                        BankCurrency := 'INR';
                END;

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

                //>>RSPL Rahul
                CLEAR(TotAmount);
                BankAccLedgerEntry.RESET;
                BankAccLedgerEntry.SETRANGE(BankAccLedgerEntry."Bank Account No.", "Bank Account No.");
                BankAccLedgerEntry.SETFILTER(BankAccLedgerEntry."Debit Amount (LCY)", '>%1', 0);
                BankAccLedgerEntry.SETRANGE(BankAccLedgerEntry."Posting Date", MinDate, MaxDate);
                BankAccLedgerEntry.SETRANGE(Open, TRUE);
                //BankAccLedgerEntry.SETFILTER(BankAccLedgerEntry."Statement Status",'<>%1',BankAccLedgerEntry."Statement Status"::Closed);
                IF BankAccLedgerEntry.FINDSET THEN
                    REPEAT
                        Vnumber := FALSE;
                        Vcnt2 := 0;

                        IF totalcnt > 0 THEN BEGIN
                            REPEAT
                                Vcnt2 += 1;
                                IF BankAccLedgerEntry."Statement No." = Statement[Vcnt2] THEN
                                    Vnumber := TRUE;
                            UNTIL Vcnt2 = totalcnt;
                        END;
                        IF BankAccLedgerEntry."Statement Status" <> BankAccLedgerEntry."Statement Status"::Closed THEN
                            Vnumber := TRUE;

                        IF Vnumber = TRUE THEN BEGIN
                            TotAmount += BankAccLedgerEntry."Amount (LCY)";
                            MESSAGE('%1', BankAccLedgerEntry."Amount (LCY)");
                        END;
                    UNTIL BankAccLedgerEntry.NEXT = 0;
                //>> \
                /*
                CLEAR(TotAmountLCY2);
                BankAccLedgerEntry2.RESET;
                BankAccLedgerEntry2.SETRANGE(BankAccLedgerEntry2."Bank Account No.","Bank Account Statement"."Bank Account No.");
                BankAccLedgerEntry2.SETRANGE(BankAccLedgerEntry2."Posting Date",MinDate,MaxDate);
                BankAccLedgerEntry2.SETFILTER(BankAccLedgerEntry2.Amount,'<%1',0);
                BankAccLedgerEntry2.SETRANGE(BankAccLedgerEntry2.Open,TRUE);
                IF BankAccLedgerEntry2.FINDFIRST THEN REPEAT
                  {
                  BankAccLedgerEntry3.SETRANGE(BankAccLedgerEntry3."Posting Date",MinDate,MaxDate);
                  BankAccLedgerEntry3.SETFILTER(BankAccLedgerEntry3.Amount,'<%1',0);
                  BankAccLedgerEntry3.SETRANGE(BankAccLedgerEntry3.Open,TRUE);
                  IF BankAccLedgerEntry3.FINDSET THEN REPEAT
                  }
                     TotAmountLCY2 += BankAccLedgerEntry3."Amount (LCY)";
                  UNTIL BankAccLedgerEntry2.NEXT =0;
                //<<
                 MESSAGE('MinDate=%1 , MaxDate=%2',MinDate,MaxDate);
                */

            end;

            trigger OnPreDataItem()
            begin
                MinDate := "<Bank Account Ledger Entry2>".GETRANGEMIN("Posting Date");
                MaxDate := "<Bank Account Ledger Entry2>".GETRANGEMAX("Posting Date");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PostDate; PostDate)
                {
                    Caption = 'Posting Date';
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
        "--": Integer;
        BankAccCode: Code[100];
        BankCurrency: Code[20];
        "----Tot": Integer;
        AmountLCY1: Decimal;
        TotAmountLCY2: Decimal;
        "--Bank": Integer;
        BankAccLedgerEntry: Record 271;
        TotAmount: Decimal;
        Vnumber: Boolean;
        Vcnt2: Integer;
        BankAcc2: Record 270;
        BankAccLedgerEntry2: Record 271;
        BankAccLedgerEntry3: Record 271;
        "--Min": Integer;
        MinDate: Date;
        MaxDate: Date;
        PreNo: Code[20];
        PostDate: Date;
}

