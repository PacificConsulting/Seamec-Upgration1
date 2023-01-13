report 50040 "List- Purchase Invoices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/ListPurchaseInvoices.rdl';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                WHERE("Source Code" = FILTER(''));//(Purchase)); PCPL-064
            RequestFilterFields = "Document No.";
            column(DocNo; "Vendor Ledger Entry"."Document No.")
            {
            }
            column(PostingDate; "Vendor Ledger Entry"."Posting Date")
            {
            }
            column(Vendorno; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(VendroName; dataVendName)
            {
            }
            column(CurrCode; COPYSTR(dataCurrCode, 3, 4))
            {
            }
            column(OriginalAmount; -"Vendor Ledger Entry"."Original Amount")
            {
            }
            column(OriginalAmountLCY; -"Vendor Ledger Entry"."Original Amt. (LCY)")
            {
            }
            column(RemainingAmontLCY; -"Vendor Ledger Entry"."Remaining Amt. (LCY)")
            {
            }
            column(CostCenter; "Vendor Ledger Entry"."Global Dimension 1 Code")
            {
            }
            column(Project; "Vendor Ledger Entry"."Global Dimension 2 Code")
            {
            }
            column(VendorInvoiceNo; "Vendor Ledger Entry"."External Document No.")
            {
            }
            column(VendorInvoiceDate; "Vendor Ledger Entry"."Document Date")
            {
            }
            column(PaymentDocNo; dataPaymentDocNo)
            {
            }
            column(PaymentDate; dataPaymentDate)
            {
            }
            column(GLAccountNO; GLAccountNO)
            {
            }
            column(Description; Description)
            {
            }
            column(recCompName; recCompanyInfo.Name)
            {
            }
            column(recCompAddress; recCompanyInfo.Address + '  ' + recCompanyInfo."Address 2" + ' ' + recCompanyInfo.City + ' ' + recCompanyInfo."Post Code")
            {
            }
            column(FromDatetODate; 'From date : ' + FORMAT(FromDate) + ' to date : ' + FORMAT(ToDate))
            {
            }
            column(BaseAmt; TotalGrossAmount)
            {
            }
            column(BaseAmtLCY; TotalGrossAmount / currfact)
            {
            }
            column(ServiceTaxAmt; ServiceTaxAmt)
            {
            }
            column(ServiceTaxLCY; ServiceTaxAmt / currfact)
            {
            }
            column(GrossAmt; TotalGrossAmount + ServiceTaxAmt)
            {
            }
            column(GrossAmtLCY; ((TotalGrossAmount + ServiceTaxAmt) / currfact))
            {
            }
            column(TDSAmt; "Vendor Ledger Entry"."Total TDS Including SHE CESS")
            {
            }
            column(TDSLCY; "Vendor Ledger Entry"."Total TDS Including SHE CESS" / currfact)
            {
            }
            column(NetAmt; -"Original Amount")
            {
            }
            column(OriAmt; -"Original Amt. (LCY)")
            {
            }
            column(OriAmtLCY; -"Remaining Amt. (LCY)")
            {
            }
            column(PONO; '')//"Vendor Ledger Entry"."Purchase Order No.") PCPL-064
            {
            }
            column(ServiceTaxGroup; '')// ServiceTaxEntry."Service Tax Group Code") PCPL-064
            {
            }

            trigger OnAfterGetRecord()
            begin

                currfact := 1;
                recPIH.RESET;
                recPIH.SETRANGE(recPIH."No.", "Vendor Ledger Entry"."Document No.");
                IF recPIH.FINDFIRST THEN
                    currfact := recPIH."Currency Factor";

                IF currfact = 0 THEN
                    currfact := 1;
                //End 002

                // Kiran 001
                ServiceTaxAmt := 0;
                TotalGrossAmount := 0;
                // Kiran 001

                "Vendor Ledger Entry".CALCFIELDS("Original Amount");
                "Vendor Ledger Entry".CALCFIELDS("Original Amt. (LCY)");
                "Vendor Ledger Entry".CALCFIELDS("Remaining Amt. (LCY)");

                IF "Currency Code" = '' THEN
                    dataCurrCode := recGLSetup."LCY Code"
                ELSE
                    dataCurrCode := "Vendor Ledger Entry"."Currency Code";

                IF recVend.GET("Vendor No.") THEN
                    dataVendName := recVend.Name;

                dataPaymentDocNo := '';
                dataPaymentDate := 0D;
                recDetailedVLE.RESET;
                //recDetailedVLE.SETCURRENTKEY("Vendor Ledger Entry No.","Posting Date");
                recDetailedVLE.SETRANGE(recDetailedVLE."Vendor Ledger Entry No.", "Entry No.");
                IF recDetailedVLE.FINDFIRST THEN
                    REPEAT
                        IF recDetailedVLE."Entry Type" = recDetailedVLE."Entry Type"::Application THEN BEGIN
                            dataPaymentDocNo := recDetailedVLE."Document No.";
                            dataPaymentDate := recDetailedVLE."Posting Date";
                        END;
                    UNTIL recDetailedVLE.NEXT = 0
                ELSE BEGIN
                    dataPaymentDocNo := '';
                    dataPaymentDate := 0D;
                END;
                //PCPL-25
                CLEAR(GLAccountNO);
                CLEAR(Description);
                GLEntry.RESET;
                GLEntry.SETCURRENTKEY("G/L Account No.", "Posting Date");
                GLEntry.SETRANGE(GLEntry."Document No.", "Document No.");
                GLEntry.SETRANGE(GLEntry."Posting Date", "Posting Date");
                IF GLEntry.FINDLAST THEN BEGIN
                    GLAccountNO := GLEntry."G/L Account No.";
                    GLAccount.RESET;
                    GLAccount.SETRANGE(GLAccount."No.", GLEntry."G/L Account No.");
                    IF GLAccount.FINDFIRST THEN BEGIN
                        Description := GLAccount.Name;
                    END;
                END;
                /*RecpurchInvline.RESET;
                RecpurchInvline.SETRANGE(RecpurchInvline."Document No.","Vendor Ledger Entry"."Document No.");
                RecpurchInvline.SETRANGE(RecpurchInvline.Type,RecpurchInvline.Type::"G/L Account");
                IF RecpurchInvline.FINDFIRST THEN BEGIN
                  GLAccountNO := RecpurchInvline."No.";
                  Description := RecpurchInvline.Description;
                END;*/
                //PCPL-25

                RecpurchInvline.RESET;
                RecpurchInvline.SETRANGE(RecpurchInvline."Document No.", "Vendor Ledger Entry"."Document No.");
                RecpurchInvline.SETRANGE(RecpurchInvline.Type, RecpurchInvline.Type::"G/L Account");
                IF RecpurchInvline.FINDFIRST THEN;

                // Kiran 001
                RecpurchInvline1.RESET;
                RecpurchInvline1.SETRANGE("Document No.", "Vendor Ledger Entry"."Document No.");
                IF RecpurchInvline1.FINDSET THEN
                    REPEAT
                        //MESSAGE(FORMAT(ServiceTaxAmt));
                        //PCPL-064
                        ServiceTaxAmt += 0;// RecpurchInvline1."Service Tax Amount" + /// PCpL-064
                                           //RecpurchInvline1."Service Tax eCess Amount" + /// PCpL-064
                                           //RecpurchInvline1."Service Tax SHE Cess Amount";*/// PCpL-064
                                           //ServiceTaxECessAmt := "Service Tax eCess Amount"; // PCpL-064
                                           //ServiceTaxSHECessAmt := "Service Tax SHE Cess Amount"; // PCpL-064
                        TotalGrossAmount += RecpurchInvline1."Line Amount";

                    UNTIL RecpurchInvline1.NEXT = 0;
                //END;
                // kiran 001


                RecPurchInvHdr1.RESET;
                IF RecPurchInvHdr1.GET("Vendor Ledger Entry"."Document No.") THEN BEGIN
                    //IF RecPurchInvHdr1."Service Type (Rev. Chrg.)" = RecPurchInvHdr1."Service Type (Rev. Chrg.)"::" " THEN BEGIN PCPL-064
                    //recXlBuff.AddColumn(TotalGrossAmount+ServiceTaxAmt,FALSE,'',FALSE,FALSE,TRUE,'');
                    //recXlBuff.AddColumn(((TotalGrossAmount+ServiceTaxAmt)/currfact),FALSE,'',FALSE,FALSE,TRUE,'')    //002
                    //END pcpl-64
                    //ELSE BEGIN pcpl-064
                    //recXlBuff.AddColumn(TotalGrossAmount,FALSE,'',FALSE,FALSE,TRUE,'');
                    //recXlBuff.AddColumn((TotalGrossAmount/currfact),FALSE,'',FALSE,FALSE,TRUE,'');   //002
                    //END; pcpl-064
                END;

                //Start 002
                recPCrM.RESET;
                IF recPCrM.GET("Vendor Ledger Entry"."Document No.") THEN BEGIN
                    //IF recPCrM."Service Type (Rev. Chrg.)" = recPCrM."Service Type (Rev. Chrg.)"::" " THEN BEGIN PCPL-064
                    //recXlBuff.AddColumn(TotalGrossAmount+ServiceTaxAmt,FALSE,'',FALSE,FALSE,TRUE,'');
                    //recXlBuff.AddColumn(((TotalGrossAmount+ServiceTaxAmt)/currfact),FALSE,'',FALSE,FALSE,TRUE,'')    //002
                    // END pcpl-064
                    //ELSE BEGIN pcpl-064
                    //recXlBuff.AddColumn(TotalGrossAmount,FALSE,'',FALSE,FALSE,TRUE,'');
                    //recXlBuff.AddColumn((TotalGrossAmount/currfact),FALSE,'',FALSE,FALSE,TRUE,'');   //002
                END;
            END;

            /* PCPL-064
            ServiceTaxEntry.RESET;
            ServiceTaxEntry.SETRANGE(ServiceTaxEntry."Document No.", "Vendor Ledger Entry"."Document No.");
            IF ServiceTaxEntry.FINDFIRST THEN;*/ //PCPL-064
                                                 //recXlBuff.AddColumn(ServiceTaxEntry."Service Tax Group Code",FALSE,'',FALSE,FALSE,TRUE,'');

            // end; PCPL-064

            trigger OnPreDataItem()
            begin
                "Vendor Ledger Entry".SETFILTER("Posting Date", '%1..%2', FromDate, ToDate);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("From Date"; FromDate)
                {
                }
                field("To Date"; ToDate)
                {
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
        recCompanyInfo.GET;
    end;

    var
        recCompanyInfo: Record 79;
        recGLSetup: Record 98;
        recVend: Record 23;
        recDetailedVLE: Record 380;
        recXlBuff: Record 370 temporary;
        FromDate: Date;
        ToDate: Date;
        dataCurrCode: Code[10];
        dataVendName: Text[50];
        dataPaymentDocNo: Code[20];
        dataPaymentDate: Date;
        RecpurchInvline: Record 123;
        RecPurchInvHdr: Record 122;
        //ServiceTaxEntry: Record 16473; PCL-064
        ServiceTaxAmt: Decimal;
        RecpurchInvline1: Record 123;
        TotalGrossAmount: Decimal;
        RecPurchInvHdr1: Record 122;
        recPIH: Record 122;
        currfact: Decimal;
        recPCrM: Record 124;
        DGLE: Record "Detailed GST Ledger Entry";
        GLAccountNO: Code[20];
        Description: Text[50];
        GLEntry: Record 17;
        GLAccount: Record 15;
}

