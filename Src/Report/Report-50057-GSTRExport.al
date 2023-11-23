report 50057 "GSTR-Export"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("Transaction Type", "Document Type", "Document No.", "Document Line No.") ORDER(Ascending)
            WHERE("Transaction Type" = CONST(Sales),
            "Document Type" = CONST("Credit Memo"),
             "GST Customer Type" = CONST(Export));
            RequestFilterFields = "Posting Date", "Source No.";

            trigger OnAfterGetRecord()
            begin
                InitializeRequest;
                IF recSalesInvhrd.GET("Original Invoice No.") THEN;
                IF "GST Without Payment of Duty" THEN
                    txtData[1] := 'WOPAY'
                ELSE
                    txtData[1] := 'WPAY';

                txtData[2] := "Original Invoice No.";
                txtData[3] := FORMAT(recSalesInvhrd."Posting Date");
                txtData[4] := "Document No.";
                txtData[5] := FORMAT("Posting Date");
                txtData[6] := '';//Shipping Bill Number
                txtData[7] := '';//Shipping Bill Date
                txtData[8] := '';
                txtData[9] := FORMAT("GST Amount");
                txtData[10] := FORMAT("GST %");
                txtData[11] := FORMAT("GST Base Amount");

                IF PrintToExcel THEN
                    MakeExcelDataBody;
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
        decData: array[255] of Decimal;
        PrintToExcel: Boolean;
        recCompanyInfo: Record 79;
        recCustomer: Record 18;
        recState: Record State;
        recShipToAdd: Record 222;
        recSalesInvhrd: Record 112;
        recVend: Record 23;

    // [Scope('Internal')] pcpl-064
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

    //[Scope('Internal')] pcpl-064
    procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('GSTIN/UIN of Recipient', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice/Advance Receipt Number', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice/Advance Receipt date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Note/Refund Voucher Number', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Note/Refund Voucher date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Document Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Reason For Issuing document', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Place Of Supply', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Note/Refund Voucher Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Taxable Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Cess Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Pre GST', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
    end;

    //[Scope('Internal')] PCPL-064
    procedure MakeExcelDataBody()
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 9 DO BEGIN
            IF y IN [3, 5] THEN
                ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date)
            ELSE
                IF y IN [4, 9 .. 11] THEN
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number)
                ELSE
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
    end;

    //[Scope('Internal')] //PCPL-064
    procedure CreateExcelbook()
    begin
        //PCPL-064
        /*ExcelBuf.CreateBookAndOpenExcel('GSTR1-B2B', 'GSTR1-B2B', COMPANYNAME, USERID);
        ERROR('');*/ //PCpl-064
        //<<PCPL-064
        ExcelBuf.CreateNewBook('GSTR1-B2B');
        ExcelBuf.WriteSheet('GSTR1-B2B', CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('GSTR1-B2B');
        ExcelBuf.OpenExcel();
        //>>PCPL-064
    end;

    // [Scope('Internal')]  //PCPL-064
    procedure InitializeRequest()
    var
        k: Integer;
    begin
        FOR k := 1 TO 10 DO BEGIN
            txtData[k] := '';
        END;
    end;
}

