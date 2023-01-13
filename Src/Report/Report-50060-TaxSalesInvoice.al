report 50060 "Tax Sales Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/TaxSalesInvoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Posting Date";
            column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(SalesOrderNo; "Sales Invoice Header"."No.")
            {
            }
            column(PaymentTermsCode; "Sales Invoice Header"."Payment Terms Code")
            {
            }
            column(ModeOfTransport; "Sales Invoice Header"."Mode of Transport")
            {
            }
            column(LRNo; '')//"Sales Invoice Header"."LR/RR No.") PCPL-064
            {
            }
            column(LRDate; '')// "Sales Invoice Header"."LR/RR Date") PCPL-064
            {
            }
            column(VehicleNo; "Sales Invoice Header"."Vehicle No.")
            {
            }
            column(AmountinWords1; AmountinWords[1])
            {
            }
            column(CGSTAmount; CGSTAmount)
            {
            }
            column(SGSTAmount; SGSTAmount)
            {
            }
            column(IGSTAmount; IGSTAmount)
            {
            }
            column(StateName; StateName)
            {
            }
            column(StateCode; StateCode)
            {
            }
            dataitem("CopyLoop."; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(OutPutNo; OutPutNo)
                {
                }
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CopyText; COPYTEXT)
                    {
                    }
                    column(ComName; CompanyInfo.Name)
                    {
                    }
                    column(ComName1; CompanyInfo.Name + '' + CompanyInfo."Name 2")
                    {
                    }
                    column(ComAddress; CompanyInfo.Address + '' + CompanyInfo."Address 2" + '' + CompanyInfo.City + '' + CompanyInfo."Post Code")
                    {
                    }
                    column(BankAccntNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyLogo; CompanyInfo.Picture)
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(PageCaption; PageCaption)
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(State; '')//CompanyInfo.State) PCPL-064
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(GSTIN; CompanyInfo."GST Registration No.")
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(BankName; recBank.Name)
                    {
                    }
                    column(BankAddress1; recBank.Address)
                    {
                    }
                    column(BankAddress2; recBank."Address 2")
                    {
                    }
                    column(BankSwiftCode; recBank."SWIFT Code")
                    {
                    }
                    column(IFSC; recBank."IFSC Code")
                    {
                    }
                    column(LocStateCode; recLocation."State Code")
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = WHERE(Type = FILTER(Item));
                        column(CGST; CGST)
                        {
                        }
                        column(SGST; SGST)
                        {
                        }
                        column(IGST; IGST)
                        {
                        }
                        column(CGSTPer; CGSTPer)
                        {
                        }
                        column(SGSTPer; SGSTPer)
                        {
                        }
                        column(IGSTPer; IGSTPer)
                        {
                        }
                        column(SrNo; SrNo)
                        {
                        }
                        column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
                        {
                        }
                        column(ItemNo; "Sales Invoice Line"."No.")
                        {
                        }
                        column(Description; "Sales Invoice Line".Description)
                        {
                        }
                        column(UOM; "Sales Invoice Line"."Unit of Measure")
                        {
                        }
                        column(Quantity; "Sales Invoice Line".Quantity)
                        {
                        }
                        column(UnitPrice; "Sales Invoice Line"."Unit Price")
                        {
                        }
                        column(Amount; "Sales Invoice Line".Amount)
                        {
                        }
                        column(HSNHACCode; recSalesInvoiceLine."HSN/SAC Code")
                        {
                        }
                        column(DiscountPerc; recSalesInvoiceLine."Line Discount %")
                        {
                        }
                        column(TotalAmount; TotalAmount)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            SrNo += 1;
                            //TotalAmount += "Sales Line".Amount;

                            CGST := 0;
                            IGST := 0;
                            SGST := 0;
                            CGSTPer := 0;
                            SGSTPer := 0;
                            IGSTPer := 0;
                            //>>PCPL/BPPL/010
                            GLE.RESET;
                            GLE.SETRANGE(GLE."Document No.", "Sales Invoice Line"."Document No.");
                            GLE.SETRANGE(GLE."HSN/SAC Code", "Sales Invoice Line"."HSN/SAC Code");
                            GLE.SETRANGE(GLE."Transaction Type", GLE."Transaction Type"::Sales);
                            IF GLE.FINDSET THEN BEGIN
                                IF GLE."GST Component Code" = 'CGST' THEN BEGIN
                                    CGST := ABS(GLE."GST Amount");
                                    CGSTPer := GLE."GST %";
                                END
                                ELSE
                                    IF GLE."GST Component Code" = 'IGST' THEN BEGIN
                                        IGST := ABS(GLE."GST Amount");
                                        IGSTPer := GLE."GST %";
                                    END
                                    ELSE
                                        IF GLE."GST Component Code" = 'SGST' THEN BEGIN
                                            SGST := ABS(GLE."GST Amount");
                                            SGSTPer := GLE."GST %";
                                        END;
                            END;

                            TotalAmount := 0;
                            recSalesInvoiceLine.RESET;
                            recSalesInvoiceLine.SETRANGE(recSalesInvoiceLine."Document No.", "Sales Invoice Header"."No.");
                            recSalesInvoiceLine.SETRANGE(Type, recSalesInvoiceLine.Type::Item);
                            IF recSalesInvoiceLine.FINDFIRST THEN
                                REPEAT
                                    TotalAmount += recSalesInvoiceLine.Amount;
                                UNTIL recSalesInvoiceLine.NEXT = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            NoOfRecords := "Sales Invoice Line".COUNT;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number = 1 THEN BEGIN
                        COPYTEXT := TEXT001;
                        OutPutNo += 1;
                    END

                    ELSE
                        IF Number = 2 THEN BEGIN
                            COPYTEXT := TEXT002;
                            OutPutNo += 1;
                        END

                        ELSE
                            IF Number = 3 THEN BEGIN
                                COPYTEXT := TEXT003;
                                OutPutNo += 1;
                            END

                            ELSE
                                IF Number = 4 THEN BEGIN
                                    COPYTEXT := TEXT004;
                                    OutPutNo += 1;
                                END;

                    SrNo := 0;

                    CurrReport.PAGENO := 1;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(2) + 1;
                    IF NoOfLoops <= 1 THEN
                        NoOfLoops := 1;
                    COPYTEXT := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutPutNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*recCust.GET("Sales Invoice Header"."Sell-to Customer No.");
                 CustAddr[1] := recCust."No.";
                 CustAddr[2] := recCust.Name;
                 CustAddr[3] := recCust.Address;
                 CustAddr[4] := recCust."Address 2";
                 CustAddr[5] := recCust.City;
                 CustAddr[6] := recCust."Post Code";
                */
                //PCPL-064<<
                // IF RecState.GET()CompanyInfo.State)   THEN BEGIN
                //     StateName := RecState.Description;
                //     StateCode := RecState."State Code for TIN";
                // END; PCPL-064>>



                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
                //FormatAddr.SalesInvShipTo(ShipToAddr, "Sales Invoice Header"); PCPL-064

                //Amount in Words
                TotalAmount := 0;
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE(recSalesInvoiceLine."Document No.", "Sales Invoice Header"."No.");
                recSalesInvoiceLine.SETRANGE(Type, recSalesInvoiceLine.Type::Item);
                IF recSalesInvoiceLine.FINDFIRST THEN
                    REPEAT
                        TotalAmount += recSalesInvoiceLine.Amount;
                    UNTIL recSalesInvoiceLine.NEXT = 0;



                SGSTAmount := 0;
                CGSTAmount := 0;
                IGSTAmount := 0;
                GLE.RESET;
                GLE.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                GLE.SETRANGE("Entry Type", GLE."Entry Type"::"Initial Entry");
                IF GLE.FINDFIRST THEN
                    REPEAT
                        IF GLE."GST Component Code" = 'IGST' THEN BEGIN
                            IGSTAmount += ABS(GLE."GST Amount");
                        END
                        ELSE
                            IF GLE."GST Component Code" = 'SGST' THEN BEGIN
                                SGSTAmount += ABS(GLE."GST Amount");
                            END ELSE
                                IF GLE."GST Component Code" = 'CGST' THEN BEGIN
                                    CGSTAmount += ABS(GLE."GST Amount");
                                END;

                    UNTIL GLE.NEXT = 0;


                repCheck.InitTextVariable;
                repCheck.FormatNoText(AmountinWords, TotalAmount + IGSTAmount + SGSTAmount + CGSTAmount, "Sales Invoice Header"."Currency Code");

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Functions)
                {
                    field("No Of Copies"; NoOfCopies)
                    {
                    }
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

    trigger OnInitReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        FormatAddr.Company(CompanyAddr, CompanyInfo);
    end;

    var
        CompanyInfo: Record 79;
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text;
        CompanyAddr: array[8] of Text;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutPutNo: Integer;
        TEXT001: Label 'Original';
        COPYTEXT: Text;
        TEXT002: Label 'Duplicate';
        TEXT003: Label 'Triplicate';
        TEXT004: Label 'Quadraplicate';
        PageCaption: Label 'Page %1 of %2';
        NoOfRows: Integer;
        NoOfRecords: Integer;
        recCust: Record 18;
        repCheck: Report Check;
        AmountinWords: array[5] of Text[250];
        TotalAmount: Decimal;
        recSalesInvoiceLine: Record 113;
        SrNo: Integer;
        GLE: Record "Detailed GST Ledger Entry";
        CGST: Decimal;
        SGST: Decimal;
        IGST: Decimal;
        CGSTPer: Decimal;
        SGSTPer: Decimal;
        IGSTPer: Decimal;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        ShipToAddr: array[8] of Text[50];
        recBank: Record 270;
        recLocation: Record 14;
        RecState: Record State;
        StateName: Text[50];
        StateCode: Code[20];
        ShipToGST: Code[20];
        ShipToState: Text[20];
        ShipToStateCode: Code[20];
        BillToGST: Code[20];
        BillToState: Text[20];
        BillToStateCode: Code[20];
}

