page 60001 "Journal Voucher-"
{
    // 
    // Dhanashri                         15.03.11        length increased from 30 to 100 for AccName
    //                                                   Validation added on posting for voucher narration
    // Bhuvnesh Soni         PS60184     04/08/11       Field added on form PoT
    // 
    // Dhanshri              001         21.11.11        Changes made for Approval
    // 
    // Anupam Sharma         002         07-10-13        Removed the Self Approval functionality before posting the JV's

    AutoSplitKey = true;
    Caption = 'Journal Voucher';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = 81;

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; '') //CurrentJnlBatchName) //pcpl-065
            {
                Caption = 'Batch Name';
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SAVERECORD;
                    GenJnlManagement.LookupName(CurrentJnlBatchName, Rec); //pcpl-065
                    CurrPage.UPDATE(FALSE);
                end;

                trigger OnValidate()
                begin
                    GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("ST Pure Agent"; '')// Rec."ST Pure Agent") //pcpl-065
                {
                    Visible = false;
                }
                // field("Serv. Tax on Advance Payment"; Rec."Serv. Tax on Advance Payment")
                // {
                //     Visible = false;
                // }
                // field(PoT; Rec.PoT)
                // {
                //     Visible = false;
                // }
                // field("Service Type (Rev. Chrg.)"; Rec."Service Type (Rev. Chrg.)")
                // {
                //     Visible = false;
                // }
                // field("Consignment Note No."; Rec."Consignment Note No.")
                // {
                //     Visible = false;
                // }
                // field("Declaration Form (GTA)"; Rec."Declaration Form (GTA)")
                // {
                //     Visible = false;
                // }
                field("External Document No."; Rec."External Document No.")
                {
                    Visible = false;
                }
                field("Party Type"; Rec."Party Type")
                {
                    Visible = false;
                }
                field("Party Code"; Rec."Party Code")
                {
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                    end;
                }
                field("Account No."; Rec."Account No.")
                {

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("T.C.A.N. No."; Rec."T.C.A.N. No.")
                {
                    Visible = false;
                }
                field("T.A.N. No."; Rec."T.A.N. No.")
                {
                    Visible = false;
                }
                // field("E.C.C. No."; Rec."E.C.C. No.")
                // {
                //     Visible = false;
                // }
                field(Description; Rec.Description)
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
                // field("TDS Nature of Deduction"; Rec."TDS Nature of Deduction")
                // {
                //     Visible = false;
                // }
                field("Nature of Remittance"; Rec."Nature of Remittance")
                {
                    Visible = false;
                }
                field("Act Applicable"; Rec."Act Applicable")
                {
                    Visible = false;
                }
                // field("Country Code"; Rec."Country Code")
                // {
                //     Visible = false;
                // }
                field("TCS Nature of Collection"; Rec."TCS Nature of Collection")
                {
                    Caption = 'TCS Nature of Collection';
                    Visible = false;
                }
                field("TDS Certificate Receivable"; Rec."TDS Certificate Receivable")
                {
                    Visible = false;
                }
                field("Assessee Code"; '')// Rec."Assessee Code") //pcpl-065
                {
                    Visible = false;
                }
                // field("TDS/TCS %"; Rec."TDS/TCS %")
                // {
                //     Visible = false;
                // }
                // field("TDS/TCS Amount"; Rec."TDS/TCS Amount")
                // {
                //     Visible = false;
                // }
                // field("Surcharge %"; Rec."Surcharge %")
                // {
                //     Visible = false;
                // }
                // field("Surcharge Amount"; Rec."Surcharge Amount")
                // {
                //     Visible = false;
                // }
                field("Line No."; Rec."Line No.")
                {
                }
                // field("eCESS %"; Rec."eCESS %")
                // {
                //     Visible = false;
                // }
                // field("eCESS on TDS/TCS Amount"; Rec."eCESS on TDS/TCS Amount")
                // {
                //     Visible = false;
                // }
                // field("SHE Cess % on TDS/TCS"; Rec."SHE Cess % on TDS/TCS")
                // {
                //     Visible = false;
                // }
                // field("SHE Cess on TDS/TCS Amount"; Rec."SHE Cess on TDS/TCS Amount")
                // {
                //     Visible = false;
                // }
                // field("Total TDS/TCS Incl. SHE CESS"; Rec."Total TDS/TCS Incl. SHE CESS")
                // {
                //     Visible = false;
                // }
                // field("Work Tax Nature Of Deduction"; Rec."Work Tax Nature Of Deduction")
                // {
                //     Visible = false;
                // }
                // field("Work Tax Base Amount"; Rec."Work Tax Base Amount")
                // {
                //     Visible = false;
                // }
                // field("Work Tax %"; Rec."Work Tax %")
                // {
                //     Visible = false;
                // }
                // field("Work Tax Amount"; Rec."Work Tax Amount")
                // {
                //     Visible = false;
                // }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    Visible = false;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    Visible = false;
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    AssistEdit = true;
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN
                            Rec.VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);

                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Visible = false;
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                    Visible = false;
                }
                field("Bal. VAT Amount"; Rec."Bal. VAT Amount")
                {
                    Visible = false;
                }
                field("Bal. VAT Difference"; Rec."Bal. VAT Difference")
                {
                    Visible = false;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {

                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Bal. Gen. Posting Type"; Rec."Bal. Gen. Posting Type")
                {
                }
                field("Bal. Gen. Bus. Posting Group"; Rec."Bal. Gen. Bus. Posting Group")
                {
                }
                field("Bal. Gen. Prod. Posting Group"; Rec."Bal. Gen. Prod. Posting Group")
                {
                }
                field("Bal. VAT Bus. Posting Group"; Rec."Bal. VAT Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Bal. VAT Prod. Posting Group"; Rec."Bal. VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
                {
                    Visible = false;
                }
                field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode4; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode6; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode7; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode8; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Visible = false;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    Visible = false;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    Visible = false;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    Visible = false;
                }
                field("On Hold"; Rec."On Hold")
                {
                    Visible = false;
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
                {
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Visible = false;
                }
                field("Include Serv. Tax in TDS Base"; '')// Rec."Include Serv. Tax in TDS Base") //pcpl-065
                {
                    Visible = false;
                }
                field("Service Tax Rounding Type"; '')// Rec."Service Tax Rounding Type")//pcpl-065
                {
                    Visible = false;
                }
                field("Service Tax Rounding Precision"; '')// Rec."Service Tax Rounding Precision")//pcpl-065
                {
                    Visible = false;
                }
                field("Service Tax Type"; '')// Rec."Service Tax Type")//pcpl-065
                {
                    Visible = false;
                }
                field("CWIP G/L Type"; '')// Rec."CWIP G/L Type") //pcpl-065
                {
                    Visible = false;
                }
            }
            group(Group1)
            {
                fixed(FixedLayout)
                {
                    group("Account Name")
                    {
                        Caption = 'Account Name';
                        field(AccName; AccName)
                        {
                            Caption = 'Account Name';
                            Editable = false;
                        }
                    }
                    group("Bal. Account Name")
                    {
                        Caption = 'Bal. Account Name';
                        field(BalAccName; BalAccName)
                        {
                            Caption = 'Bal. Account Name';
                            Editable = false;
                        }
                    }
                    group("Debit Amount1") //pcpl-065
                    {
                        Caption = 'Debit Amount';
                        field("Debit Amount2"; Rec."Debit Amount")
                        {
                            Editable = false;
                        }
                    }
                    group("Total Debit Amount")
                    {
                        Caption = 'Total Debit Amount';
                        field(TotalDebitAmount; TotalDebitAmount)
                        {
                            Editable = false;
                        }
                    }
                    group("Credit Amount1") //pcpl-065
                    {
                        Caption = 'Credit Amount';
                        field("Credit Amount2"; Rec."Credit Amount")
                        {
                            Editable = false;
                        }
                    }
                    group("Total Credit Amount")
                    {
                        Caption = 'Total Credit Amount';
                        field(TotalCreditAmount; TotalCreditAmount)
                        {
                            Editable = false;
                        }
                    }
                    group("Balance1") //pcpl-065
                    {
                        Caption = 'Balance';
                        field(Balance; Balance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = BalanceVisible;
                        }
                    }
                    group("Total Balance")
                    {
                        Caption = 'Total Balance';
                        field(TotalBalance; TotalBalance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            AutoFormatType = 1;
                            Caption = 'Total Balance';
                            Editable = false;
                            Visible = TotalBalanceVisible;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Narration")
            {
                Caption = '&Narration';
                Image = Description;
                action("Line Narration")
                {
                    Caption = 'Line Narration';
                    Image = LineDescription;
                    // RunObject = Page "Gen. Journal Narration"; //pcpl-065
                    // RunPageLink = "Journal Template Name" = FIELD("Journal Template Name"),
                    //               "Journal Batch Name" = FIELD("Journal Batch Name"),
                    //               "Gen. Journal Line No." = FIELD("Line No."),
                    //               "Document No." = FIELD("Document No.");
                    ShortCutKey = 'Shift+Ctrl+N';
                }
                action("Voucher Narration")
                {
                    Caption = 'Voucher Narration';
                    Image = VoucherDescription;
                    // //RunObject = Page "Gen. Journal Voucher Narration"; //pcpl-065
                    // RunPageLink = "Journal Template Name" = FIELD("Journal Template Name"),
                    //               "Journal Batch Name" = FIELD("Journal Batch Name"),
                    //               "Document No." = FIELD("Document No."),
                    //               "Gen. Journal Line No." = FILTER(0);
                    ShortCutKey = 'Shift+Ctrl+V';
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
            }
            group("A&ccount")
            {
                Caption = 'A&ccount';
                Image = ChartOfAccounts;
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Codeunit 15; //pcpl-065
                    ShortCutKey = 'Shift+F7';
                }
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    RunObject = Codeunit 14; //pcpl-065
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Apply Entries")
                {
                    Caption = 'Apply Entries';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Codeunit 225;
                    ShortCutKey = 'Shift+F11';
                }
                action("Insert Conv. LCY Rndg. Lines")
                {
                    Caption = 'Insert Conv. LCY Rndg. Lines';
                    Image = InsertCurrency;
                    RunObject = Codeunit 407; //pcpl-065
                }
                separator("-")
                {
                    Caption = '-';
                }
                action("&Get Standard Journals")
                {
                    Caption = '&Get Standard Journals';
                    Image = GetStandardJournal;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    var
                        StdGenJnl: Record 750;
                    begin
                        StdGenJnl.FILTERGROUP := 2;
                        StdGenJnl.SETRANGE("Journal Template Name", Rec."Journal Template Name");
                        StdGenJnl.FILTERGROUP := 0;

                        IF PAGE.RUNMODAL(PAGE::"Standard General Journals", StdGenJnl) = ACTION::LookupOK THEN BEGIN
                            StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl, CurrentJnlBatchName);
                            MESSAGE(Text000, StdGenJnl.Code);
                        END;

                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("&Save as Standard Journal")
                {
                    Caption = '&Save as Standard Journal';
                    Image = SaveasStandardJournal;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    var
                        GenJnlBatch: Record 232;
                        GeneralJnlLines: Record 81;
                        StdGenJnl: Record 750; //pcpl-065
                        SaveAsStdGenJnl: Report 750; //pcpl-065;
                    begin
                        GeneralJnlLines.SETFILTER("Journal Template Name", Rec."Journal Template Name");
                        GeneralJnlLines.SETFILTER("Journal Batch Name", CurrentJnlBatchName);
                        CurrPage.SETSELECTIONFILTER(GeneralJnlLines);
                        GeneralJnlLines.COPYFILTERS(Rec);

                        GenJnlBatch.GET(Rec."Journal Template Name", CurrentJnlBatchName); //pcpl-065
                        SaveAsStdGenJnl.Initialise(GeneralJnlLines, GenJnlBatch);
                        SaveAsStdGenJnl.RUNMODAL;
                        IF NOT SaveAsStdGenJnl.GetStdGeneralJournal(StdGenJnl) THEN
                            EXIT;

                        MESSAGE(Text001, StdGenJnl.Code);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Reconcile)
                {
                    Caption = 'Reconcile';
                    Image = Reconcile;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction()
                    begin
                        GLReconcile.SetGenJnlLine(Rec);
                        GLReconcile.RUN;
                    end;
                }
                action("Test Report")
                {
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintGenJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", Rec);
                        CurrentJnlBatchName := Rec.GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := Rec.GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        AfterGetCurrentRecord;
    end;

    trigger OnInit()
    begin
        TotalBalanceVisible := TRUE;
        BalanceVisible := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateBalance;
        UpdateDebitCreditAmount;
        Rec.SetUpNewLine(xRec, Balance, BelowxRec);
        CLEAR(ShortcutDimCode);
        CLEAR(AccName);
        AfterGetCurrentRecord;
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        BalAccName := '';
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') AND (Rec."Journal Template Name" = '');
        IF OpenedFromBatch THEN BEGIN
            CurrentJnlBatchName := Rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            EXIT;
        END;
        //GenJnlManagement.TemplateSelectionForVouchers(PAGE::"Journal Voucher", FALSE, 6, Rec, JnlSelected); //pcpl-065
        IF NOT JnlSelected THEN
            ERROR('');
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
    end;

    var
        ChangeExchangeRate: Page 511;
        GLReconcile: Page 345;
        GenJnlManagement: Codeunit 230;
        ReportPrint: Codeunit 228;
        CurrentJnlBatchName: Code[10];
        AccName: Text[100];
        BalAccName: Text[50];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        Text000: Label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
        Text001: Label 'Standard General Journal %1 has been successfully created.';
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;
        OpenedFromBatch: Boolean;
        [InDataSet]
        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;

    local procedure UpdateBalance()
    begin
        GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    local procedure UpdateDebitCreditAmount()
    begin
        // GenJnlManagement.CalcTotDebitTotCreditAmount(Rec, TotalDebitAmount, TotalCreditAmount, FALSE); //pcpl-065

    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SAVERECORD;
        GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.UPDATE(FALSE);
    end;

    local procedure AfterGetCurrentRecord()
    begin
        xRec := Rec;
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        UpdateBalance;
        UpdateDebitCreditAmount;
    end;
}

