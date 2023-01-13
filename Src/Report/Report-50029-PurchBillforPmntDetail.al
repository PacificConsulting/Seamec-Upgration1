report 50029 "Purch. Bill for Pmnt. Detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/PurchBillforPmntDetail.rdl';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            PrintOnlyIfDetail = true;
            column(Vendor_Name; Vendor.Name)
            {
            }
            column(Date; 'Date : ' + FORMAT(TODAY))
            {
            }
            column(ComName; recCompInfo.Name)
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                    WHERE(Open = FILTER(true));
                //"Print Document" = FILTER(true)); PCPL-064
                RequestFilterFields = "Document No.";
                column(BillNo; "Vendor Ledger Entry"."External Document No.")
                {
                }
                column(DocDate; "Vendor Ledger Entry"."Document Date")
                {
                }
                column(GrossAmount; dataGrossAmnt)
                {
                }
                column(TDSDeduction; dataTDSAmnt)
                {
                }
                column(NetAmount; dataNetAmnt)
                {
                }
                column(payableAmount; -"Vendor Ledger Entry"."Remaining Amount")
                {
                }
                column(Project; "Vendor Ledger Entry"."Global Dimension 2 Code")
                {
                }
                column(OurRef; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(NetAmtTotal; dataTotalNetAmnt)
                {
                }
                column(PayAmtTotal; -dataTotalPayableAmnt)
                {
                }
                column(OriginalAmtLCY_VendorLedgerEntry; "Vendor Ledger Entry"."Original Amt. (LCY)")
                {
                }
                column(AmountLCY_VendorLedgerEntry; -"Vendor Ledger Entry"."Amount (LCY)")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    recTDSEntry.RESET;
                    recTDSEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    recTDSEntry.SETRANGE(recTDSEntry."Document No.", "Vendor Ledger Entry"."Document No.");
                    recTDSEntry.SETRANGE(recTDSEntry."Posting Date", "Vendor Ledger Entry"."Posting Date");
                    recTDSEntry.SETRANGE(recTDSEntry."Party Code", "Vendor Ledger Entry"."Vendor No.");
                    IF recTDSEntry.FIND('-') THEN BEGIN
                        dataGrossAmnt := 0;// recTDSEntry."Invoice Amount"; PCPL-064
                        dataTDSAmnt := 0;//recTDSEntry."Total TDS Including SHE CESS"; PCPL-064
                        dataNetAmnt := dataGrossAmnt - dataTDSAmnt;
                    END
                    ELSE BEGIN
                        CALCFIELDS("Original Amount");
                        dataGrossAmnt := -"Vendor Ledger Entry"."Original Amount";
                        dataTDSAmnt := 0;
                        dataNetAmnt := dataGrossAmnt - dataTDSAmnt;
                    END; //PCPL-064

                    //Section Code VLE Body

                    CALCFIELDS("Vendor Ledger Entry"."Remaining Amount");
                    CALCFIELDS("Vendor Ledger Entry"."Amount (LCY)");
                    dataTotalNetAmnt := dataTotalNetAmnt + dataNetAmnt;
                    dataTotalPayableAmnt := dataTotalPayableAmnt + "Vendor Ledger Entry"."Remaining Amount";
                    //Section Code VLE Body
                end;

                trigger OnPreDataItem()
                begin
                    /*
                    //dataTotalNetAmnt := 0;
                    dataGrossAmnt := 0;
                    dataTDSAmnt := 0;
                    //dataTotalPayableAmnt := 0;
                    */

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

    trigger OnPreReport()
    begin
        recCompInfo.GET;
    end;

    var
        recCompInfo: Record 79;
        recTDSEntry: Record "TDS Entry";// 13729; 
        dataTDSAmnt: Decimal;
        dataGrossAmnt: Decimal;
        dataNetAmnt: Decimal;
        dataTotalNetAmnt: Decimal;
        dataTotalPayableAmnt: Decimal;
}

