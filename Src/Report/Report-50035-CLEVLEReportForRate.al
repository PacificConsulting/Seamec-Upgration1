report 50035 "CLE-VLE Report For Rate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/CLEVLEReportForRate.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Document No.";

            trigger OnAfterGetRecord()
            begin

                IF "For Customer Ledger Update" = TRUE THEN BEGIN
                    RecSalesInvoiceHeader.RESET;
                    RecSalesInvoiceHeader.SETRANGE("No.", "Cust. Ledger Entry"."Document No.");
                    IF RecSalesInvoiceHeader.FINDFIRST THEN
                        REPEAT
                            IF RecSalesInvoiceHeader."Currency Factor" > 0 THEN BEGIN
                                // "Cust. Ledger Entry"."Exchange Factor" := 1 / RecSalesInvoiceHeader."Currency Factor"; //PCPL-064
                                "Cust. Ledger Entry".MODIFY;
                            END UNTIL RecSalesInvoiceHeader.NEXT = 0;
                END;
            end;
        }
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Document No.";

            trigger OnAfterGetRecord()
            begin

                IF "For Vendor Ledger Update" = TRUE THEN BEGIN
                    RecPIH.RESET;
                    RecPIH.SETRANGE("No.", "Vendor Ledger Entry"."Document No.");
                    IF RecPIH.FINDFIRST THEN
                        REPEAT
                            IF RecPIH."Currency Factor" > 0 THEN BEGIN
                                //"Vendor Ledger Entry"."Exchange Factor" := 1 / RecPIH."Currency Factor"; //PCPL-064
                                "Vendor Ledger Entry".MODIFY;
                            END UNTIL RecPIH.NEXT = 0;
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("For Customer Ledger Update"; "For Customer Ledger Update")
                {
                    ApplicationArea = All;
                }
                field("For Vendor Ledger Update"; "For Vendor Ledger Update")
                {
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

    var
        RecSalesInvoiceHeader: Record 112;
        CurrencyFactor: Decimal;
        RecPIH: Record 122;
        "For Customer Ledger Update": Boolean;
        "For Vendor Ledger Update": Boolean;
}

