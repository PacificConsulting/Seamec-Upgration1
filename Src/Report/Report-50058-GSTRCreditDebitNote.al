report 50058 "GSTR- Credit/Debit Note"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.", "Document Line No.", "GST Component Code")
                                ORDER(Ascending)
                                WHERE("Entry Type" = CONST("Initial Entry"));
            RequestFilterFields = "Posting Date", "Transaction Type";

            trigger OnAfterGetRecord()
            begin
                IF "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' THEN
                    CurrReport.SKIP;

                IF SalesInvoiceHeader.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                    //IF NOT SalesInvoiceHeader."Debit Note" THEN PCL-064
                    CurrReport.SKIP;
                END;
                InitializeRequest;
                IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN;

                IF NoBuyer <> "Buyer/Seller Reg. No." THEN BEGIN
                    NoOfRecipient := NoOfRecipient + 1;
                    NoBuyer := "Buyer/Seller Reg. No.";
                END;
                txtData[1] := FORMAT("Posting Date");
                // Posted sales Invoice
                IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                    txtData[2] := "Document No.";
                    txtData[3] := 'C';
                END ELSE
                    IF SalesInvoiceHeader.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                        txtData[2] := SalesInvoiceHeader."No.";
                        txtData[6] := FORMAT(SalesInvoiceHeader."Sell-to Customer Name");
                        txtData[41] := SalesInvoiceHeader."Sell-to Address";
                        // txtData[4] := FORMAT(SalesInvoiceHeader."Document Date");
                        IF recCustomer.GET("Source No.") THEN BEGIN
                            txtData[42] := recCustomer.City;
                            IF recState.GET(recCustomer."State Code") THEN;
                            txtData[8] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                        END;
                        IF SalesInvLine.GET("Document No.", "Document Line No.") THEN BEGIN
                            txtData[10] := SalesInvLine.Description;
                            txtData[13] := SalesInvLine."Unit of Measure Code";
                            txtData[14] := FORMAT(SalesInvLine."Unit Price");
                            txtData[15] := FORMAT(SalesInvLine."Line Discount Amount");
                        END;
                        txtData[3] := 'D';
                    END;

                IF (GETFILTER("Transaction Type") = 'Sales') THEN BEGIN
                    IF "Document Type" = "Document Type"::"Credit Memo" THEN
                        txtData[5] := "Document No.";   //temp comment
                                                        //txtData[5] := "Detailed GST Ledger Entry"."Application Doc. No";      //PCPL-25
                END ELSE
                    txtData[5] := "External Document No.";

                IF PurchInvHeader.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                    txtData[6] := FORMAT(PurchInvHeader."Buy-from Vendor Name");
                    txtData[41] := PurchInvHeader."Buy-from Address";
                    txtData[4] := FORMAT(PurchInvHeader."Document Date");
                    IF recVend.GET(PurchInvHeader."Buy-from Vendor No.") THEN BEGIN
                        txtData[42] := recVend.City;
                        IF recState.GET(recVend."State Code") THEN;
                        txtData[8] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                    END;
                    //txtData[25] := FORMAT(PurchInvHeader."Document Date");
                END ELSE
                    IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Payment);
                        CustLedgerEntry.SETRANGE("Document No.", recSalesInvhrd."Applies-to Doc. No.");
                        CustLedgerEntry.SETRANGE("GST on Advance Payment", TRUE);
                        IF CustLedgerEntry.FINDFIRST THEN BEGIN
                            txtData[29] := FORMAT(CustLedgerEntry."Posting Date");
                            txtData[30] := (CustLedgerEntry."Document No.");
                            txtData[31] := FORMAT(CustLedgerEntry.Amount);
                        END;
                        txtData[4] := FORMAT(recSalesInvhrd."Document Date");
                        txtData[6] := FORMAT(recSalesInvhrd."Sell-to Customer Name");
                        txtData[41] := recSalesInvhrd."Sell-to Address";
                        IF recCustomer.GET("Source No.") THEN BEGIN
                            txtData[42] := recCustomer.City;
                            IF recState.GET(recCustomer."State Code") THEN;
                            txtData[8] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                        END;
                    END;

                txtData[7] := FORMAT("Detailed GST Ledger Entry"."Buyer/Seller Reg. No.");
                TotalAmount += ABS("GST Base Amount" + "GST Amount");

                IF "Reverse Charge" THEN
                    txtData[26] := 'Y'
                ELSE
                    txtData[26] := 'N';
                txtData[9] := FORMAT("Detailed GST Ledger Entry"."GST Group Type");

                IF SalesInvoiceLine.GET("Document No.", "Document Line No.") THEN BEGIN
                    txtData[10] := SalesInvoiceLine.Description;
                    txtData[13] := SalesInvoiceLine."Unit of Measure Code";
                    txtData[14] := FORMAT(SalesInvoiceLine."Unit Price");
                    txtData[15] := FORMAT(SalesInvoiceLine."Line Discount Amount");
                END
                ELSE
                    IF PurchInvLine.GET("Document No.", "Document Line No.") THEN BEGIN
                        txtData[10] := PurchInvLine.Description;
                        txtData[13] := PurchInvLine."Unit of Measure Code";
                        txtData[14] := FORMAT(PurchInvLine."Direct Unit Cost");
                        txtData[15] := FORMAT(PurchInvLine."Line Discount Amount");
                    END;

                txtData[11] := "Detailed GST Ledger Entry"."HSN/SAC Code";
                txtData[12] := FORMAT(ABS(Quantity));
                txtData[16] := FORMAT(ABS("GST Base Amount"));

                IF "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' THEN BEGIN
                    txtData[17] := FORMAT(ABS("GST %"));
                    txtData[18] := FORMAT(ABS("GST Amount"));
                    txtData[19] := FORMAT(ABS("GST %"));
                    txtData[20] := FORMAT(ABS("GST Amount"));
                END ELSE BEGIN
                    txtData[21] := FORMAT(ABS("GST %"));
                    txtData[22] := FORMAT(ABS("GST Amount"));
                END;
                txtData[23] := ''; //Cess rate
                txtData[24] := ''; //Cess Amt
                txtData[25] := '';
                txtData[27] := ''; //nill rated
                txtData[28] := '';
                txtData[29] := '';
                txtData[30] := '';
                txtData[31] := '';
                //PCPL-064
                /*IF "Sales Invoice Type" = "Detailed GST Ledger Entry"."Sales Invoice Type"::Export THEN BEGIN
                    IF "Detailed GST Ledger Entry"."GST Without Payment of Duty" THEN
                        txtData[35] := 'Export Without Payment of GST'
                    ELSE
                        txtData[35] := 'Export With Payment of GST';
                END;*/ //PCPL-064
                txtData[36] := '';  //Shipping port code
                txtData[37] := '';
                txtData[38] := '';
                //IF "Detailed GST Ledger Entry"."GST Amount" <> 0 THEN
                txtData[39] := '';
                txtData[40] := "Detailed GST Ledger Entry"."Location  Reg. No.";
                //txtData[43] := "Detailed GST Ledger Entry"."Buyer/Seller State Code"; PCPL-064
                txtData[44] := '';

                IF "GST Vendor Type" <> "Detailed GST Ledger Entry"."GST Vendor Type"::" " THEN
                    txtData[45] := FORMAT("Detailed GST Ledger Entry"."GST Vendor Type")
                ELSE
                    txtData[45] := FORMAT("Detailed GST Ledger Entry"."GST Customer Type");
                IF PrintToExcel THEN
                    MakeExcelDataBody;
                NoOfRecords := NoOfRecords + 1;
            end;

            trigger OnPostDataItem()
            begin
                // ExcelBuf.NewRow;
                // ExcelBuf.AddColumn('No. of Recipients',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.AddColumn('No. of Invoices',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.AddColumn('Total Invoice Value',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.NewRow;
                // ExcelBuf.AddColumn(NoOfRecipient,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn(NoOfRecords,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn(TotalAmount,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
            end;

            trigger OnPreDataItem()
            begin
                //IF "Transaction Type" = GETFILTER("Transaction Type"::Sales) THEN
                NoOfRecords := 0;
                NoOfRecipient := 1;
                TotalAmount := 0;
                IF (GETFILTER("Transaction Type") = 'Sales') THEN
                    "Detailed GST Ledger Entry".SETRANGE("Transaction Type", "Transaction Type"::Sales)
                ELSE
                    "Detailed GST Ledger Entry".SETRANGE("Transaction Type", "Transaction Type"::Purchase);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    Caption = 'Print To Excel';
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

    trigger OnPostReport()
    begin
        IF PrintToExcel THEN
            CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        IF PrintToExcel THEN
            MakeExcelInfo;
        recCompanyInfo.GET();
    end;

    var
        ExcelBuf: Record 370 temporary;
        txtData: array[255] of Text[200];
        PrintToExcel: Boolean;
        recCompanyInfo: Record 79;
        recCustomer: Record 18;
        recState: Record State;
        recShipToAdd: Record 222;
        recSalesInvhrd: Record 114;
        SalesInvoiceLine: Record 115;
        PurchInvHeader: Record 124;
        PurchInvLine: Record 125;
        SalesInvoiceHeader: Record 112;
        SalesInvLine: Record 113;
        recVend: Record 23;
        RecLocation: Record 14;
        Item: Record 27;
        CustLedgerEntry: Record 21;
        NoOfRecords: Integer;
        NoOfRecipient: Integer;
        NoBuyer: Text;
        TotalAmount: Decimal;
        CustType: Text;

    //[Scope('Internal')] PCPL-064
    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(COMPANYNAME, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    //[Scope('Internal')] PCPL-064
    procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Credit/Debit Note Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Credit/Debit Note No.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Credit(C)/Debit(D) Note Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Number', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing Name', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing GSTIN', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Place Of Supply', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Type(Goods/Services)', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Description', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('HSN/SAC Code', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Quantity', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Unit of Measurement', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Total Item Disc. Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Taxable Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('CGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('CGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('SGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('SGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('IGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('IGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Cess Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Cess Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is this Bill of Supply', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is Reverse Charge Applicable', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is this on Nill Rated/Exempt/NonGST Item', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Original Invoice Date(In case of amendment)', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn('Original Invoice No.(In case of amendment)', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Original Customer/Vendor Billing GSTIN(In case of amendment)', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('GSTTIn of E-commerce Marketplace', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Date of Linked of Advanced Receipt', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Voucher No. of Linked of Advanced Receipt', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Adjustment Amount of the Linked of Advanced Receipt', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Type of Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Port Code-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Bill No.-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Bill Date-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Has GST/IDT TDS been deducted', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('My GSTTIN', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing Address', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing City', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing State', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is this document cancelled', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
    end;

    //[Scope('Internal')] PCPL-064
    procedure MakeExcelDataBody()
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 45 DO BEGIN
            IF y IN [1, 4, 25, 29, 35] THEN
                ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date)
            ELSE
                IF y IN [2, 7, 9, 14 .. 24, 31] THEN
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number)
                ELSE
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
    end;

    // [Scope('Internal')] PCPL-064
    procedure CreateExcelbook()
    begin
        //ExcelBuf.CreateBookAndOpenExcel('C:\ExcelFile\GSTR1-CreditDebit.xlsx','GSTR1-B2B','',COMPANYNAME,USERID);
        // ExcelBuf.CreateBookAndOpenExcel('C:\GSTR1\GSTR1-CreditDebit.xlsx', 'GSTR1-B2B', '', COMPANYNAME, USERID); PCPL-064
        //ERROR('');
        //<<PCPL-064
        ExcelBuf.CreateNewBook('GSTR1-B2B');
        ExcelBuf.WriteSheet('GSTR1-B2B', CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('GSTR1-B2B');
        ExcelBuf.OpenExcel();
        //>>PCPL-064

    end;

    //[Scope('Internal')] PCPL-064
    procedure InitializeRequest()
    var
        k: Integer;
    begin
        FOR k := 1 TO 45 DO BEGIN
            txtData[k] := '';
        END;
    end;
}

