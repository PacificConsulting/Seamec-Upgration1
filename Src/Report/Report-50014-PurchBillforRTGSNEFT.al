report 50014 "Purch. Bill for RTGS/NEFT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/PurchBillforRTGSNEFT.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(No_Vendor; Vendor."No.")
            {
            }
            column(Name_Vendor; Vendor.Name)
            {
            }
            column(Address_Vendor; Vendor.Address)
            {
            }
            column(Email_VendorBankAcc; Vendor."E-Mail")
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                    ORDER(Ascending)
                                    WHERE(Open = FILTER(true));
                // "Print Document" = FILTER(true)); PCPL-064
                RequestFilterFields = "Vendor No.";
                column(VendorNo_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
                {
                }
                column(PostingDate_VendorLedgerEntry; "Vendor Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(Description_VendorLedgerEntry; "Vendor Ledger Entry".Description)
                {
                }
                column(CurrencyCode_VendorLedgerEntry; "Vendor Ledger Entry"."Currency Code")
                {
                }
                column(Amount_VendorLedgerEntry; "Vendor Ledger Entry".Amount)
                {
                }
                column(RemainingAmount_VendorLedgerEntry; "Vendor Ledger Entry"."Remaining Amount")
                {
                }
                column(dataTotalPayableAmnt_vendorLedger; ABS(dataTotalPayableAmnt))
                {
                }
                column(DateWorkdate; FORMAT(DateWorkdate))
                {
                }
                column(OriginalAmount_VendorLedgerEntry; ABS(OriginalAmount))
                {
                }
                column(Name_RecVendor; recVendor.Name)
                {
                }
                column(BankIFSC; BankIFSC)
                {
                }
                column(bankAccNo; bankAccNo)
                {
                }
                column(VendorBankAccEmail_; rec_VendorBankAccount."E-Mail")
                {
                }
                column(Name_VendorBankAcc; rec_VendorBankAccount.Name)
                {
                }
                column(Address_rec_VendorBankAccount; rec_VendorBankAccount.Address)
                {
                }
                column(Address2_rec_VendorBankAccount; rec_VendorBankAccount."Address 2")
                {
                }
                column(City_postCode_rec_VendorBankAccount; rec_VendorBankAccount.City + rec_VendorBankAccount."Post Code")
                {
                }
                column(CustomerReferenceNo; CustomerReferenceNo)
                {
                }
                column(ExternalDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."External Document No.")
                {
                }
                column(ExterCnt; ExterCnt)
                {
                }
                column(VendorInvoiceDate_VendorLedgerEntry; '')//FORMAT("Vendor Invoice Date")) //PCPL-064
                {
                }

                trigger OnAfterGetRecord()
                begin
                    OriginalAmount := 0;
                    ExterCnt := ExterCnt + "Vendor Ledger Entry".COUNT;
                    DateWorkdate := WORKDATE;
                    CALCFIELDS("Vendor Ledger Entry"."Remaining Amount");
                    //dataTotalNetAmnt := dataTotalNetAmnt + dataNetAmnt;
                    dataTotalPayableAmnt := dataTotalPayableAmnt + "Vendor Ledger Entry"."Remaining Amount";
                    IF recVendor.GET("Vendor No.") THEN;
                    rec_VendorBankAccount.RESET;
                    rec_VendorBankAccount.SETRANGE("Vendor No.", "Vendor No.");
                    IF rec_VendorBankAccount.FINDFIRST THEN BEGIN
                        BankIFSC := '';//rec_VendorBankAccount."IFSC Code"; PCPL-064
                        bankAccNo := rec_VendorBankAccount."Bank Account No.";
                        BankName := rec_VendorBankAccount.Name;
                    END;

                    CustomerReferenceNo := CREATEGUID;
                    CALCFIELDS("Vendor Ledger Entry"."Original Amount");
                    OriginalAmount := "Vendor Ledger Entry"."Original Amount";
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(dataTotalPayableAmnt);
                    ExterCnt := 0;
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
        Identifier_Caption = 'Identifier';
        PaymentMode_Caption = 'Payment Mode';
        Cust_ReferenceNumber_Caption = 'Cust. Reference Number';
        Debit_AccountN = 'Debit Account No.';
        CurencyCode_Caption = 'Curency Code';
        Txn_Date_Caption = 'Txn. Date';
        Txn_Currency_Code_Caption = 'Txn. Currency Code';
        Amount_Caption = 'Amount';
        BeneficiaryName_Caption = 'Beneficiary Name';
        BeneficiaryCode_Caption = 'Beneficiary Code';
        Beneficiary_AccNo_Caption = 'Beneficiary Acc. No.';
        Beneficiary_Currency_Code_Caption = 'Beneficiary Currency Code';
        Beneficiary_AddressLine1 = 'Beneficiary Address Line 1';
        Beneficiary_AddressLine2 = 'Beneficiary Address Line 2';
        Beneficiary_AddressLine3 = 'Beneficiary Address Line 3';
        Beneficiary_AddressLine4 = 'Beneficiary Address Line 4';
        Beneficiary_AddressLine5 = 'Beneficiary Address Line 5';
        BeneficiaryMailing_Name = 'Beneficiary Mailing Name';
        Beneficiary_Mailing_Address_Line1 = 'Beneficiary Mailing Address Line 1';
        Beneficiary_Mailing_Address_Line2 = 'Beneficiary Mailing Address Line 2';
        Beneficiary_Mailing_Address_Line3 = 'Beneficiary Mailing Address Line 3';
        Beneficiary_Mailing_Address_Line4 = 'Beneficiary Mailing Address Line 4';
        Beneficiary_Mailing_Address_Line5 = 'Beneficiary Mailing Address Line 5';
        Drawee_BankCode_Caption = 'Drawee Bank Code';
        Beneficiary_BankName_Caption = 'Beneficiary Bank Name';
        Payment_Detail1_Caption = 'Payment Detail 1';
        Payment_Detail2_Caption = 'Payment Detail 2';
        Cheque_No_Caption = 'Cheque No.';
        Cheque_Date_Caption = 'Cheque Date';
        EMai_ID_Caption = 'E-Mail ID';
        Payable_Loc_Caption = 'Payable Loc';
        Del_Loc_Caption = 'Del Loc';
        Del_To_Caption = 'Del To';
        Print_Loc_Caption = 'Print Loc';
        Account_Type_Caption = 'Account Type';
        Beneficiary_BankNameCaption = 'Beneficiary Bank Name';
        Beneficiary_Bank_Addr_1 = 'Beneficiary Bank Addr 1';
        Beneficiary_Bank_Addr_2 = 'Beneficiary Bank Addr 2';
        Beneficiary_Bank_Addr_3 = 'Beneficiary Bank Addr 3';
        OverseasCharges = 'Overseas Charges';
        BeneficiaryMobile_Number_Caption = 'Beneficiary Mobile Number';
        Purpose_Code_Caption = 'Purpose Code';
    }

    var
        recVendor: Record 23;
        rec_VendorBankAccount: Record 288;
        DateWorkdate: Date;
        dataTotalPayableAmnt: Decimal;
        BankIFSC: Code[20];
        bankAccNo: Text[30];
        CustomerReferenceNo: Text[100];
        OriginalAmount: Decimal;
        BankName: Text;
        ExterCnt: Integer;
}

