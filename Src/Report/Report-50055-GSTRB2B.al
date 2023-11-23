report 50055 "GSTR-B2B"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.", "Document Line No.", "GST Component Code")
                                ORDER(Ascending)
                                WHERE("Document Type" = CONST(Invoice),
                                      "Entry Type" = CONST("Initial Entry"));
            RequestFilterFields = "Posting Date", "Transaction Type";

            trigger OnAfterGetRecord()
            begin
                IF "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' THEN
                    CurrReport.SKIP;
                InitializeRequest;
                // IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                //     // IF recSalesInvhrd."Debit Note" THEN pcl-064
                //     CurrReport.SKIP;
                // END;
                IF NoBuyer <> "Buyer/Seller Reg. No." THEN BEGIN
                    NoOfRecipient := NoOfRecipient + 1;
                    NoBuyer := "Buyer/Seller Reg. No.";
                END;

                IF (GETFILTER("Transaction Type") = 'Sales') THEN BEGIN
                    IF "Document Type" = "Document Type"::Invoice THEN
                        txtData[2] := "Document No.";
                END ELSE
                    txtData[2] := "External Document No.";
                IF PurchInvHeader.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                    txtData[3] := FORMAT(PurchInvHeader."Buy-from Vendor Name");
                    txtData[38] := PurchInvHeader."Buy-from Address";

                    txtData[1] := FORMAT(PurchInvHeader."Document Date");
                    IF recVend.GET(PurchInvHeader."Buy-from Vendor No.") THEN BEGIN
                        txtData[39] := recVend.City;
                        IF recState.GET(recVend."State Code") THEN;
                        txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                    END;
                    //txtData[25] := FORMAT(PurchInvHeader."Document Date");
                END ELSE
                    IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                        //MESSAGE(recSalesInvhrd."No.");
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Payment);
                        CustLedgerEntry.SETRANGE("Document No.", recSalesInvhrd."Applies-to Doc. No.");
                        CustLedgerEntry.SETRANGE("GST on Advance Payment", TRUE);
                        IF CustLedgerEntry.FINDFIRST THEN BEGIN
                            txtData[29] := FORMAT(CustLedgerEntry."Posting Date");
                            txtData[30] := (CustLedgerEntry."Document No.");
                            txtData[31] := FORMAT(CustLedgerEntry.Amount);
                        END;
                        txtData[1] := FORMAT(recSalesInvhrd."Document Date");
                        txtData[3] := FORMAT(recSalesInvhrd."Sell-to Customer Name");
                        txtData[38] := recSalesInvhrd."Sell-to Address";

                        IF recCustomer.GET("Source No.") THEN BEGIN
                            txtData[39] := recCustomer.City;
                            IF recState.GET(recCustomer."State Code") THEN;
                            txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                        END;
                        //txtData[25] := FORMAT(recSalesInvhrd."Document Date");
                    END;
                //txtData[4] := FORMAT("Amount to Customer/Vendor");
                //PCPL-0070 21Dec2022 <<
                PIH.RESET;
                IF PIH.GET("Detailed GST Ledger Entry"."Document No.") then;
                recVendor.RESET;
                If recVendor.GET(PIH."Buy-from Vendor No.") Then;
                txtData[4] := FORMAT(recVendor."GST Registration No.");
                // txtData[4] := FORMAT("Detailed GST Ledger Entry"."Buyer/Seller Reg. No.");
                //PCPL-0070 21Dec2022>>
                TotalAmount += ABS("GST Base Amount" + "GST Amount");
                /*
                CASE "GST Place of Supply"  OF
                  1  :
                    BEGIN
                      IF recCustomer.GET("Source No.")  THEN  BEGIN
                        IF  recState.GET(recCustomer."State Code") THEN;
                        txtData[5] :=  recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                      END;
                      IF RecLocation.GET("Source No.")  THEN  BEGIN
                        IF  recState.GET(RecLocation."State Code") THEN;
                        txtData[5] :=  recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                      END;
                      IF recVend.GET("Source No.") THEN BEGIN
                        IF  recState.GET(RecLocation."State Code") THEN;
                        txtData[5] :=  recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                      END;
                    END;
                  2  :
                    BEGIN
                      recSalesInvhrd.GET("No.");
                      recShipToAdd.RESET;
                      recShipToAdd.SETRANGE(recShipToAdd."Customer No.","Source No.");
                      recShipToAdd.SETRANGE(recShipToAdd.Code,recSalesInvhrd."Ship-to Code");
                        IF recShipToAdd.FINDFIRST THEN;
                      IF recState.GET(recShipToAdd.State) THEN;
                      txtData[5] :=  recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                      IF RecLocation.GET("Source No.")  THEN  BEGIN
                        IF  recState.GET(RecLocation."State Code") THEN;
                        txtData[5] :=  recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                      END;
                
                    END;
                END;
                */
                IF "Reverse Charge" THEN
                    txtData[23] := 'Y'
                ELSE
                    txtData[23] := 'N';
                txtData[6] := FORMAT("Detailed GST Ledger Entry"."GST Group Type");

                IF SalesInvoiceLine.GET("Document No.", "Document Line No.") THEN BEGIN
                    txtData[7] := SalesInvoiceLine.Description;
                    txtData[10] := SalesInvoiceLine."Unit of Measure Code";
                    txtData[11] := FORMAT(SalesInvoiceLine."Unit Price");
                    txtData[12] := FORMAT(SalesInvoiceLine."Line Discount Amount");
                END
                ELSE
                    IF PurchInvLine.GET("Document No.", "Document Line No.") THEN BEGIN
                        txtData[7] := PurchInvLine.Description;
                        txtData[10] := PurchInvLine."Unit of Measure Code";
                        txtData[11] := FORMAT(PurchInvLine."Direct Unit Cost");
                        txtData[12] := FORMAT(PurchInvLine."Line Discount Amount");

                    END;

                txtData[8] := "Detailed GST Ledger Entry"."HSN/SAC Code";
                txtData[9] := FORMAT(ABS(Quantity));



                //txtData[13] := FORMAT(ABS("GST Base Amount"));
                txtData[13] := FORMAT("GST Base Amount"); //PCPL-0070 Remove for Negative value.
                IF "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' THEN BEGIN
                    txtData[14] := FORMAT(ABS("GST %"));
                    //txtData[15] := FORMAT(ABS("GST Amount"));
                    txtData[15] := FORMAT("GST Amount"); //PCPL-0070
                    txtData[16] := FORMAT(ABS("GST %"));
                    //txtData[17] := FORMAT(ABS("GST Amount"));
                    txtData[17] := FORMAT("GST Amount"); //PCPL-0070
                END ELSE BEGIN
                    txtData[18] := FORMAT(ABS("GST %"));
                    txtData[19] := FORMAT(ABS("GST Amount"));
                END;
                txtData[20] := ''; //Cess rate
                txtData[21] := ''; //Cess Amt
                txtData[22] := '';
                txtData[24] := ''; //nill rated
                txtData[25] := '';
                txtData[26] := '';
                txtData[27] := '';
                txtData[28] := '';
                //PCPL-064
                //IF "Sales Invoice Type" = "Detailed GST Ledger Entry"."Sales Invoice Type"::Export THEN BEGIN PCPL-064
                IF "Detailed GST Ledger Entry"."GST Without Payment of Duty" THEN
                    txtData[32] := 'Export Without Payment of GST'
                ELSE
                    txtData[32] := 'Export With Payment of GST';
                // END;   //pcpl-064
                txtData[33] := '';  //Shipping port code
                txtData[34] := '';
                txtData[35] := '';
                //IF "Detailed GST Ledger Entry"."GST Amount" <> 0 THEN
                txtData[36] := '';
                txtData[37] := "Detailed GST Ledger Entry"."Location  Reg. No.";
                txtData[40] := '';//"Detailed GST Ledger Entry"."Buyer/Seller State Code"; PCPL-064
                txtData[41] := '';
                IF "GST Vendor Type" <> "Detailed GST Ledger Entry"."GST Vendor Type"::" " THEN
                    txtData[42] := FORMAT("Detailed GST Ledger Entry"."GST Vendor Type")
                ELSE
                    txtData[42] := FORMAT("Detailed GST Ledger Entry"."GST Customer Type");
                txtData[43] := FORMAT("Detailed GST Ledger Entry"."No.");
                txtData[44] := '';//FORMAT("Detailed GST Ledger Entry"."Gen. Bus. Posting Group"); PCPL-064
                //IF GenProductPostingGroup.GET("Detailed GST Ledger Entry"."Gen. Prod. Posting Group") THEN // pcpl-064
                txtData[45] := GenProductPostingGroup.Description;
                txtData[46] := "Document No.";//PCPL41
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
        recState: Record "State";
        recShipToAdd: Record 222;
        recSalesInvhrd: Record 112;
        SalesInvoiceLine: Record 113;
        PurchInvHeader: Record 122;
        PurchInvLine: Record 123;
        recVend: Record 23;
        RecLocation: Record 14;
        Item: Record 27;
        CustLedgerEntry: Record 21;
        GenProductPostingGroup: Record 251;
        NoOfRecords: Integer;
        NoOfRecipient: Integer;
        NoBuyer: Text;
        TotalAmount: Decimal;
        PIH: Record 122;
        recVendor: Record 23;

    // [Scope('Internal')] //PCPL-064
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
        ExcelBuf.AddColumn('Item/GL No.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Gen. Business Posting Group', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Gen. Product Posting Group Description', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Document No.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);//PCPL41
    end;

    //[Scope('Internal')] PCPL-064
    procedure MakeExcelDataBody()
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 46 DO BEGIN
            IF y IN [1, 25, 29, 35] THEN
                ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date)
            ELSE
                IF y IN [2, 9, 11 .. 21, 31] THEN
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number)
                ELSE
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
    end;

    // [Scope('Internal')] //PCPL-064
    procedure CreateExcelbook()
    begin
        //ExcelBuf.CreateBookAndOpenExcel('C:\ExcelFile\GSTR1-B2B.xlsx','GSTR1-B2B','',COMPANYNAME,USERID);
        //ExcelBuf.CreateBookAndOpenExcel('C:\GSTR1\GSTR1-B2B.xlsx', 'GSTR1-B2B', '', COMPANYNAME, USERID); //PCPL-064
        //ERROR('');
        //C:\GSTR1
        // <<PCPL-064
        ExcelBuf.CreateNewBook('GSTR1-B2B');
        ExcelBuf.WriteSheet('GSTR-Sales', CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('GSTR-Sales');
        ExcelBuf.OpenExcel();
        //>>pcpl-064
    end;

    //[Scope('Internal')] PCPL-064
    procedure InitializeRequest()
    var
        k: Integer;
    begin
        FOR k := 1 TO 42 DO BEGIN
            txtData[k] := '';
        END;
    end;
}

