report 50013 "Purch. Bill for RTGS/NEt"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                    WHERE(Open = FILTER(true));
                //"Print Document" =FILTER(true)); // PCPL-064

                trigger OnAfterGetRecord()
                begin
                    recTDSEntry.RESET;
                    recTDSEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    recTDSEntry.SETRANGE(recTDSEntry."Document No.", "Vendor Ledger Entry"."Document No.");
                    recTDSEntry.SETRANGE(recTDSEntry."Posting Date", "Vendor Ledger Entry"."Posting Date");
                    recTDSEntry.SETRANGE(recTDSEntry."Party Code", "Vendor Ledger Entry"."Vendor No.");
                    IF recTDSEntry.FIND('-') THEN BEGIN
                        dataGrossAmnt := recTDSEntry."Invoice Amount";
                        dataTDSAmnt := recTDSEntry."Total TDS Including SHE CESS";
                        dataNetAmnt := dataGrossAmnt - dataTDSAmnt;
                    END
                    ELSE BEGIN
                        CALCFIELDS("Original Amount");
                        dataGrossAmnt := -"Vendor Ledger Entry"."Original Amount";
                        dataTDSAmnt := 0;
                        dataNetAmnt := dataGrossAmnt - dataTDSAmnt;
                    END;

                    //Section Code
                    RecVendor.RESET;
                    RecVendor.SETRANGE(RecVendor."No.", "Vendor Ledger Entry"."Vendor No.");
                    IF RecVendor.FINDSET THEN
                        REPEAT
                            RecVLE.RESET;
                            RecVLE.SETRANGE(RecVLE."Document No.", "Vendor Ledger Entry"."Document No.");
                            RecVLE.SETRANGE(RecVLE."Document Type", RecVLE."Document Type"::Invoice);
                            IF RecVLE.FINDSET THEN
                                REPEAT
                                    CALCFIELDS("Vendor Ledger Entry"."Remaining Amount");
                                    dataTotalNetAmnt := dataTotalNetAmnt + dataNetAmnt;
                                    dataTotalPayableAmnt := dataTotalPayableAmnt + "Vendor Ledger Entry"."Remaining Amount";
                                UNTIL RecVLE.NEXT = 0;
                        UNTIL RecVendor.NEXT = 0;
                    //Section Code

                    //For Payment
                    //Section Code Footer

                    dataGrossAmnt := 0;
                    dataTDSAmnt := 0;

                    // >> 002 Start
                    rec_Vendor.RESET;
                    rec_VendorBankAccount.RESET;
                    introw += 1;  //Nirmal
                    CustomerReferenceNo := '';
                    PaymentMode := '';
                    DebitAccountNo := '';
                    VendorBankCode := '';
                    CustomerReferenceNo := CREATEGUID;

                    PaymentMode := 'NE';
                    // << 002 End

                    //rec_Vendor.GET("Vendor No.");
                    rec_VendorBankAccount.RESET;
                    rec_VendorBankAccount.SETRANGE("Vendor No.", "Vendor No.");
                    IF rec_VendorBankAccount.FINDFIRST THEN
                        VendorBankCode := rec_VendorBankAccount.Code;

                    rec_VendorBankAccount.RESET;
                    rec_VendorBankAccount.GET("Vendor No.", VendorBankCode);


                    fctEnterCell(introw, 1, TRUE, FORMAT('P'));
                    fctEnterCell(introw, 2, TRUE, FORMAT(PaymentMode));
                    fctEnterCell(introw, 3, TRUE, DELSTR(
                                    FORMAT(CONVERTSTR(CONVERTSTR(CONVERTSTR(CONVERTSTR(FORMAT(CustomerReferenceNo), '-', ' '), '{', ' '), '}', ' '), ' ', '1')),
                                     15, 100));
                    fctEnterCell(introw, 4, TRUE, FORMAT('0900911389500147'));
                    fctEnterCell(introw, 5, TRUE, FORMAT('INR'));
                    fctEnterCell(introw, 6, TRUE, FORMAT(WORKDATE));
                    fctEnterCell(introw, 7, TRUE, FORMAT('INR'));
                    fctEnterCell(introw, 8, TRUE, FORMAT((-dataTotalPayableAmnt)));
                    fctEnterCell(introw, 9, TRUE, FORMAT(rec_Vendor.Name));
                    // fctEnterCell(introw, 10, TRUE, FORMAT(rec_VendorBankAccount."IFSC Code")); //PCPL-064
                    fctEnterCell(introw, 11, TRUE, FORMAT(rec_VendorBankAccount."Bank Account No."));
                    fctEnterCell(introw, 12, TRUE, FORMAT('INR'));
                    fctEnterCell(introw, 13, TRUE, FORMAT(''));
                    fctEnterCell(introw, 14, TRUE, FORMAT(''));
                    fctEnterCell(introw, 15, TRUE, FORMAT(''));
                    fctEnterCell(introw, 16, TRUE, FORMAT(''));
                    fctEnterCell(introw, 17, TRUE, FORMAT(''));
                    fctEnterCell(introw, 18, TRUE, FORMAT(''));
                    fctEnterCell(introw, 19, TRUE, FORMAT(''));
                    fctEnterCell(introw, 20, TRUE, FORMAT(''));
                    fctEnterCell(introw, 21, TRUE, FORMAT(''));
                    fctEnterCell(introw, 22, TRUE, FORMAT(''));
                    fctEnterCell(introw, 23, TRUE, FORMAT(''));
                    // fctEnterCell(introw, 24, TRUE, FORMAT(rec_VendorBankAccount."IFSC Code")); //Pcpl-064
                    fctEnterCell(introw, 25, TRUE, FORMAT(rec_VendorBankAccount.Name));
                    fctEnterCell(introw, 26, TRUE, FORMAT('REMITTANCE'));
                    fctEnterCell(introw, 27, TRUE, FORMAT(''));
                    fctEnterCell(introw, 28, TRUE, FORMAT(''));
                    fctEnterCell(introw, 29, TRUE, FORMAT(''));
                    fctEnterCell(introw, 30, TRUE, FORMAT(''));
                    fctEnterCell(introw, 31, TRUE, FORMAT(rec_Vendor."E-Mail"));
                    fctEnterCell(introw, 32, TRUE, FORMAT(''));
                    fctEnterCell(introw, 33, TRUE, FORMAT(''));
                    fctEnterCell(introw, 34, TRUE, FORMAT(''));
                    fctEnterCell(introw, 35, TRUE, FORMAT(''));
                    //fctEnterCell(introw, 36, TRUE, FORMAT(rec_VendorBankAccount."Account Type")); //PCPL-064
                    fctEnterCell(introw, 37, TRUE, FORMAT(rec_VendorBankAccount.Name));
                    fctEnterCell(introw, 38, TRUE, FORMAT(rec_VendorBankAccount.Address));
                    fctEnterCell(introw, 39, TRUE, FORMAT(rec_VendorBankAccount."Address 2"));
                    fctEnterCell(introw, 40, TRUE, FORMAT(rec_VendorBankAccount.City + ' - ' + rec_VendorBankAccount."Post Code"));
                    fctEnterCell(introw, 41, TRUE, FORMAT(''));
                    fctEnterCell(introw, 42, TRUE, FORMAT(''));
                    fctEnterCell(introw, 43, TRUE, FORMAT(''));

                    // << 002 END
                    //Section Code Footer
                    //For Payment










                end;

                trigger OnPreDataItem()
                begin
                    introw := 2;  //Nirmal   Introw:=2;
                    //Section Code

                    dataTotalNetAmnt := 0;
                    dataTotalPayableAmnt := 0;
                end;
            }
            dataitem("<Vendor Ledger Entry1>"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                    WHERE(Open = FILTER(true));
                // "Print Document" = FILTER(true)); PCPL-064

                trigger OnAfterGetRecord()
                begin
                    //Section Code

                    // >> 002 Start
                    rec_Vendor.RESET;
                    rec_VendorBankAccount.RESET;
                    //MESSAGE('Row count at body section '+FORMAT(introw));
                    introw += 1;
                    CustomerReferenceNo := '';
                    PaymentMode := '';
                    DebitAccountNo := '';
                    VendorBankCode := '';
                    VendorCurrencyCode := '';
                    CustomerReferenceNo := CREATEGUID;


                    PaymentMode := 'NE';

                    // << 002 End
                    IF rec_Vendor.GET("Vendor No.") THEN;
                    rec_VendorBankAccount.SETRANGE("Vendor No.", "Vendor No.");
                    IF rec_VendorBankAccount.FINDFIRST THEN
                        VendorBankCode := rec_VendorBankAccount.Code;

                    rec_VendorBankAccount.RESET;
                    rec_VendorBankAccount.GET("Vendor No.", VendorBankCode);
                    fctEnterCell(introw, 1, FALSE, FORMAT('I'));
                    fctEnterCell(introw, 2, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 3, FALSE, FORMAT("External Document No."));
                    fctEnterCell(introw, 4, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 5, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 6, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 7, FALSE, FORMAT(' '));
                    CALCFIELDS("<Vendor Ledger Entry1>"."Remaining Amount");
                    fctEnterCell(introw, 8, FALSE, FORMAT((-"<Vendor Ledger Entry1>"."Remaining Amount")));
                    fctEnterCell(introw, 9, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 10, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 11, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 12, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 13, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 14, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 15, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 16, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 17, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 18, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 19, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 20, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 21, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 22, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 23, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 24, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 25, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 26, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 27, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 28, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 29, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 30, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 31, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 32, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 33, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 34, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 35, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 36, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 37, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 38, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 39, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 40, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 41, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 42, FALSE, FORMAT(' '));
                    fctEnterCell(introw, 43, FALSE, FORMAT(' '));
                    // << 002 END
                    //Section Code
                end;
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

    trigger OnPostReport()
    begin
        /* //PCPL-064
        tmpExcelBuffer.CreateBookAndOpenExcel('', 'RTGS-NEFT Details', '', COMPANYNAME, USERID);
                tmpExcelBuffer.GiveUserControl;
                ERROR('');*/ //PCPL-064
                             //<<PCPL-064     
        tmpExcelBuffer.CreateNewBook('RTGS-NEFT Details');
        tmpExcelBuffer.WriteSheet('RTGS-NEFT Details', CompanyName, UserId);
        tmpExcelBuffer.CloseBook();
        tmpExcelBuffer.SetFriendlyFilename('RTGS-NEFT Details');
        tmpExcelBuffer.OpenExcel();
        //>>PCPL-064


    end;

    trigger OnPreReport()
    begin

        recCompInfo.GET;
        tmpExcelBuffer.DELETEALL;
        introw := 1;

        fctEnterCell(introw, 1, TRUE, FORMAT('Identifier'));
        fctEnterCell(introw, 2, TRUE, FORMAT('Payment Mode'));
        fctEnterCell(introw, 3, TRUE, FORMAT('Cust. Reference Number'));
        fctEnterCell(introw, 4, TRUE, FORMAT('Debit Account No.'));
        fctEnterCell(introw, 5, TRUE, FORMAT('Curency Code'));
        fctEnterCell(introw, 6, TRUE, FORMAT('Txn. Date'));
        fctEnterCell(introw, 7, TRUE, FORMAT('Txn. Currency Code'));
        fctEnterCell(introw, 8, TRUE, FORMAT('Amount'));
        fctEnterCell(introw, 9, TRUE, FORMAT('Beneficiary Name'));
        fctEnterCell(introw, 10, TRUE, FORMAT('Beneficiary Code'));
        fctEnterCell(introw, 11, TRUE, FORMAT('Beneficiary Acc. No.'));
        fctEnterCell(introw, 12, TRUE, FORMAT('Beneficiary Currency Code'));
        fctEnterCell(introw, 13, TRUE, FORMAT('Beneficiary Address Line 1'));
        fctEnterCell(introw, 14, TRUE, FORMAT('Beneficiary Address Line 2'));
        fctEnterCell(introw, 15, TRUE, FORMAT('Beneficiary Address Line 3'));
        fctEnterCell(introw, 16, TRUE, FORMAT('Beneficiary Address Line 4'));
        fctEnterCell(introw, 17, TRUE, FORMAT('Beneficiary Address Line 5'));
        fctEnterCell(introw, 18, TRUE, FORMAT('Beneficiary Mailing Name'));
        fctEnterCell(introw, 19, TRUE, FORMAT('Beneficiary Mailing Address Line 1'));
        fctEnterCell(introw, 20, TRUE, FORMAT('Beneficiary Mailing Address Line 2'));
        fctEnterCell(introw, 21, TRUE, FORMAT('Beneficiary Mailing Address Line 3'));
        fctEnterCell(introw, 22, TRUE, FORMAT('Beneficiary Mailing Address Line 4'));
        fctEnterCell(introw, 23, TRUE, FORMAT('Beneficiary Mailing Address Line 5'));
        fctEnterCell(introw, 24, TRUE, FORMAT('Drawee Bank Code'));
        fctEnterCell(introw, 25, TRUE, FORMAT('Beneficiary Bank Name'));
        fctEnterCell(introw, 26, TRUE, FORMAT('Payment Detail 1'));
        fctEnterCell(introw, 27, TRUE, FORMAT('Payment Detail 2'));
        fctEnterCell(introw, 28, TRUE, FORMAT('Cheque No.'));
        fctEnterCell(introw, 29, TRUE, FORMAT('Cheque Date'));
        fctEnterCell(introw, 30, TRUE, FORMAT(''''));
        fctEnterCell(introw, 31, TRUE, FORMAT('E-Mail ID'));
        fctEnterCell(introw, 32, TRUE, FORMAT('Payable Loc'));
        fctEnterCell(introw, 33, TRUE, FORMAT('Del Loc'));
        fctEnterCell(introw, 34, TRUE, FORMAT('Del To'));
        fctEnterCell(introw, 35, TRUE, FORMAT('Print Loc'));
        fctEnterCell(introw, 36, TRUE, FORMAT('Account Type'));
        fctEnterCell(introw, 37, TRUE, FORMAT('Beneficiary Bank Name'));
        fctEnterCell(introw, 38, TRUE, FORMAT('Beneficiary Bank Addr 1'));
        fctEnterCell(introw, 39, TRUE, FORMAT('Beneficiary Bank Addr 2'));
        fctEnterCell(introw, 40, TRUE, FORMAT('Beneficiary Bank Addr 3'));
        fctEnterCell(introw, 41, TRUE, FORMAT('Overseas Charges'));
        fctEnterCell(introw, 42, TRUE, FORMAT('Beneficiary Mobile Number'));
        fctEnterCell(introw, 43, TRUE, FORMAT('Purpose Code'));

        // >> 002 End
    end;

    var
        recCompInfo: Record 79;
        recTDSEntry: Record "TDS Entry";//13729; PCPL-064;
        dataTDSAmnt: Decimal;
        dataGrossAmnt: Decimal;
        dataNetAmnt: Decimal;
        dataTotalNetAmnt: Decimal;
        dataTotalPayableAmnt: Decimal;
        tmpExcelBuffer: Record 370;
        rec_Vendor: Record 23;
        rec_VendorBankAccount: Record 288;
        introw: Integer;
        CustomerReferenceNo: Text[100];
        PaymentMode: Code[20];
        DebitAccountNo: Code[20];
        VendorBankCode: Code[20];
        VendorCurrencyCode: Code[20];
        rec_VendorLedgerEntry: Record 25;
        RecVLE: Record 25;
        RecVendor: Record 23;

    // [Scope('Internal')] //PCPL-064
    // /[Scope('Extension')] //PCPL-064
    procedure fctEnterCell(xpos: Integer; ypos: Integer; bold: Boolean; data: Text[250])
    begin
        tmpExcelBuffer.VALIDATE("Row No.", xpos);
        tmpExcelBuffer.VALIDATE("Column No.", ypos);
        tmpExcelBuffer.Bold := bold;
        tmpExcelBuffer."Cell Value as Text" := data;
        tmpExcelBuffer.INSERT;
    end;
}

