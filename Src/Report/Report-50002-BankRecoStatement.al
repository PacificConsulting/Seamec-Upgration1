report 50002 "Bank Reco Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/BankRecoStatement.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Bank Account Statement"; "Bank Account Statement")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Bank Account No.", "Statement No.";
            column(Comp_Name; CompanyInfo.Name)
            {
            }
            column(Date; FORMAT(TODAY, 0, 4))
            {
            }
            column(UserId; USERID)
            {
            }
            column(BankAccDescription; BankAccDescription)
            {
            }
            column(BankAcc_Statment_Date; BankAccStatement."Statement Date")
            {
            }
            column(BankAccNo; "Bank Account Statement"."Bank Account No.")
            {
            }
            column(StatementDate_BankAccountStatement; "Bank Account Statement"."Statement Date")
            {
            }
            column(StatementNo; "Bank Account Statement"."Statement No.")
            {
            }
            column(Bal_Last_Statement; "Bank Account Statement"."Balance Last Statement")
            {
            }
            column(TotalUnReconciliedAmtC; TotalUnReconciliedAmtC)
            {
            }
            column(TotalUnReconciliedAmtD; TotalUnReconciliedAmtD)
            {
            }
            column(BankAccNo_BankAccount; bankAcc."Bank Account No.")
            {
            }
            dataitem("<Bank Account Ledger Entry1>"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."),
                               "Statement No." = FIELD("Statement No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date");
                column(BankAccountNo_BankAccountLedgerEntry1; "<Bank Account Ledger Entry1>"."Bank Account No.")
                {
                }
                column(StatementNo_BankAccountLedgerEntry1; "<Bank Account Ledger Entry1>"."Statement No.")
                {
                }
                column(BALE1_PostingDate; "<Bank Account Ledger Entry1>"."Posting Date")
                {
                }
                column(BALE1_ChequeNo; 0)//"<Bank Account Ledger Entry1>"."Cheque No.") PCPL-0064
                {
                }
                column(BALE1_ChequeDate; 0D)//"<Bank Account Ledger Entry1>"."Cheque Date") PCPL-0064
                {
                }
                column(BALE1_DocumentNo; "<Bank Account Ledger Entry1>"."Document No.")
                {
                }
                column(BALE1_Description; BankAccRecon."Related-Party Name")
                {
                }
                column(BALE1_CurrencyCode; "<Bank Account Ledger Entry1>"."Currency Code")
                {
                }
                column(BALE1_AmtLCY; "<Bank Account Ledger Entry1>"."Amount (LCY)")
                {
                }
                column(party; party)
                {
                }
                column(Amount_BankAccountLedgerEntry1; "<Bank Account Ledger Entry1>".Amount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*
                    BankAccRecon.SETRANGE(BankAccRecon."Document No.","<Bank Account Ledger Entry1>"."Document No.");
                    BankAccRecon.SETRANGE(BankAccRecon."Bank Account No.","Bank Account No.");
                    */
                    BankStatmentLine1.SETRANGE(BankStatmentLine1."Document No.", "<Bank Account Ledger Entry1>"."Document No.");
                    BankStatmentLine1.SETRANGE(BankStatmentLine1."Bank Account No.", "Bank Account No.");
                    //IF BankStatmentLine1.FINDFIRST THEN             //PCPL-Kunal
                    //party := BankStatmentLine1."Party Name";      //PCPL-Kunal


                    //MESSAGE('%1', "<Bank Account Ledger Entry1>"."Bank Account No.");

                end;
            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemLinkReference = "Bank Account Statement";
                DataItemTableView = SORTING("Bank Account No.", "Posting Date")
                                    WHERE("Debit Amount (LCY)" = FILTER(<> 0));
                column(BankAccountNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Bank Account No.")
                {
                }
                column(StatementNo_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Statement No.")
                {
                }
                column(DebitAmountLCY_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Debit Amount (LCY)")
                {
                }
                column(BALE_PostingDate; "Bank Account Ledger Entry"."Posting Date")
                {
                }
                column(BALE_ChequeNo; 0)//"Bank Account Ledger Entry"."Cheque No.") PCPL-0064
                {
                }
                column(BALE_DocumentNo; "Bank Account Ledger Entry"."Document No.")
                {
                }
                column(BALE_Description; PartyName1)
                {
                }
                column(BALE_CurrencyCode; "Bank Account Ledger Entry"."Currency Code")
                {
                }
                column(BALE_AmtLCY; "Bank Account Ledger Entry"."Amount (LCY)")
                {
                }
                column(NextStatement; NextStatement)
                {
                }
                column(Amount_BankAccountLedgerEntry; "Bank Account Ledger Entry".Amount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //>>
                    // Sunil
                    CLEAR(PartyName1);
                    BankAcntStaLine1.RESET;
                    BankAcntStaLine1.SETRANGE(BankAcntStaLine1."Document No.", "Document No.");
                    BankAcntStaLine1.SETRANGE(BankAcntStaLine1."Bank Account No.", "Bank Account No.");
                    //BankAcntStaLine1.SETRANGE(BankAcntStaLine1."Document No.",'BR/HO/JUL-15/1366');
                    IF BankAcntStaLine1.FINDFIRST THEN
                        //PartyName1 := PartyName1 + BankAcntStaLine1."Party Name";  //PCPL-Kunal
                        //UNTIL BankAcntStaLine1.NEXT = 0;


                        //<<
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

                    IF NextStatement = TRUE THEN
                        IF ("Bank Account Ledger Entry"."Bank Account No." = 'CBI1086') OR ("Bank Account Ledger Entry"."Bank Account No." = 'DBS1777') THEN
                            TotalUnReconciliedAmtD += "Bank Account Ledger Entry"."Debit Amount"
                        ELSE
                            TotalUnReconciliedAmtD += "Bank Account Ledger Entry"."Debit Amount (LCY)";
                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Posting Date", '<=%1',
                    "Bank Account Statement"."Statement Date");
                    "Bank Account Ledger Entry".SETFILTER("Bank Account Ledger Entry"."Statement No.", '<>%1', "Bank Account Statement"."Statement No.");
                    //"Bank Account Ledger Entry".SETFILTER
                    IF "Bank Account Ledger Entry".FINDFIRST THEN;// BEGIN

                    //R
                    /*
                    END ELSE BEGIN
                       CurrReport.BREAK
                    END;
                    */

                end;
            }
            dataitem("<Bank Account Ledger Entry2>"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No.");
                DataItemTableView = SORTING("Bank Account No.", "Posting Date")
                                    WHERE("Credit Amount (LCY)" = FILTER(<> 0));
                column(BankAccountNo_BankAccountLedgerEntry2; "<Bank Account Ledger Entry2>"."Bank Account No.")
                {
                }
                column(StatementNo_BankAccountLedgerEntry2; "<Bank Account Ledger Entry2>"."Statement No.")
                {
                }
                column(CreditAmountLCY_BankAccountLedgerEntry2; "<Bank Account Ledger Entry2>"."Credit Amount (LCY)")
                {
                }
                column(BALE2_PostingDate; "<Bank Account Ledger Entry2>"."Posting Date")
                {
                }
                column(BALE2_ChequeNo; 0)//"<Bank Account Ledger Entry2>"."Cheque No.") PCPL-0064
                {
                }
                column(BALE2_DocumentNo; "<Bank Account Ledger Entry2>"."Document No.")
                {
                }
                column(BALE2_CurrencyCode; "<Bank Account Ledger Entry2>"."Currency Code")
                {
                }
                column(BALE2_AmtLCY; "<Bank Account Ledger Entry2>"."Amount (LCY)")
                {
                }
                column(NextStatement11; NextStatement1)
                {
                }
                column(Amount_BankAccountLedgerEntry2; "<Bank Account Ledger Entry2>".Amount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE('%1',"<Bank Account Ledger Entry2>"."Bank Account No.");
                    //<< R
                    // Sunil
                    //CLEAR(PartyName); //PCPL-Kunal
                    BankAcntStaLine.RESET;
                    BankAcntStaLine.SETRANGE(BankAcntStaLine."Document No.", "<Bank Account Ledger Entry2>"."Document No.");
                    BankAcntStaLine.SETRANGE(BankAcntStaLine."Bank Account No.", "Bank Account No.");
                    IF BankAcntStaLine.FINDFIRST THEN
                        //REPEAT
                        //PartyName := BankAcntStaLine."Party Name";  //PCPL-Kunal
                        //UNTIL BankAcntStaLine.NEXT = 0;

                        cnt := 0;
                    NextStatement1 := FALSE;
                    IF totalcnt > 0 THEN BEGIN
                        REPEAT                   //R
                            cnt += 1;
                            IF "<Bank Account Ledger Entry2>"."Statement No." = Statement[cnt] THEN
                                NextStatement1 := TRUE;

                        UNTIL cnt = totalcnt;   //R
                    END;
                    IF ("<Bank Account Ledger Entry2>"."Statement Status" <> "<Bank Account Ledger Entry2>"."Statement Status"::Closed) THEN
                        NextStatement1 := TRUE;
                    //>>R


                    IF NextStatement1 = TRUE THEN
                        IF ("<Bank Account Ledger Entry2>"."Bank Account No." = 'CBI1086') OR ("<Bank Account Ledger Entry2>"."Bank Account No." = 'DBS1777') THEN
                            TotalUnReconciliedAmtC += "<Bank Account Ledger Entry2>"."Credit Amount"
                        ELSE
                            TotalUnReconciliedAmtC += "<Bank Account Ledger Entry2>"."Credit Amount (LCY)";
                    //MESSAGE('%1',NextStatement);
                end;

                trigger OnPreDataItem()
                begin
                    "<Bank Account Ledger Entry2>".SETFILTER
                    ("<Bank Account Ledger Entry2>"."Posting Date", '<=%1', "Bank Account Statement"."Statement Date");
                    "<Bank Account Ledger Entry2>".SETFILTER
                    ("<Bank Account Ledger Entry2>"."Statement No.", '<>%1', "Bank Account Statement"."Statement No.");
                    IF "<Bank Account Ledger Entry2>".FINDFIRST THEN BEGIN

                    END
                    //R
                    /*
                    //ELSE  BEGIN
                    //  CurrReport.BREAK
                    //END
                    */
                    //R

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

    trigger OnPreReport()
    begin
        CompanyInfo.GET;

        TotalUnReconciliedAmtD := 0;
        TotalUnReconciliedAmtC := 0;
    end;

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
        BankAcntStaLine: Record 276;
        BankAcntStaLine1: Record 276;
        PartyName1: Text[200];
        NextStatement1: Boolean;
        BankAccRecon: Record 274;
        "----": Integer;
        BankStatmentLine1: Record 276;
        BankStatmentLine2: Record 276;
        party: Text[200];
}

