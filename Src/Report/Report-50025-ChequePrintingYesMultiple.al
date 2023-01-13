report 50025 "Cheque Printing -Yes Multiple"
{
    // <changelog>
    //   <change id="IN0090" dev="AUGMENTUM" date="2008-06-16" area="Finance"
    //    baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20365">
    //    Report Transformation - localized Report Layout.</change>
    //   <change id="IN0091" dev="AUGMENTUM" date="2009-03-12" area="Finance"
    //    baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS33716">
    //    Report Transformation, adjusted the layout for new client</change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './ChequePrintingYesMultiple.rdl';

    Caption = 'Check';
    Permissions = TableData 270 = m;

    dataset
    {
        dataitem(VoidGenJnlLine; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Posting Date";

            trigger OnAfterGetRecord()
            var
                GenJnlLine4: Record 81;
            begin
                TempJnlBankCharges.DELETEALL;
                GenJnlLine4.RESET;
                GenJnlLine4.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                GenJnlLine4.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJnlLine4.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJnlLine4.SETRANGE("Posting Date", "Posting Date");
                GenJnlLine4.SETRANGE("Document No.", "Document No.");
                GenJnlLine4.SETRANGE("Account Type", GenJnlLine4."Account Type"::"Bank Account");
                IF GenJnlLine4.FINDFIRST THEN BEGIN
                    JnlBankCharges.RESET;
                    JnlBankCharges.SETRANGE("Journal Template Name", "Journal Template Name");
                    JnlBankCharges.SETRANGE("Journal Batch Name", "Journal Batch Name");
                    JnlBankCharges.SETRANGE("Line No.", GenJnlLine4."Line No.");
                    JnlBankCharges.CALCSUMS(JnlBankCharges.Amount, JnlBankCharges."Amount (LCY)");
                    IF JnlBankCharges.FINDSET THEN
                        REPEAT
                            TempJnlBankCharges.TRANSFERFIELDS(JnlBankCharges);
                            TempJnlBankCharges.INSERT;
                            JnlBankCharges.DELETE;
                        UNTIL JnlBankCharges.NEXT = 0;
                END;
                CheckManagement.VoidCheck(VoidGenJnlLine);

                IF TempJnlBankCharges.FINDSET THEN
                    REPEAT
                        JnlBankCharges.TRANSFERFIELDS(TempJnlBankCharges);
                        JnlBankCharges.INSERT;
                    UNTIL TempJnlBankCharges.NEXT = 0;
                TempJnlBankCharges.DELETEALL;
            end;

            trigger OnPreDataItem()
            begin
                //IF CurrReport.PREVIEW THEN
                //  ERROR(Text000);

                IF UseCheckNo = '' THEN
                    ERROR(Text001);

                IF TestPrint THEN
                    CurrReport.BREAK;

                IF NOT ReprintChecks THEN
                    CurrReport.BREAK;

                IF (GETFILTER("Line No.") <> '') OR (GETFILTER("Document No.") <> '') THEN
                    ERROR(
                      Text002, FIELDCAPTION("Line No."), FIELDCAPTION("Document No."));
                SETRANGE("Bank Payment Type", "Bank Payment Type"::"Computer Check");
                SETRANGE("Check Printed", TRUE);
            end;
        }
        dataitem(GenJnlLine; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
            column(sUMmm; 0)//SUM) PCPL-064
            {
            }
            column(Check_No; CheckNo)
            {
            }
            column(txtOnAccOf; txtOnAccOf)
            {
            }
            column(CheckInFavourOf; CheckInFavourOf)
            {
            }
            column(Project; "Shortcut Dimension 2 Code")
            {
            }
            column(Cost_Centre; "Shortcut Dimension 1 Code")
            {
            }
            column(CreditAmount_GenJnlLine; LineAmountTotal)
            {
            }
            column(BankName; BankName)
            {
            }
            column(DescriptionText; LineDescriptiontext)
            {
            }
            column(Amount; 0)//ABS(Amount - "TDS/TCS Amount")) PCPL-064
            {
            }
            column(Payee; blnPayee)
            {
            }
            column(Amount_GenJnlLine; ABS("Debit Amount"))
            {
            }
            column(DocDate; FORMAT(Docdatejnl))
            {
            }
            column(AccPayee; txtAcPayee)
            {
            }
            column(ChequeDate; txtChqDate)
            {
            }
            column(CheckToName; UPPERCASE(ChecktoName))
            {
            }
            column(boolPrintAuthSign; boolPrintAuthSign)
            {
            }
            column(AmntInWrds; NumberText[1])
            {
            }
            column(txtPrnDtl; txtPrnDtl)
            {
            }
            column(JnlTemplateName_GenJnlLine; "Journal Template Name")
            {
            }
            column(JnlBatchName_GenJnlLine; "Journal Batch Name")
            {
            }
            column(LineNo_GenJnlLine; "Line No.")
            {
            }
            column(DocumentNo_Body; "Document No.")
            {
            }
            column(Narration; Narretion)
            {
            }
            dataitem(CheckPages; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(CheckToAddr1; CheckToAddr[1])
                {
                }
                column(CheckDateText1; CheckDateText)
                {
                }
                column(CheckNoText1; CheckNoText)
                {
                }
                column(FirstPage; FirstPage)
                {
                }
                column(PreprintedStub; PreprintedStub)
                {
                }
                column(CheckNoCaption; CheckNoCaptionLbl)
                {
                }
                dataitem(PrintSettledLoop; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 30;
                    column(NetAmt; NetAmount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalLineDiscLineDisc; TotalLineDiscount - LineDiscount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalLineAmtLineAmt; TotalLineAmount - LineAmount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalLineAmtLineAmt2; TotalLineAmount - LineAmount2 - TDSAmount - WorkTaxAmount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TDSAmtWorkTaxAmt; TDSAmount + WorkTaxAmount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(LineAmt; LineAmount - TDSAmount - WorkTaxAmount + JnlBankCharges.Amount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(LineDisc; LineDiscount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(LineAmtLineDisc; LineAmount + LineDiscount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(DocNo; DocNo)
                    {
                    }
                    column(CurrencyCode2; CurrencyCode2)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(CurrentLineAmt; LineAmount2 - TDSAmount - WorkTaxAmount + JnlBankCharges.Amount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(JnlBankChargesAmt; JnlBankCharges.Amount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(NetAmtCaption; NetAmtCaptionLbl)
                    {
                    }
                    column(DiscCaption; DiscCaptionLbl)
                    {
                    }
                    column(AmtCaption; AmtCaptionLbl)
                    {
                    }
                    column(DocNoCaption; DocNoCaptionLbl)
                    {
                    }
                    column(DocDateCaption; DocDateCaptionLbl)
                    {
                    }
                    column(CurrCodeCaption; CurrCodeCaptionLbl)
                    {
                    }
                    column(YourDocNoCaption; YourDocNoCaptionLbl)
                    {
                    }
                    column(TDSCaption; TDSCaptionLbl)
                    {
                    }
                    column(BankChargeCaption; BankChargeCaptionLbl)
                    {
                    }
                    column(TransportCaption; TransportCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF NOT TestPrint THEN BEGIN
                            IF FoundLast THEN BEGIN
                                IF RemainingAmount <> 0 THEN BEGIN
                                    DocType := Text015;
                                    DocNo := '';
                                    ExtDocNo := '';
                                    DocDate := 0D;
                                    LineAmount := RemainingAmount;
                                    LineAmount2 := RemainingAmount;
                                    CurrentLineAmount := LineAmount2;
                                    LineDiscount := 0;
                                    RemainingAmount := 0;
                                END ELSE
                                    CurrReport.BREAK;
                            END ELSE
                                CASE ApplyMethod OF
                                    ApplyMethod::OneLineOneEntry:
                                        BEGIN
                                            CASE BalancingType OF
                                                BalancingType::Customer:
                                                    BEGIN
                                                        CustLedgEntry.RESET;
                                                        CustLedgEntry.SETCURRENTKEY("Document No.");
                                                        CustLedgEntry.SETRANGE("Document Type", GenJnlLine."Applies-to Doc. Type");
                                                        CustLedgEntry.SETRANGE("Document No.", GenJnlLine."Applies-to Doc. No.");
                                                        CustLedgEntry.SETRANGE("Customer No.", BalancingNo);
                                                        CustLedgEntry.FIND('-');
                                                        CustUpdateAmounts(CustLedgEntry, RemainingAmount);
                                                    END;
                                                BalancingType::Vendor:
                                                    BEGIN
                                                        VendLedgEntry.RESET;
                                                        VendLedgEntry.SETCURRENTKEY("Document No.");
                                                        VendLedgEntry.SETRANGE("Document Type", GenJnlLine."Applies-to Doc. Type");
                                                        VendLedgEntry.SETRANGE("Document No.", GenJnlLine."Applies-to Doc. No.");
                                                        VendLedgEntry.SETRANGE("Vendor No.", BalancingNo);
                                                        VendLedgEntry.FIND('-');
                                                        VendUpdateAmounts(VendLedgEntry, RemainingAmount);
                                                    END;
                                            END;
                                            RemainingAmount := RemainingAmount - LineAmount2;
                                            CurrentLineAmount := LineAmount2;
                                            FoundLast := TRUE;
                                        END;
                                    ApplyMethod::OneLineID:
                                        BEGIN
                                            CASE BalancingType OF
                                                BalancingType::Customer:
                                                    BEGIN
                                                        CustUpdateAmounts(CustLedgEntry, RemainingAmount);
                                                        FoundLast := (CustLedgEntry.NEXT = 0) OR (RemainingAmount <= 0);
                                                        IF FoundLast AND NOT FoundNegative THEN BEGIN
                                                            CustLedgEntry.SETRANGE(Positive, FALSE);
                                                            FoundLast := NOT CustLedgEntry.FIND('-');
                                                            FoundNegative := TRUE;
                                                        END;
                                                    END;
                                                BalancingType::Vendor:
                                                    BEGIN
                                                        VendUpdateAmounts(VendLedgEntry, RemainingAmount);
                                                        FoundLast := (VendLedgEntry.NEXT = 0) OR (RemainingAmount <= 0);
                                                        IF FoundLast AND NOT FoundNegative THEN BEGIN
                                                            VendLedgEntry.SETRANGE(Positive, FALSE);
                                                            FoundLast := NOT VendLedgEntry.FIND('-');
                                                            FoundNegative := TRUE;
                                                        END;
                                                    END;
                                            END;
                                            RemainingAmount := RemainingAmount - LineAmount2;
                                            CurrentLineAmount := LineAmount2;
                                        END;
                                    ApplyMethod::MoreLinesOneEntry:
                                        BEGIN
                                            CurrentLineAmount := GenJnlLine2.Amount;
                                            LineAmount2 := CurrentLineAmount;

                                            IF GenJnlLine2."Applies-to ID" <> '' THEN
                                                ERROR(Text016);
                                            GenJnlLine2.TESTFIELD("Check Printed", FALSE);
                                            GenJnlLine2.TESTFIELD("Bank Payment Type", GenJnlLine2."Bank Payment Type"::"Computer Check");
                                            IF BankAcc2."Currency Code" <> GenJnlLine2."Currency Code" THEN
                                                ERROR(Text005);
                                            IF GenJnlLine2."Applies-to Doc. No." = '' THEN BEGIN
                                                DocType := Text015;
                                                DocNo := '';
                                                ExtDocNo := '';
                                                DocDate := 0D;
                                                LineAmount := CurrentLineAmount;
                                                LineDiscount := 0;
                                            END ELSE
                                                CASE BalancingType OF
                                                    BalancingType::"G/L Account":
                                                        BEGIN
                                                            DocType := FORMAT(GenJnlLine2."Document Type");
                                                            DocNo := GenJnlLine2."Document No.";
                                                            ExtDocNo := GenJnlLine2."External Document No.";
                                                            LineAmount := CurrentLineAmount;
                                                            LineDiscount := 0;
                                                        END;
                                                    BalancingType::Customer:
                                                        BEGIN
                                                            CustLedgEntry.RESET;
                                                            CustLedgEntry.SETCURRENTKEY("Document No.");
                                                            CustLedgEntry.SETRANGE("Document Type", GenJnlLine2."Applies-to Doc. Type");
                                                            CustLedgEntry.SETRANGE("Document No.", GenJnlLine2."Applies-to Doc. No.");
                                                            CustLedgEntry.SETRANGE("Customer No.", BalancingNo);
                                                            CustLedgEntry.FIND('-');
                                                            CustUpdateAmounts(CustLedgEntry, CurrentLineAmount);
                                                            LineAmount := CurrentLineAmount;
                                                        END;
                                                    BalancingType::Vendor:
                                                        BEGIN
                                                            VendLedgEntry.RESET;
                                                            IF GenJnlLine2."Source Line No." <> 0 THEN
                                                                VendLedgEntry.SETRANGE("Entry No.", GenJnlLine2."Source Line No.")
                                                            ELSE BEGIN
                                                                VendLedgEntry.SETCURRENTKEY("Document No.");
                                                                VendLedgEntry.SETRANGE("Document Type", GenJnlLine2."Applies-to Doc. Type");
                                                                VendLedgEntry.SETRANGE("Document No.", GenJnlLine2."Applies-to Doc. No.");
                                                                VendLedgEntry.SETRANGE("Vendor No.", BalancingNo);
                                                            END;
                                                            VendLedgEntry.FIND('-');
                                                            VendUpdateAmounts(VendLedgEntry, CurrentLineAmount);
                                                            LineAmount := CurrentLineAmount;
                                                        END;
                                                    BalancingType::"Bank Account":
                                                        BEGIN
                                                            DocType := FORMAT(GenJnlLine2."Document Type");
                                                            DocNo := GenJnlLine2."Document No.";
                                                            ExtDocNo := GenJnlLine2."External Document No.";
                                                            LineAmount := CurrentLineAmount;
                                                            LineDiscount := 0;
                                                        END;
                                                END;
                                            FoundLast := GenJnlLine2.NEXT = 0;
                                        END;
                                END;

                            TotalLineAmount := ABS(TotalLineAmount + LineAmount2);
                            TotalLineDiscount := TotalLineDiscount + LineDiscount;
                        END ELSE BEGIN
                            IF FoundLast THEN
                                CurrReport.BREAK;
                            FoundLast := TRUE;
                            DocType := Text018;
                            DocNo := Text010;
                            ExtDocNo := Text010;
                            LineAmount := 0;
                            LineDiscount := 0;
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF NOT TestPrint THEN
                            IF FirstPage THEN BEGIN
                                FoundLast := TRUE;
                                CASE ApplyMethod OF
                                    ApplyMethod::OneLineOneEntry:
                                        FoundLast := FALSE;
                                    ApplyMethod::OneLineID:
                                        CASE BalancingType OF
                                            BalancingType::Customer:
                                                BEGIN
                                                    CustLedgEntry.RESET;
                                                    CustLedgEntry.SETCURRENTKEY("Customer No.", Open, Positive);
                                                    CustLedgEntry.SETRANGE("Customer No.", BalancingNo);
                                                    CustLedgEntry.SETRANGE(Open, TRUE);
                                                    CustLedgEntry.SETRANGE(Positive, TRUE);
                                                    CustLedgEntry.SETRANGE("Applies-to ID", GenJnlLine."Applies-to ID");
                                                    FoundLast := NOT CustLedgEntry.FIND('-');
                                                    IF FoundLast THEN BEGIN
                                                        CustLedgEntry.SETRANGE(Positive, FALSE);
                                                        FoundLast := NOT CustLedgEntry.FIND('-');
                                                        FoundNegative := TRUE;
                                                    END ELSE
                                                        FoundNegative := FALSE;
                                                END;
                                            BalancingType::Vendor:
                                                BEGIN
                                                    VendLedgEntry.RESET;
                                                    VendLedgEntry.SETCURRENTKEY("Vendor No.", Open, Positive);
                                                    VendLedgEntry.SETRANGE("Vendor No.", BalancingNo);
                                                    VendLedgEntry.SETRANGE(Open, TRUE);
                                                    VendLedgEntry.SETRANGE(Positive, TRUE);
                                                    VendLedgEntry.SETRANGE("Applies-to ID", GenJnlLine."Applies-to ID");
                                                    FoundLast := NOT VendLedgEntry.FIND('-');
                                                    IF FoundLast THEN BEGIN
                                                        VendLedgEntry.SETRANGE(Positive, FALSE);
                                                        FoundLast := NOT VendLedgEntry.FIND('-');
                                                        FoundNegative := TRUE;
                                                    END ELSE
                                                        FoundNegative := FALSE;
                                                END;
                                        END;
                                    ApplyMethod::MoreLinesOneEntry:
                                        FoundLast := FALSE;
                                END;
                            END
                            ELSE
                                FoundLast := FALSE;

                        IF DocNo = '' THEN
                            CurrencyCode2 := GenJnlLine."Currency Code";

                        IF PreprintedStub THEN
                            TotalText := ''
                        ELSE
                            TotalText := Text019;

                        IF GenJnlLine."Currency Code" <> '' THEN
                            NetAmount := STRSUBSTNO(Text063, GenJnlLine."Currency Code")
                        ELSE BEGIN
                            GLSetup.GET;
                            NetAmount := STRSUBSTNO(Text063, GLSetup."LCY Code");
                        END;
                    end;
                }
                dataitem(PrintCheck; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(ExtDocNo; ExtDocNo)
                    {
                    }
                    column(CheckAmtText; CheckAmountText)
                    {
                    }
                    column(CheckDateText2; CheckDateText)
                    {
                    }
                    column(CommentLine2; DescriptionLine[2])
                    {
                    }
                    column(CommentLine1; DescriptionLine[1])
                    {
                    }
                    column(CheckToAddr6; CheckToAddr[1])
                    {
                    }
                    column(CheckToAddr2; CheckToAddr[2])
                    {
                    }
                    column(CheckToAddr4; CheckToAddr[4])
                    {
                    }
                    column(CheckToAddr3; CheckToAddr[3])
                    {
                    }
                    column(CheckToAddr5; CheckToAddr[5])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr8; CompanyAddr[8])
                    {
                    }
                    column(CompanyAddr7; CompanyAddr[7])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CheckNoText2; CheckNoText)
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(TotalLineAmt; TotalLineAmount - TDSAmount - WorkTaxAmount + JnlBankCharges.Amount)
                    {
                        AutoFormatExpression = GenJnlLine."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalText; TotalText)
                    {
                    }
                    column(VoidText; VoidText)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        Decimals: Decimal;
                    begin
                        IF NOT TestPrint THEN BEGIN
                            WITH GenJnlLine DO BEGIN
                                //IF GLSetup."Activate Cheque No." THEN //PCPL-064
                                TESTFIELD("Document No.");
                                CheckLedgEntry.INIT;
                                CheckLedgEntry."Bank Account No." := BankAcc2."No.";
                                CheckLedgEntry."Posting Date" := "Posting Date";
                                CheckLedgEntry."Document Type" := "Document Type";
                                // PCPL-064<<
                                // IF NOT GLSetup."Activate Cheque No." THEN
                                CheckLedgEntry."Document No." := UseCheckNo;
                                // ELSE BEGIN
                                CheckLedgEntry."Document No." := "Document No.";
                                CheckLedgEntry."Check No." := UseCheckNo;
                                // END; //PCPL-064>>
                                CheckLedgEntry.Description := Description;
                                CheckLedgEntry."Bank Payment Type" := "Bank Payment Type";
                                CheckLedgEntry."Bal. Account Type" := BalancingType;
                                CheckLedgEntry."Bal. Account No." := BalancingNo;
                                IF FoundLast THEN BEGIN
                                    IF TotalLineAmount <= 0 THEN
                                        ERROR(
                                          Text020,
                                          UseCheckNo, TotalLineAmount);
                                    CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Printed;
                                    CheckLedgEntry.Amount := TotalLineAmount - TDSAmount - WorkTaxAmount + JnlBankCharges.Amount;
                                END ELSE BEGIN
                                    CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Voided;
                                    CheckLedgEntry.Amount := 0;
                                END;
                                //PCPL-064<<
                                // IF NOT GLSetup."Activate Cheque No." THEN
                                CheckLedgEntry."Check Date" := "Posting Date";
                                //ELSE
                                //  IF GenJnlLine."Cheque Date" <> 0D THEN
                                CheckLedgEntry."Check Date" := 0D;//GenJnlLine."Cheque Date"
                                                                  //  ELSE
                                CheckLedgEntry."Check Date" := GenJnlLine."Posting Date";
                                // CheckLedgEntry."Stale Cheque Expiry Date" :=
                                //     CALCDATE(BankAcc2."Stale Cheque Stipulated Period", CheckLedgEntry."Check Date");
                                //PCPL-064 >>
                                CheckLedgEntry."Check No." := UseCheckNo;
                                CheckManagement.InsertCheck(CheckLedgEntry, RECORDID);

                                IF FoundLast THEN BEGIN
                                    IF BankAcc2."Currency Code" <> '' THEN
                                        Currency.GET(BankAcc2."Currency Code")
                                    ELSE
                                        Currency.InitRoundingPrecision;
                                    Decimals := CheckLedgEntry.Amount - ROUND(CheckLedgEntry.Amount, 1, '<');
                                    IF STRLEN(FORMAT(Decimals)) < STRLEN(FORMAT(Currency."Amount Rounding Precision")) THEN
                                        IF Decimals = 0 THEN
                                            CheckAmountText := FORMAT(CheckLedgEntry.Amount, 0, 0) +
                                              COPYSTR(FORMAT(0.01), 2, 1) +
                                              PADSTR('', STRLEN(FORMAT(Currency."Amount Rounding Precision")) - 2, '0')
                                        ELSE
                                            CheckAmountText := FORMAT(CheckLedgEntry.Amount, 0, 0) +
                                              PADSTR('', STRLEN(FORMAT(Currency."Amount Rounding Precision")) - STRLEN(FORMAT(Decimals)), '0')
                                    ELSE
                                        CheckAmountText := FORMAT(CheckLedgEntry.Amount, 0, 0);
                                    FormatNoText(DescriptionLine, CheckLedgEntry.Amount, BankAcc2."Currency Code");
                                    VoidText := '';
                                END ELSE BEGIN
                                    CLEAR(CheckAmountText);
                                    CLEAR(DescriptionLine);
                                    TotalText := Text065;
                                    DescriptionLine[1] := Text021;
                                    DescriptionLine[2] := DescriptionLine[1];
                                    VoidText := Text022;
                                END;
                            END;
                        END ELSE
                            WITH GenJnlLine DO BEGIN
                                CheckLedgEntry.INIT;
                                CheckLedgEntry."Bank Account No." := BankAcc2."No.";
                                CheckLedgEntry."Posting Date" := "Posting Date";
                                CheckLedgEntry."Document No." := UseCheckNo;
                                CheckLedgEntry.Description := Text023;
                                CheckLedgEntry."Bank Payment Type" := "Bank Payment Type"::"Computer Check";
                                CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::"Test Print";
                                //PCPL-064<<
                                // IF NOT GLSetup."Activate Cheque No." THEN
                                CheckLedgEntry."Check Date" := "Posting Date";
                                // ELSE
                                IF CheckLedgEntry."Check Date" <> 0D THEN
                                    CheckLedgEntry."Check Date" := 0D//GenJnlLine."Cheque Date"
                                ELSE  //PCPL-064 >>
                                    CheckLedgEntry."Check Date" := GenJnlLine."Posting Date";
                                CheckLedgEntry."Check No." := UseCheckNo;
                                CheckManagement.InsertCheck(CheckLedgEntry, RECORDID);

                                CheckAmountText := Text024;
                                DescriptionLine[1] := Text025;
                                DescriptionLine[2] := DescriptionLine[1];
                                VoidText := Text022;
                            END;

                        ChecksPrinted := ChecksPrinted + 1;
                        FirstPage := FALSE;


                        //<<SM_PG002
                        IF STRLEN(DescriptionLine[1]) >= 57 THEN BEGIN
                            BlankStr := COPYSTR(DescriptionLine[1], 42, 10);
                            BlankPos := STRPOS(BlankStr, ' ');
                            BlankPos := 41 + BlankPos;
                            AmountInwords[1] := COPYSTR(DescriptionLine[1], 1, BlankPos - 1);
                            AmountInwords[2] := COPYSTR(DescriptionLine[1], BlankPos + 1);
                        END ELSE BEGIN
                            AmountInwords[1] := DescriptionLine[1];
                            AmountInwords[2] := '';
                        END;
                        //<<SM_PG002
                    end;
                }
                dataitem("State Bank of India"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name_; GenJnlLine4."Account No.")
                    {
                    }
                    column(AmountInwords_1_; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date_; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2_; AmountInwords[2])
                    {
                    }
                    column(AccountPayee; AccountPayee)
                    {
                    }
                    column(State_BankCaption; State_BankCaptionLbl)
                    {
                    }
                    column(State_Bank_of_India_Number; Number)
                    {
                    }
                    column(StateBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("ICICI Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000016; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000017; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000018; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000019; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000023; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000020; AccountPayee)
                    {
                    }
                    column(ICICICaption; ICICICaptionLbl)
                    {
                    }
                    column(ICICI_Bank_Number; Number)
                    {
                    }
                    column(IciciBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("IDBI Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000027; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000028; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000029; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000030; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000031; AmountInwords[2])
                    {
                    }
                    column(IDBICaption; IDBICaptionLbl)
                    {
                    }
                    column(IDBI_Bank_Number; Number)
                    {
                    }
                    column(IDBIBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Citi Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000033; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000034; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000035; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000036; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000037; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000038; AccountPayee)
                    {
                    }
                    column(CitiCaption; CitiCaptionLbl)
                    {
                    }
                    column(Citi_Bank_Number; Number)
                    {
                    }
                    column(CitiBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Punjab National Bank Old"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000045; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000046; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000047; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000048; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000054; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000006; AccountPayee)
                    {
                    }
                    column(Punjab_National_OldCaption; Punjab_National_OldCaptionLbl)
                    {
                    }
                    column(Punjab_National_Bank_Old_Number; Number)
                    {
                    }
                    column(PNBBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("HSBC Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000058; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000059; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000060; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000061; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000065; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000062; AccountPayee)
                    {
                    }
                    column(HSBCCaption; HSBCCaptionLbl)
                    {
                    }
                    column(HSBC_Bank_Number; Number)
                    {
                    }
                    column(HSBCBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Punjab National Bank New"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000069; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000070; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000071; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000072; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000078; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000075; AccountPayee)
                    {
                    }
                    column(Punjab_National_NewCaption; Punjab_National_NewCaptionLbl)
                    {
                    }
                    column(Punjab_National_Bank_New_Number; Number)
                    {
                    }
                    column(PNB_NewBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Citi-CC"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000083; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000084; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000085; CheckAmountText)
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000086; CheckLedgEntry."Check Date")
                    {
                    }
                    column(AmountInwords_2__Control1000000087; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000012; AccountPayee)
                    {
                    }
                    column(Citi_CCCaption; Citi_CCCaptionLbl)
                    {
                    }
                    column(Citi_CC_Number; Number)
                    {
                    }
                    column(Citi_CCBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem(HDFC; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(CheckLedgEntry__Check_Date__Control1000000024; CheckLedgEntry."Check Date")
                    {
                    }
                    column(GenJnlLine__Account_Name__Control1000000025; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000032; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000042; CheckAmountText)
                    {
                    }
                    column(AmountInwords_2__Control1000000043; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000076; AccountPayee)
                    {
                    }
                    column(HDFC_BANKCaption; HDFC_BANKCaptionLbl)
                    {
                    }
                    column(HDFC_Number; Number)
                    {
                    }
                    column(HDFC_BankBankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("ABN-AMRO"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(CheckLedgEntry__Check_Date__Control1000000056; CheckLedgEntry."Check Date")
                    {
                    }
                    column(GenJnlLine__Account_Name__Control1000000057; GenJnlLine."Account No.")
                    {
                    }
                    column(AmountInwords_1__Control1000000066; AmountInwords[1])
                    {
                    }
                    column(CheckAmountText_Control1000000073; CheckAmountText)
                    {
                    }
                    column(AmountInwords_2__Control1000000079; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000077; AccountPayee)
                    {
                    }
                    column(ABN_AMRO_BankCaption; ABN_AMRO_BankCaptionLbl)
                    {
                    }
                    column(ABN_AMRO_Number; Number)
                    {
                    }
                    column(ABN_AmroBankbody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem(Canara; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(CheckLedgEntry__Check_Date__Control1000000089; CheckLedgEntry."Check Date")
                    {
                    }
                    column(GenJnlLine__Account_Name__Control1000000090; GenJnlLine."Account No.")
                    {
                    }
                    column(CheckAmountText_Control1000000101; CheckAmountText)
                    {
                    }
                    column(AmountInwords_1__Control1000000093; AmountInwords[1])
                    {
                    }
                    column(AmountInwords_2__Control1000000110; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000081; AccountPayee)
                    {
                    }
                    column(Canara_BankCaption; Canara_BankCaptionLbl)
                    {
                    }
                    column(Canara_Number; Number)
                    {
                    }
                    column(Canara_BankBody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Corporation Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(CheckLedgEntry__Check_Date__Control1000000008; CheckLedgEntry."Check Date")
                    {
                    }
                    column(GenJnlLine__Account_Name__Control1000000009; GenJnlLine."Account No.")
                    {
                    }
                    column(CheckAmountText_Control1000000049; CheckAmountText)
                    {
                    }
                    column(AmountInwords_1__Control1000000122; AmountInwords[1])
                    {
                    }
                    column(AmountInwords_2__Control1000000123; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000125; AccountPayee)
                    {
                    }
                    column(Corporation_BankCaption; Corporation_BankCaptionLbl)
                    {
                    }
                    column(Corporation_Bank_Number; Number)
                    {
                    }
                    column(Corporate_Bankbody; BankAcc2."Check Report Name")
                    {
                    }
                }
                dataitem("Yes Bank"; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(GenJnlLine__Account_Name__Control1000000121; GenJnlLine."Account No.")
                    {
                    }
                    column(CheckLedgEntry__Check_Date__Control1000000124; CheckLedgEntry."Check Date")
                    {
                    }
                    column(CheckAmountText_Control1000000126; CheckAmountText)
                    {
                    }
                    column(AmountInwords_1__Control1000000127; AmountInwords[1])
                    {
                    }
                    column(AmountInwords_2__Control1000000128; AmountInwords[2])
                    {
                    }
                    column(AccountPayee_Control1000000129; AccountPayee)
                    {
                    }
                    column(YES_BankCaption; YES_BankCaptionLbl)
                    {
                    }
                    column(Yes_Bank_Number; Number)
                    {
                    }
                    column(Yes_BankBody; BankAcc2."Check Report Name")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin

                    IF FoundLast THEN
                        CurrReport.BREAK;

                    //>> SM_BjBM2.00.00
                    //Code commented so that cheque no. that is given by user on form is taken not from request form
                    //UseCheckNo := INCSTR(UseCheckNo);
                    UseCheckNo := '';//GenJnlLine."Cheque No."; >>PCPL-064  //monika
                    //<< SM_BjBM2.00.00 Code end's here

                    IF NOT TestPrint THEN
                        CheckNoText := UseCheckNo
                    ELSE
                        CheckNoText := Text011;

                    IF CheckNoText = '' THEN
                        CheckNoText := UseCheckNo;
                end;

                trigger OnPostDataItem()
                begin
                    //PCPL-064<<
                    IF NOT TestPrint THEN BEGIN
                        //IF UseCheckNo <> GenJnlLine."Cheque No." THEN BEGIN
                        GenJnlLine3.RESET;
                        GenJnlLine3.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                        GenJnlLine3.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                        GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                        GenJnlLine3.SETRANGE("Posting Date", GenJnlLine."Posting Date");

                        // IF NOT GLSetup."Activate Cheque No." THEN BEGIN
                        GenJnlLine3.SETRANGE("Document No.", UseCheckNo);
                        IF GenJnlLine3.FIND('-') THEN
                            GenJnlLine3.FIELDERROR("Document No.", STRSUBSTNO(Text013, UseCheckNo));
                        //END ELSE BEGIN
                        // GenJnlLine3.SETRANGE("Cheque No.", UseCheckNo);
                        // IF GenJnlLine3.FIND('-') THEN
                        // GenJnlLine3.FIELDERROR("Cheque No.", STRSUBSTNO(Text013, UseCheckNo));
                        //   END;
                        // END;  //PCPL-064>>

                        IF ApplyMethod <> ApplyMethod::MoreLinesOneEntry THEN BEGIN
                            GenJnlLine3 := GenJnlLine;
                            //PCPL-064<<
                            //IF NOT GLSetup."Activate Cheque No." THEN BEGIN
                            GenJnlLine3.TESTFIELD("Posting No. Series", '');
                            GenJnlLine3."Document No." := UseCheckNo;
                            // GenJnlLine3."Cheque No." := UseCheckNo;
                            // IF GenJnlLine."Cheque Date" = 0D THEN
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                            // END ELSE BEGIN
                            // GenJnlLine3."Cheque No." := UseCheckNo;
                            // GenJnlLine3."Cheque Date" := WORKDATE;
                            // IF GenJnlLine."Cheque Date" = 0D THEN
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                            // END;
                            //PCPL-064>>
                            GenJnlLine3."Check Printed" := TRUE;
                            GenJnlLine3.MODIFY;
                        END ELSE BEGIN
                            IF GenJnlLine2.FIND('-') THEN BEGIN
                                HighestLineNo := GenJnlLine2."Line No.";
                                REPEAT
                                    IF GenJnlLine2."Line No." > HighestLineNo THEN
                                        HighestLineNo := GenJnlLine2."Line No.";
                                    GenJnlLine3 := GenJnlLine2;
                                    //PCPL-064<<
                                    // IF NOT GLSetup."Activate Cheque No." THEN
                                    GenJnlLine3.TESTFIELD("Posting No. Series", '');
                                    GenJnlLine3."Bal. Account No." := '';
                                    GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::" ";
                                    // IF NOT GLSetup."Activate Cheque No." THEN BEGIN
                                    GenJnlLine3."Document No." := UseCheckNo;
                                    // GenJnlLine3."Cheque No." := UseCheckNo;
                                    // IF GenJnlLine."Cheque Date" <> 0D THEN
                                    //     GenJnlLine3."Cheque Date" := GenJnlLine."Cheque Date"
                                    // ELSE
                                    //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                                    //END ELSE BEGIN
                                    // GenJnlLine3."Cheque No." := UseCheckNo;
                                    // IF GenJnlLine."Cheque Date" <> 0D THEN
                                    //     GenJnlLine3."Cheque Date" := GenJnlLine."Cheque Date"
                                    // ELSE
                                    //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                                    //END; //PCPL-064>>
                                    GenJnlLine3."Check Printed" := TRUE;
                                    GenJnlLine3.VALIDATE(Amount);
                                    GenJnlLine3.MODIFY;
                                UNTIL GenJnlLine2.NEXT = 0;
                            END;

                            GenJnlLine3.RESET;
                            GenJnlLine3 := GenJnlLine;
                            GenJnlLine3.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                            GenJnlLine3.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                            GenJnlLine3."Line No." := HighestLineNo;
                            IF GenJnlLine3.NEXT = 0 THEN
                                GenJnlLine3."Line No." := HighestLineNo + 10000
                            ELSE BEGIN
                                WHILE GenJnlLine3."Line No." = HighestLineNo + 1 DO BEGIN
                                    HighestLineNo := GenJnlLine3."Line No.";
                                    IF GenJnlLine3.NEXT = 0 THEN
                                        GenJnlLine3."Line No." := HighestLineNo + 20000;
                                END;
                                GenJnlLine3."Line No." := (GenJnlLine3."Line No." + HighestLineNo) DIV 2;
                            END;
                            GenJnlLine3.INIT;
                            GenJnlLine3.VALIDATE("Posting Date", GenJnlLine."Posting Date");
                            GenJnlLine3."Document Type" := GenJnlLine."Document Type";
                            //PCPL-064<<
                            // IF NOT GLSetup."Activate Cheque No." THEN BEGIN
                            GenJnlLine3."Document No." := UseCheckNo;
                            // GenJnlLine3."Cheque No." := UseCheckNo;
                            // IF GenJnlLine."Cheque Date" <> 0D THEN
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Cheque Date"
                            // ELSE
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                            // END ELSE BEGIN
                            GenJnlLine3."Document No." := GenJnlLine."Document No.";
                            // GenJnlLine3."Cheque No." := UseCheckNo;
                            // IF GenJnlLine."Cheque Date" <> 0D THEN
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Cheque Date"
                            // ELSE
                            //     GenJnlLine3."Cheque Date" := GenJnlLine."Posting Date";
                            // END;
                            //PCPL-064>> 
                            GenJnlLine3."Account Type" := GenJnlLine3."Account Type"::"Bank Account";
                            GenJnlLine3.VALIDATE("Account No.", BankAcc2."No.");
                            IF BalancingType <> BalancingType::"G/L Account" THEN
                                GenJnlLine3.Description := STRSUBSTNO(Text014, SELECTSTR(BalancingType + 1, Text062), BalancingNo);
                            GenJnlLine3.VALIDATE(Amount, -TotalLineAmount);
                            GenJnlLine3."Bank Payment Type" := GenJnlLine3."Bank Payment Type"::"Computer Check";
                            GenJnlLine3."Check Printed" := TRUE;
                            GenJnlLine3."Source Code" := GenJnlLine."Source Code";
                            GenJnlLine3."Reason Code" := GenJnlLine."Reason Code";
                            GenJnlLine3."Allow Zero-Amount Posting" := TRUE;
                            GenJnlLine3."Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
                            GenJnlLine3."Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";

                            TempJnlBankCharges.DELETEALL;
                            JnlBankCharges.RESET;
                            JnlBankCharges.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                            JnlBankCharges.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
                            JnlBankCharges.SETRANGE("Line No.", GenJnlLine."Line No.");
                            IF JnlBankCharges.FINDSET THEN
                                REPEAT
                                    TempJnlBankCharges.TRANSFERFIELDS(JnlBankCharges);
                                    TempJnlBankCharges.INSERT;
                                    JnlBankCharges.DELETE;
                                UNTIL JnlBankCharges.NEXT = 0;
                            IF TempJnlBankCharges.FINDSET THEN
                                REPEAT
                                    JnlBankCharges.TRANSFERFIELDS(TempJnlBankCharges);
                                    JnlBankCharges."Line No." := GenJnlLine3."Line No.";
                                    JnlBankCharges.INSERT;
                                UNTIL TempJnlBankCharges.NEXT = 0;

                            GenJnlLine3.INSERT;
                        END;
                    END;

                    BankAcc2."Last Check No." := UseCheckNo;
                    BankAcc2.MODIFY;

                    CLEAR(CheckManagement);
                end;

                trigger OnPreDataItem()
                begin
                    FirstPage := TRUE;
                    FoundLast := FALSE;
                    TotalLineAmount := 0;
                    TotalLineDiscount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                SUM := 0;
                ChecktoName := '';
                GenJou.RESET;
                GenJou.SETRANGE(GenJou."Document No.", "Document No.");
                IF GenJou.FINDSET THEN
                    REPEAT
                        SUM += GenJou."Debit Amount";
                    UNTIL GenJou.NEXT = 0;

                IF OneCheckPrVendor AND ("Currency Code" <> '') AND
                   ("Currency Code" <> Currency.Code)
                THEN BEGIN
                    Currency.GET("Currency Code");
                    Currency.TESTFIELD("Conv. LCY Rndg. Debit Acc.");
                    Currency.TESTFIELD("Conv. LCY Rndg. Credit Acc.");
                END;

                IF NOT ReprintChecks THEN BEGIN
                    JnlBankCharges.RESET;
                    JnlBankCharges.SETRANGE("Journal Template Name", "Journal Template Name");
                    JnlBankCharges.SETRANGE("Journal Batch Name", "Journal Batch Name");
                    JnlBankCharges.SETRANGE("Line No.", "Line No.");
                    JnlBankCharges.CALCSUMS(JnlBankCharges.Amount, JnlBankCharges."Amount (LCY)");
                END;

                GenJnLineRec.RESET;
                GenJnLineRec.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJnLineRec.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJnLineRec.SETRANGE("Line No.", "Line No.");
                IF GenJnLineRec.FINDFIRST THEN
                    IF GenJnLineRec."Account Type" <> GenJnLineRec."Account Type"::"Bank Account" THEN
                        LineDescriptiontext := GenJnLineRec.Description;

                GenJnLinebank.RESET;
                GenJnLinebank.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Line No.");
                GenJnLinebank.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJnLinebank.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJnLinebank.SETRANGE("Line No.", "Line No.");
                GenJnLinebank.SETRANGE("Account Type", GenJnLinebank."Account Type"::"Bank Account");
                GenJnLinebank.SETFILTER(GenJnLinebank."Credit Amount", '<>%1', 0);
                IF GenJnLinebank.FINDFIRST THEN BEGIN
                    LineAmountTotal := GenJnLinebank."Credit Amount";
                END;

                Docdatejnl := GenJnlLine."Posting Date";

                IF NOT TestPrint THEN BEGIN
                    IF Amount = 0 THEN
                        CurrReport.SKIP;

                    TESTFIELD("Bal. Account Type", "Bal. Account Type"::"Bank Account");
                    IF "Bal. Account No." <> BankAcc2."No." THEN
                        CurrReport.SKIP;

                    IF ("Account No." <> '') AND ("Bal. Account No." <> '') THEN BEGIN
                        BalancingType := "Account Type";
                        BalancingNo := "Account No.";
                        RemainingAmount := Amount;
                        TDSAmount := 0;//ABS("Total TDS/TCS Incl. SHE CESS"); PCPL-064
                        WorkTaxAmount := 0;//ABS("Work Tax Amount"); PCPL-064
                        IF OneCheckPrVendor THEN BEGIN
                            ApplyMethod := ApplyMethod::MoreLinesOneEntry;
                            GenJnlLine2.RESET;
                            GenJnlLine2.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.");
                            GenJnlLine2.SETRANGE("Journal Template Name", "Journal Template Name");
                            GenJnlLine2.SETRANGE("Journal Batch Name", "Journal Batch Name");
                            GenJnlLine2.SETRANGE("Posting Date", "Posting Date");
                            GenJnlLine2.SETRANGE("Document No.", "Document No.");
                            GenJnlLine2.SETRANGE("Account Type", "Account Type");
                            GenJnlLine2.SETRANGE("Account No.", "Account No.");
                            GenJnlLine2.SETRANGE("Bal. Account Type", "Bal. Account Type");
                            GenJnlLine2.SETRANGE("Bal. Account No.", "Bal. Account No.");
                            GenJnlLine2.SETRANGE("Bank Payment Type", "Bank Payment Type");
                            GenJnlLine2.FIND('-');
                            RemainingAmount := 0;
                        END ELSE
                            IF "Applies-to Doc. No." <> '' THEN
                                ApplyMethod := ApplyMethod::OneLineOneEntry
                            ELSE
                                IF "Applies-to ID" <> '' THEN
                                    ApplyMethod := ApplyMethod::OneLineID
                                ELSE
                                    ApplyMethod := ApplyMethod::Payment;
                    END ELSE
                        IF "Account No." = '' THEN
                            FIELDERROR("Account No.", Text004)
                        ELSE
                            FIELDERROR("Bal. Account No.", Text004);

                    CLEAR(CheckToAddr);
                    ContactText := '';
                    CLEAR(SalesPurchPerson);
                    CASE BalancingType OF
                        BalancingType::"G/L Account":
                            CheckToAddr[1] := Description;
                        BalancingType::Customer:
                            BEGIN
                                Cust.GET(BalancingNo);
                                IF Cust.Blocked = Cust.Blocked::All THEN
                                    ERROR(Text064, Cust.FIELDCAPTION(Blocked), Cust.Blocked, Cust.TABLECAPTION, Cust."No.");
                                Cust.Contact := '';
                                FormatAddr.Customer(CheckToAddr, Cust);
                                IF BankAcc2."Currency Code" <> "Currency Code" THEN
                                    ERROR(Text005);
                                IF Cust."Salesperson Code" <> '' THEN BEGIN
                                    ContactText := Text006;
                                    SalesPurchPerson.GET(Cust."Salesperson Code");
                                END;
                            END;
                        BalancingType::Vendor:
                            BEGIN
                                Vend.GET(BalancingNo);
                                IF Vend.Blocked IN [Vend.Blocked::All, Vend.Blocked::Payment] THEN
                                    ERROR(Text064, Vend.FIELDCAPTION(Blocked), Vend.Blocked, Vend.TABLECAPTION, Vend."No.");
                                Vend.Contact := '';
                                FormatAddr.Vendor(CheckToAddr, Vend);
                                IF BankAcc2."Currency Code" <> "Currency Code" THEN
                                    ERROR(Text005);
                                IF Vend."Purchaser Code" <> '' THEN BEGIN
                                    ContactText := Text007;
                                    SalesPurchPerson.GET(Vend."Purchaser Code");
                                END;
                            END;
                        BalancingType::"Bank Account":
                            BEGIN
                                BankAcc.GET(BalancingNo);
                                BankAcc.TESTFIELD(Blocked, FALSE);
                                BankAcc.Contact := '';
                                FormatAddr.BankAcc(CheckToAddr, BankAcc);
                                IF BankAcc2."Currency Code" <> BankAcc."Currency Code" THEN
                                    ERROR(Text008);
                                IF BankAcc."Our Contact Code" <> '' THEN BEGIN
                                    ContactText := Text009;
                                    SalesPurchPerson.GET(BankAcc."Our Contact Code");
                                END;
                            END;
                    END;
                    // IF "Cheque Date" <> 0D THEN
                    CheckDateText := '';// FORMAT("Cheque Date", 0, 4)
                                        //ELSE
                    CheckDateText := FORMAT("Posting Date", 0, 4);
                END ELSE BEGIN
                    IF ChecksPrinted > 0 THEN
                        CurrReport.BREAK;
                    BalancingType := BalancingType::Vendor;
                    BalancingNo := Text010;
                    CLEAR(CheckToAddr);
                    FOR i := 1 TO 5 DO
                        CheckToAddr[i] := Text003;
                    ContactText := '';
                    CLEAR(SalesPurchPerson);
                    CheckNoText := Text011;
                    CheckDateText := Text012;
                END;

                // IF "Cheque Date" <> 0D THEN
                dtCheckDate := 0D;//"Cheque Date"
                                  //ELSE
                dtCheckDate := "Posting Date";

                txtChqDate := COPYSTR(FORMAT(dtCheckDate, 8, 1), 1, 2);
                txtChqDate += COPYSTR(FORMAT(dtCheckDate, 8, 1), 4, 2);
                txtChqDate += FORMAT(DATE2DMY(dtCheckDate, 3), 4, 1);
                intDtLen := 8;
                REPEAT
                    txtChqDate := INSSTR(txtChqDate, '   ', intDtLen);
                    intDtLen -= 1;
                UNTIL intDtLen = 1;

                IF ChecktoName = '' THEN
                    ChecktoName := GenJnlLine."Account No.";
                /*
                txtAcPayee :='';
                IF GenJnlLine."A/C payee" THEN
                   txtAcPayee :='A/C PAYEE'
                ELSE
                  txtAcPayee :='';
                  */

                decAmount := 0;//SUM - GenJnlLine."TDS/TCS Amount"; PCPL-064

                rptCheck.InitTextVariable;
                rptCheck.FormatNoText(NumberText, ROUND(SUM, 0.01), GenJnlLine."Currency Code");

                //YSR_OLD_Copied_Code BEGIN

                IF (VoidGenJnlLine."Account Type" IN [1, 2]) AND (CheckInFavourOf = '') THEN
                    CheckInFavourOf := VoidGenJnlLine.Description;

                // Kiran
                IF (VoidGenJnlLine."Account Type" IN [3]) AND (CheckInFavourOf = '') THEN BEGIN
                    //MESSAGE(FORMAT(VoidGenJnlLine."Account Type"));
                    CheckInFavourOf := VoidGenJnlLine.Description;
                END;
                // Kiran

                IF (VoidGenJnlLine."Account Type" IN [0]) AND (CheckInFavourOf = '') THEN BEGIN
                    GenJnlLine4.RESET;
                    GenJnlLine4.SETRANGE("Journal Template Name", "Journal Template Name");
                    GenJnlLine4.SETRANGE("Journal Batch Name", "Journal Batch Name");
                    GenJnlLine4.SETRANGE("Document No.", "Document No.");
                    GenJnlLine4.SETRANGE("Account Type", 3);
                    IF GenJnlLine4.FINDFIRST THEN
                        CheckInFavourOf := GenJnlLine4.Description;
                END;


                //for G/L Account

                IF "Account Type" = 0 THEN BEGIN
                    recGLAct.RESET;
                    recGLAct.SETCURRENTKEY("No.");
                    IF recGLAct.GET("Account No.") THEN
                        DescriptionText := recGLAct.Name;
                END;
                //for customer
                IF "Account Type" = 1 THEN BEGIN
                    recCustomer.RESET;
                    recCustomer.SETCURRENTKEY("No.");
                    recCustomer.GET("Account No.");
                    DescriptionText := recCustomer.Name;
                END;

                //for Vendor
                IF "Account Type" = 2 THEN BEGIN
                    recVendor.RESET;
                    recVendor.SETCURRENTKEY("No.");
                    recVendor.GET("Account No.");
                    DescriptionText := recVendor.Name;
                END;
                /*
                //for Bank Account
                IF "Account Type" = 3 THEN
                  BEGIN
                   recBankAccount.RESET;
                   recBankAccount.SETCURRENTKEY("No.");
                   recBankAccount.GET("Account No.");
                   DescriptionText := recBankAccount.Name;
                  END;
                  */

                recGenJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
                recGenJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
                recGenJnlLine.SETRANGE("Document No.", "Document No.");
                recGenJnlLine.SETFILTER("Account Type", '%1', 3);
                IF recGenJnlLine.FINDFIRST THEN BEGIN
                    BankAcc.GET(recGenJnlLine."Account No.");
                    BankName := BankAcc.Name;
                END;
                //YSR_OLD_Copied_Code END


                //YSR BEGIN
                recGenJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
                recGenJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
                recGenJnlLine.SETRANGE("Document No.", "Document No.");
                IF recGenJnlLine.FINDSET THEN
                    REPEAT
                    //txtOnAccOf  :=  ' '  + recGenJnlLine.narration;
                    UNTIL recGenJnlLine.NEXT = 0;

                //YSR END
                //PC <<BRB
                GenJournalNarration.RESET;
                GenJournalNarration.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJournalNarration.SETRANGE("Journal Batch Name", "Journal Batch Name");
                GenJournalNarration.SETRANGE("Document No.", "Document No.");
                IF GenJournalNarration.FINDSET THEN BEGIN
                    REPEAT
                        Narretion += GenJournalNarration.Narration;
                    UNTIL GenJournalNarration.NEXT = 0;
                END;
                //PC >>BRB

            end;

            trigger OnPreDataItem()
            begin
                COPY(VoidGenJnlLine);
                CompanyInfo.GET;
                IF NOT TestPrint THEN BEGIN
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                    BankAcc2.GET(BankAcc2."No.");
                    BankAcc2.TESTFIELD(Blocked, FALSE);

                    COPY(VoidGenJnlLine);
                    SETRANGE("Bank Payment Type", "Bank Payment Type"::"Computer Check");
                    SETRANGE("Check Printed", FALSE);
                END ELSE BEGIN
                    CLEAR(CompanyAddr);
                    FOR i := 1 TO 5 DO
                        CompanyAddr[i] := Text003;
                END;
                ChecksPrinted := 0;

                SETRANGE("Account Type", "Account Type"::"Fixed Asset");
                IF FIND('-') THEN
                    FIELDERROR("Account Type");
                SETRANGE("Account Type");

                DescriptionText := '';
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(BankAccount; BankAcc2."No.")
                    {
                        Caption = 'Bank Account';
                        TableRelation = "Bank Account";

                        trigger OnValidate()
                        begin
                            InputBankAccount;
                        end;
                    }
                    field(LastCheckNo; UseCheckNo)
                    {
                        Caption = 'Last Check No.';
                    }
                    field(OneCheckPrVendor; OneCheckPrVendor)
                    {
                        Caption = 'One Check per Vendor per Document No.';
                        MultiLine = true;
                    }
                    field(ReprintChecks; ReprintChecks)
                    {
                        Caption = 'Reprint Checks';
                    }
                    field(TestPrinting; TestPrint)
                    {
                        Caption = 'Test Print';
                    }
                    field(PreprintedStub; PreprintedStub)
                    {
                        Caption = 'Preprinted Stub';
                    }
                    field(boolPrintAuthSign; boolPrintAuthSign)
                    {
                        Caption = 'Print Authorised Signatory''s Text';
                    }
                    field(blnPayee; blnPayee)
                    {
                        Caption = 'A/c Payee';
                    }
                    field(txtPrnDtl; txtPrnDtl)
                    {
                        Caption = 'Print Text (A/c No.)';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            IF BankAcc2."No." <> '' THEN
                IF BankAcc2.GET(BankAcc2."No.") THEN
                    UseCheckNo := BankAcc2."Last Check No."
                ELSE BEGIN
                    BankAcc2."No." := '';
                    UseCheckNo := '';
                END;
        end;
    }

    labels
    {
        PaymentVoucher = 'Payment Voucher';
    }

    trigger OnInitReport()
    begin
        GLSetup.GET;
    end;

    trigger OnPreReport()
    begin
        InitTextVariable;
        /*
        IF blnPayee = TRUE THEN
          txtAcPayee:='A/C PAYEE'
        ELSE
          txtAcPayee:='';
        */
        CheckNo := UseCheckNo;

    end;

    var
        Text000: Label 'Preview is not allowed.';
        Text001: Label 'Last Check No. must be filled in.';
        Text002: Label 'Filters on %1 and %2 are not allowed.';
        Text003: Label 'XXXXXXXXXXXXXXXX';
        Text004: Label 'must be entered.';
        Text005: Label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: Label 'Salesperson';
        Text007: Label 'Purchaser';
        Text008: Label 'Both Bank Accounts must have the same currency.';
        Text009: Label 'Our Contact';
        Text010: Label 'XXXXXXXXXX';
        Text011: Label 'XXXX';
        Text012: Label 'XX.XXXXXXXXXX.XXXX';
        Text013: Label '%1 already exists.';
        Text014: Label 'Check for %1 %2';
        Text015: Label 'Payment';
        Text016: Label 'In the Check report, One Check per Vendor and Document No.\must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: Label 'XXX';
        Text019: Label 'Total';
        Text020: Label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: Label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: Label 'NON-NEGOTIABLE';
        Text023: Label 'Test print';
        Text024: Label 'XXXX.XX';
        Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text029: Label '%1 results in a written number that is too long.';
        Text030: Label ' is already applied to %1 %2 for customer %3.';
        Text031: Label ' is already applied to %1 %2 for vendor %3.';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text1280000: Label 'LAKH';
        Text1280001: Label 'CRORE';
        CompanyInfo: Record 79;
        SalesPurchPerson: Record 13;
        GenJnlLine2: Record 81;
        GenJnlLine3: Record 81;
        Cust: Record 18;
        CustLedgEntry: Record 21;
        Vend: Record 23;
        VendLedgEntry: Record 25;
        BankAcc: Record 270;
        BankAcc2: Record 270;
        CheckLedgEntry: Record 272;
        Currency: Record 4;
        GenJournalNarration: Record "Gen. Journal Narration";//16549; PCPL-064
        FormatAddr: Codeunit 365;
        CheckManagement: Codeunit 367;
        CompanyAddr: array[8] of Text[50];
        CheckToAddr: array[8] of Text[50];
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        BalancingType: Option "G/L Account",Customer,Vendor,"Bank Account";
        BalancingNo: Code[20];
        ContactText: Text[30];
        CheckNoText: Text[30];
        CheckDateText: Text[30];
        CheckAmountText: Text[30];
        DescriptionLine: array[2] of Text[80];
        DocType: Text[30];
        DocNo: Text[30];
        ExtDocNo: Text[35];
        VoidText: Text[30];
        LineAmount: Decimal;
        LineDiscount: Decimal;
        TotalLineAmount: Decimal;
        TotalLineDiscount: Decimal;
        RemainingAmount: Decimal;
        CurrentLineAmount: Decimal;
        UseCheckNo: Code[20];
        FoundLast: Boolean;
        ReprintChecks: Boolean;
        TestPrint: Boolean;
        FirstPage: Boolean;
        OneCheckPrVendor: Boolean;
        FoundNegative: Boolean;
        ApplyMethod: Option Payment,OneLineOneEntry,OneLineID,MoreLinesOneEntry;
        ChecksPrinted: Integer;
        HighestLineNo: Integer;
        PreprintedStub: Boolean;
        TotalText: Text[10];
        DocDate: Date;
        i: Integer;
        Text062: Label 'G/L Account,Customer,Vendor,Bank Account';
        CurrencyCode2: Code[10];
        NetAmount: Text[30];
        CurrencyExchangeRate: Record 330;
        LineAmount2: Decimal;
        Text063: Label 'Net Amount %1';
        GLSetup: Record 98;
        Text064: Label '%1 must not be %2 for %3 %4.';
        Text065: Label 'Subtotal';
        TDSAmount: Decimal;
        WorkTaxAmount: Decimal;
        TDSAmountLCY: Decimal;
        WorkTaxAmountLCY: Decimal;
        JnlBankCharges: Record "Journal Bank Charges";//16511; PCPL-064
        TempJnlBankCharges: Record "Journal Bank Charges" temporary;//16511 temporary; PCPL-064
        CheckNoCaptionLbl: Label 'Check No.';
        NetAmtCaptionLbl: Label 'Net Amount';
        DiscCaptionLbl: Label 'Discount';
        AmtCaptionLbl: Label 'Amount';
        DocNoCaptionLbl: Label 'Document No.';
        DocDateCaptionLbl: Label 'Document Date';
        CurrCodeCaptionLbl: Label 'Currency Code';
        YourDocNoCaptionLbl: Label 'Your Doc. No.';
        TDSCaptionLbl: Label 'TDS';
        BankChargeCaptionLbl: Label 'Bank Charge';
        TransportCaptionLbl: Label 'Transport';
        txtAcPayee: Text[100];
        ChecktoName: Text[100];
        blnPayee: Boolean;
        txtDay: Text[30];
        txtMonth: Text[30];
        txtYear: Text[30];
        txtChqDate: Text[50];
        intDtLen: Integer;
        boolPrintAuthSign: Boolean;
        txtPrnDtl: Text[30];
        rptCheck: Report 1401;
        NumberText: array[1] of Text[200];
        decAmount: Decimal;
        AmountInwords: array[2] of Text[92];
        BlankStr: Text[10];
        BlankPos: Integer;
        Vendor: Record 23;
        VendorDetails: array[4] of Text[100];
        PrintCoveringLetter: Boolean;
        AccountPayee: Text[30];
        GLEntry: Record 17;
        Date: Integer;
        Month: Integer;
        Year: Integer;
        State_BankCaptionLbl: Label 'State Bank';
        ICICICaptionLbl: Label 'ICICI';
        IDBICaptionLbl: Label 'IDBI';
        CitiCaptionLbl: Label 'Citi';
        Punjab_National_OldCaptionLbl: Label 'Punjab National Old';
        HSBCCaptionLbl: Label 'HSBC';
        Punjab_National_NewCaptionLbl: Label 'Punjab National New';
        Citi_CCCaptionLbl: Label 'Citi-CC';
        HDFC_BANKCaptionLbl: Label 'HDFC BANK';
        ABN_AMRO_BankCaptionLbl: Label 'ABN-AMRO Bank';
        Canara_BankCaptionLbl: Label 'Canara Bank';
        Corporation_BankCaptionLbl: Label 'Corporation Bank';
        YES_BankCaptionLbl: Label 'YES Bank';
        Sharda_Motor_Industries_Ltd_CaptionLbl: Label 'Sharda Motor Industries Ltd.';
        Dear_Sir_CaptionLbl: Label 'Dear Sir,';
        Invoice_No__CaptionLbl: Label 'Invoice No. ';
        Amount__Rs__CaptionLbl: Label 'Amount (Rs.)';
        TotalCaptionLbl: Label 'Total';
        DescriptionText: Text[100];
        recGLAct: Record 15;
        recCustomer: Record 18;
        recVendor: Record 23;
        recBankAccount: Record 270;
        BankName: Text[50];
        recGenJnlLine: Record 81;
        CheckInFavourOf: Text[100];
        GenJnlLine4: Record 81;
        GenJnLineRec: Record 81;
        txtOnAccOf: Text;
        dtCheckDate: Date;
        CheckNo: Code[10];
        Narretion: Text;
        LineDescriptiontext: Text;
        GenJnLinebank: Record 81;
        LineAmountTotal: Decimal;
        Docdatejnl: Date;
        GenJou: Record 81;
        "SUM": Decimal;

    //[Scope('Internal')]-PCPL-064
    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        Currency: Record 4;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                IF No > 99999 THEN BEGIN
                    Ones := No DIV (POWER(100, Exponent - 1) * 10);
                    Hundreds := 0;
                END ELSE BEGIN
                    Ones := No DIV POWER(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                END;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                IF No > 99999 THEN
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(100, Exponent - 1) * 10
                ELSE
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;

        IF CurrencyCode <> '' THEN BEGIN
            Currency.GET(CurrencyCode);
            //AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Currency."Currency Numeric Description"); PCPL-064
        END ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'RUPEES');

        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
        // AddToNoText(NoText,NoTextIndex,PrintExponent,FORMAT(No * 100) + '/100');

        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := (No * 100) MOD 10;
        IF TensDec >= 2 THEN BEGIN
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
            IF OnesDec > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
        END ELSE
            IF (TensDec * 10 + OnesDec) > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
            ELSE
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text026);
        IF (CurrencyCode <> '') THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + '' /*Currency."Currency Decimal Description"*/ + ' ONLY')
        ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' PAISA ONLY');
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text029, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    local procedure CustUpdateAmounts(var CustLedgEntry2: Record 21; RemainingAmount2: Decimal)
    begin
        IF (ApplyMethod = ApplyMethod::OneLineOneEntry) OR
           (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
        THEN BEGIN
            GenJnlLine3.RESET;
            GenJnlLine3.SETCURRENTKEY(
              "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
            GenJnlLine3.SETRANGE("Account Type", GenJnlLine3."Account Type"::Customer);
            GenJnlLine3.SETRANGE("Account No.", CustLedgEntry2."Customer No.");
            GenJnlLine3.SETRANGE("Applies-to Doc. Type", CustLedgEntry2."Document Type");
            GenJnlLine3.SETRANGE("Applies-to Doc. No.", CustLedgEntry2."Document No.");
            IF ApplyMethod = ApplyMethod::OneLineOneEntry THEN
                GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine."Line No.")
            ELSE
                GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine2."Line No.");
            IF CustLedgEntry2."Document Type" <> CustLedgEntry2."Document Type"::" " THEN
                IF GenJnlLine3.FIND('-') THEN
                    GenJnlLine3.FIELDERROR(
                      "Applies-to Doc. No.",
                      STRSUBSTNO(
                        Text030,
                        CustLedgEntry2."Document Type", CustLedgEntry2."Document No.",
                        CustLedgEntry2."Customer No."));
        END;

        DocType := FORMAT(CustLedgEntry2."Document Type");
        DocNo := CustLedgEntry2."Document No.";
        ExtDocNo := CustLedgEntry2."External Document No.";
        DocDate := CustLedgEntry2."Posting Date";
        CurrencyCode2 := CustLedgEntry2."Currency Code";

        CustLedgEntry2.CALCFIELDS("Remaining Amount");

        LineAmount :=
          -ABSMin(
            CustLedgEntry2."Remaining Amount" -
            CustLedgEntry2."Remaining Pmt. Disc. Possible" -
            CustLedgEntry2."Accepted Payment Tolerance",
            CustLedgEntry2."Amount to Apply");
        LineAmount2 :=
          ROUND(
            ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
            Currency."Amount Rounding Precision");

        IF ((CustLedgEntry2."Document Type" IN [CustLedgEntry2."Document Type"::Invoice,
                                                CustLedgEntry2."Document Type"::"Credit Memo"]) AND
            (CustLedgEntry2."Remaining Pmt. Disc. Possible" <> 0) AND
            (CustLedgEntry2."Posting Date" <= CustLedgEntry2."Pmt. Discount Date")) OR
           CustLedgEntry2."Accepted Pmt. Disc. Tolerance"
        THEN BEGIN
            LineDiscount := -CustLedgEntry2."Remaining Pmt. Disc. Possible";
            IF CustLedgEntry2."Accepted Payment Tolerance" <> 0 THEN
                LineDiscount := LineDiscount - CustLedgEntry2."Accepted Payment Tolerance";
        END ELSE BEGIN
            IF RemainingAmount2 >=
               ROUND(
                 -ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                   CustLedgEntry2."Amount to Apply"), Currency."Amount Rounding Precision")
            THEN
                LineAmount2 :=
                  ROUND(
                    -ExchangeAmt(CustLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                      CustLedgEntry2."Amount to Apply"), Currency."Amount Rounding Precision")
            ELSE BEGIN
                LineAmount2 := RemainingAmount2;
                LineAmount :=
                  ROUND(
                    ExchangeAmt(CustLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                      LineAmount2), Currency."Amount Rounding Precision");
            END;
            LineDiscount := 0;
        END;
    end;

    local procedure VendUpdateAmounts(var VendLedgEntry2: Record 25; RemainingAmount2: Decimal)
    begin
        IF (ApplyMethod = ApplyMethod::OneLineOneEntry) OR
           (ApplyMethod = ApplyMethod::MoreLinesOneEntry)
        THEN BEGIN
            GenJnlLine3.RESET;
            GenJnlLine3.SETCURRENTKEY(
              "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
            GenJnlLine3.SETRANGE("Account Type", GenJnlLine3."Account Type"::Vendor);
            GenJnlLine3.SETRANGE("Account No.", VendLedgEntry2."Vendor No.");
            GenJnlLine3.SETRANGE("Applies-to Doc. Type", VendLedgEntry2."Document Type");
            GenJnlLine3.SETRANGE("Applies-to Doc. No.", VendLedgEntry2."Document No.");
            IF ApplyMethod = ApplyMethod::OneLineOneEntry THEN
                GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine."Line No.")
            ELSE
                GenJnlLine3.SETFILTER("Line No.", '<>%1', GenJnlLine2."Line No.");
            IF VendLedgEntry2."Document Type" <> VendLedgEntry2."Document Type"::" " THEN
                IF GenJnlLine3.FIND('-') THEN
                    GenJnlLine3.FIELDERROR(
                      "Applies-to Doc. No.",
                      STRSUBSTNO(
                        Text031,
                        VendLedgEntry2."Document Type", VendLedgEntry2."Document No.",
                        VendLedgEntry2."Vendor No."));
        END;

        DocType := FORMAT(VendLedgEntry2."Document Type");
        DocNo := VendLedgEntry2."Document No.";
        ExtDocNo := VendLedgEntry2."External Document No.";
        DocDate := VendLedgEntry2."Posting Date";
        CurrencyCode2 := VendLedgEntry2."Currency Code";
        VendLedgEntry2.CALCFIELDS("Remaining Amount");

        LineAmount :=
          -ABSMin(
            VendLedgEntry2."Remaining Amount" -
            VendLedgEntry2."Remaining Pmt. Disc. Possible" -
            VendLedgEntry2."Accepted Payment Tolerance",
            VendLedgEntry2."Amount to Apply");

        LineAmount2 :=
          ROUND(
            ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2, LineAmount),
            Currency."Amount Rounding Precision");

        IF ((VendLedgEntry2."Document Type" IN [VendLedgEntry2."Document Type"::Invoice,
                                                VendLedgEntry2."Document Type"::"Credit Memo"]) AND
            (VendLedgEntry2."Remaining Pmt. Disc. Possible" <> 0) AND
            (GenJnlLine."Posting Date" <= VendLedgEntry2."Pmt. Discount Date")) OR
           VendLedgEntry2."Accepted Pmt. Disc. Tolerance"
        THEN BEGIN
            LineDiscount := -VendLedgEntry2."Remaining Pmt. Disc. Possible";
            IF VendLedgEntry2."Accepted Payment Tolerance" <> 0 THEN
                LineDiscount := LineDiscount - VendLedgEntry2."Accepted Payment Tolerance";
        END ELSE BEGIN
            IF RemainingAmount2 >=
               ROUND(
                 -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                     VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision")
            THEN BEGIN
                LineAmount2 :=
                  ROUND(
                    -(ExchangeAmt(VendLedgEntry2."Posting Date", GenJnlLine."Currency Code", CurrencyCode2,
                        VendLedgEntry2."Amount to Apply")), Currency."Amount Rounding Precision");
                LineAmount :=
                  ROUND(
                    ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                      LineAmount2), Currency."Amount Rounding Precision");
            END ELSE BEGIN
                LineAmount2 := RemainingAmount2;
                LineAmount :=
                  ROUND(
                    ExchangeAmt(VendLedgEntry2."Posting Date", CurrencyCode2, GenJnlLine."Currency Code",
                      LineAmount2), Currency."Amount Rounding Precision");
            END;
            LineDiscount := 0;
        END;

        IF ExtDocNo = '' THEN
            ExtDocNo := GenJnlLine."External Document No.";
    end;

    //[Scope('Internal')] PCPL-064
    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text1280000;
        ExponentText[4] := Text1280001;
    end;

    //[Scope('Internal')] PCPL-064
    procedure InitializeRequest(BankAcc: Code[20]; LastCheckNo: Code[20]; NewOneCheckPrVend: Boolean; NewReprintChecks: Boolean; NewTestPrint: Boolean; NewPreprintedStub: Boolean)
    begin
        IF BankAcc <> '' THEN
            IF BankAcc2.GET(BankAcc) THEN BEGIN
                UseCheckNo := LastCheckNo;
                OneCheckPrVendor := NewOneCheckPrVend;
                ReprintChecks := NewReprintChecks;
                TestPrint := NewTestPrint;
                PreprintedStub := NewPreprintedStub;
            END;
    end;

    //[Scope('Internal')] PCPL-064
    procedure ExchangeAmt(PostingDate: Date; CurrencyCode: Code[10]; CurrencyCode2: Code[10]; Amount: Decimal) Amount2: Decimal
    begin
        IF (CurrencyCode <> '') AND (CurrencyCode2 = '') THEN
            Amount2 :=
              CurrencyExchangeRate.ExchangeAmtLCYToFCY(
                PostingDate, CurrencyCode, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode))
        ELSE
            IF (CurrencyCode = '') AND (CurrencyCode2 <> '') THEN
                Amount2 :=
                  CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                    PostingDate, CurrencyCode2, Amount, CurrencyExchangeRate.ExchangeRate(PostingDate, CurrencyCode2))
            ELSE
                IF (CurrencyCode <> '') AND (CurrencyCode2 <> '') AND (CurrencyCode <> CurrencyCode2) THEN
                    Amount2 := CurrencyExchangeRate.ExchangeAmtFCYToFCY(PostingDate, CurrencyCode2, CurrencyCode, Amount)
                ELSE
                    Amount2 := Amount;
    end;

    //[Scope('Internal')] PCPL-064
    procedure ABSMin(Decimal1: Decimal; Decimal2: Decimal): Decimal
    begin
        IF ABS(Decimal1) < ABS(Decimal2) THEN
            EXIT(Decimal1);
        EXIT(Decimal2);
    end;

    //[Scope('Internal')] // PCPL-064
    procedure InputBankAccount()
    begin
        IF BankAcc2."No." <> '' THEN BEGIN
            BankAcc2.GET(BankAcc2."No.");
            BankAcc2.TESTFIELD("Last Check No.");
            UseCheckNo := BankAcc2."Last Check No.";
        END;
    end;
}

