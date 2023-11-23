report 50041 "Bank Reco"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/BankReco.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(TotalAmounttest; TotalAmount)
            {
            }
            column(BankName; BankName)
            {
            }
            column(BankAdd; recBanAcc.Address)
            {
            }
            column(BankAdd2; recBanAcc."Address 2")
            {
            }
            column(BankCodeCity; recBanAcc."Post Code" + recBanAcc.City)
            {
            }
            column(BankPhNo; recBanAcc."Phone No.")
            {
            }
            column(BankBranchNo; recBanAcc."Bank Branch No.")
            {
            }
            column(BankAccount; recBanAcc."Bank Account No.")
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(OpeningAmt; (OpeningAmt))
            {
            }
        }
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Bank Account No.", "Posting Date", Amount)
                                ORDER(Ascending)
                                WHERE(Amount = FILTER(< 0),
                                      Open = CONST(true));
            RequestFilterFields = "Bank Account No.";
            column(ComName; recCompanyinformation.Name + recCompanyinformation."Name 2")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(ChequeNo; '')//"Cheque No.") PCPL-064
            {
            }
            column(ChequeDates; '')//"Cheque Date")  //PCPL-064
            {
            }
            column(ClearingDate_BankAccountLedgerEntry; '')//"Bank Account Ledger Entry"."Clearing Date") PCPL-064
            {
            }
            column(TotalofUpper; TotAmt)
            {
            }
            column(desc; desc)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            column(Amount; ABS(Amount))
            {
            }
            column(PostedNarration_Narration; '')// PostedNarration.Narration) PCPL-064
            {
            }
            column(TotalAddamount; ABS(TotalAddamount))
            {
            }
            column(Open_BankAccountLedgerEntry; "Bank Account Ledger Entry".Open)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //>>PCPL

                //PCPL-064
                /*IF "Clearing Date" <> 0D THEN
                    IF "Clearing Date" <= EndDate THEN
                        CurrReport.SKIP;*/ //PCPL-064
                                           //<<PCPL
                recBanAcc.RESET;
                IF recBanAcc.GET("Bank Account No.") THEN;
                BankName := recBanAcc.Name; // 16 10 2017

                recCompanyinformation.RESET;
                IF recCompanyinformation.GET() THEN;



                TotalAmt += "Bank Account Ledger Entry".Amount;
                desc := "Bank Account Ledger Entry".Description;

                IF "Transaction No." <> 0 THEN BEGIN
                    recCustLedgEntry.RESET;
                    recCustLedgEntry.SETRANGE("Transaction No.", "Transaction No.");
                    IF recCustLedgEntry.FINDFIRST THEN
                        desc := recCustLedgEntry.Description;

                    recVendLedgentry.RESET;
                    recVendLedgentry.SETRANGE("Transaction No.", "Transaction No.");
                    IF recVendLedgentry.FINDFIRST THEN
                        desc := recVendLedgentry.Description;
                END;


                decSum += Amount;
                decAllNegveAmount += Amount;

                TotalAddamount += Amount;
                //PCPL-064
                /* PostedNarration.RESET;
                 PostedNarration.SETCURRENTKEY("Transaction No.");
                 PostedNarration.SETRANGE("Transaction No.", "Transaction No.");
                 IF PostedNarration.FINDFIRST THEN;*/ //PCPl-064
                //Section Code
            end;

            trigger OnPostDataItem()
            begin
                TotalofUpper := (OpeningAmt) + ABS(TotalAddamount);
                TotAmt := ABS(OpeningAmt + TotalAmt);
            end;

            trigger OnPreDataItem()
            begin
                SETRANGE("Posting Date", StartDate, EndDate);
                //SETFILTER("Clearing Date",'%1|>%2',0D,EndDate);
                //SETFILTER("Clearing Date",'>%1',EndDate);
                //SETFILTER(Open,'%1',TRUE); // 16 10 2017
            end;
        }
        dataitem("<Bank Account Ledger Entry1>"; "Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING("Bank Account No.", "Posting Date", Amount)
                                WHERE(Amount = FILTER(> 0),
                                      "Posting Date" = FILTER(<> ''));
            column(PostingDate1; "Posting Date")
            {
            }
            column(ChequeNo1; '')//"Cheque No.")// PCPL-064
            {
            }
            column(ChequeDate1; '')//"Cheque Date") //PCPL-064
            {
            }
            column(desc1; desc)
            {
            }
            column(Amount1; "<Bank Account Ledger Entry1>".Amount)
            {
            }
            column(Narration1; '')// PostedNarration.Narration) PCPL-064
            {
            }
            column(UserName; recUser."User Name")
            {
            }
            column(Opening1; OpeningTot)
            {
            }
            column(TotalLessAmount; TotalLessAmount)
            {
            }
            dataitem(Integer1; Integer)
            {
                DataItemTableView = SORTING(Number);
                MaxIteration = 1;
            }

            trigger OnAfterGetRecord()
            begin
                //Section Code

                desc := '';

                desc := "Bank Account Ledger Entry".Description;

                IF "Transaction No." <> 0 THEN BEGIN
                    recCustLedgEntry.RESET;
                    recCustLedgEntry.SETRANGE("Transaction No.", "Transaction No.");
                    IF recCustLedgEntry.FINDFIRST THEN
                        desc := recCustLedgEntry.Description;

                    recVendLedgentry.RESET;
                    recVendLedgentry.SETRANGE("Transaction No.", "Transaction No.");
                    IF recVendLedgentry.FINDFIRST THEN
                        desc := recVendLedgentry.Description;
                END;

                decSum += Amount;
                decAllNegveAmount += Amount;
                //PCPL-064
                /*PostedNarration.RESET;
                PostedNarration.SETCURRENTKEY("Transaction No.");
                PostedNarration.SETRANGE("Transaction No.", "Transaction No.");
                IF PostedNarration.FINDFIRST THEN;*/ //PCPL-064
                //Section Code

                TotalLessAmount += 0;//"<Bank Account Ledger Entry1>".Amount; //PCPL-064
            end;

            trigger OnPostDataItem()
            begin
                //OpeningTot:=(OpeningAmt)+ABS(TotalAddamount)-TotalLessAmount;
                OpeningTot := TotalofUpper - TotalLessAmount;
                //MESSAGE('%1',OpeningTot);
            end;

            trigger OnPreDataItem()
            begin

                SETRANGE("<Bank Account Ledger Entry1>"."Bank Account No.", BankActNo);
                SETRANGE("Posting Date", 0D, EndDate);
                // SETFILTER("<Bank Account Ledger Entry1>"."Clearing Date", '%1|>%2', 0D, EndDate); //PCPL-064
                SETFILTER(Open, '%1', TRUE);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = All;
                }
                field("End Date"; EndDate)
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

    trigger OnPreReport()
    begin

        BankActNo := "Bank Account Ledger Entry".GETFILTER("Bank Account No.");

        recBALE.RESET;
        recBALE.SETRANGE("Bank Account No.", BankActNo);
        recBALE.SETRANGE("Posting Date", 0D, EndDate);
        IF recBALE.FINDFIRST THEN
            REPEAT
                OpeningAmt += recBALE.Amount;

            UNTIL recBALE.NEXT = 0;
        IF recBanAcc.GET(recBALE."Bank Account No.") THEN;
        BankName := recBanAcc.Name; // 16 10 2017
        IF BankStatement.GET(recBALE."Bank Account No.", recBALE."Statement No.") THEN
            TotalAmount := BankStatement."Statement Ending Balance";
        MESSAGE(FORMAT(TotalAmount));
    end;

    var
        recBanAcc: Record 270;
        intstatmentNo: Integer;
        desc: Text[50];
        recCust: Record 18;
        recGLAcc: Record 15;
        recVend: Record 23;
        decSum: Decimal;
        RecBAnkReconStat: Record 273;
        recBankAccLedEntery: Record 271;
        decSumTemp: Decimal;
        decAllNegveAmount: Decimal;
        decAllPosveAmount: Decimal;
        recCompanyinformation: Record 79;
        //PostedNarration: Record "Posted Narration"; //16548; PCPL-064

        EndDate: Date;
        recBALE: Record 271;
        OpeningAmt: Decimal;
        BankActNo: Code[20];
        TotalLessAmount: Decimal;
        TotalAddamount: Decimal;
        recUser: Record 2000000120;
        recCustLedgEntry: Record 21;
        recVendLedgentry: Record 25;
        recBankLedgEntry: Record 271;
        OpeningTot: Decimal;
        TotalofUpper: Decimal;
        BankName: Text;
        TotalAmt: Decimal;
        StartDate: Date;
        TotAmt: Decimal;
        BankStatement: Record 275;
        TotalAmount: Decimal;
}

