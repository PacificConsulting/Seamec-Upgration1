report 50070 UpdatePurchaseHeader
{
    Caption = 'Update Vendor GST No. On PO';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.");
            RequestFilterFields = "Document Type", "No.", "Pay-to Vendor No.";

            trigger OnAfterGetRecord()
            begin
                IF Vend.GET("Purchase Header"."Pay-to Vendor No.") THEN BEGIN
                    IF Vend."GST Registration No." <> '' THEN BEGIN
                        IF "Purchase Header"."Vendor GST Reg. No." = '' THEN BEGIN
                            "Purchase Header"."Vendor GST Reg. No." := Vend."GST Registration No.";

                        END;

                        IF Location.GET("Purchase Header"."Location Code") THEN BEGIN
                            "Location GST Reg. No." := Location."GST Registration No.";
                            "Location State Code" := Location."State Code";
                        END;
                        "Purchase Header".MODIFY;
                        PurchLine.SETRANGE("Document Type", "Document Type");
                        PurchLine.SETRANGE("Document No.", "No.");
                        IF PurchLine.FINDSET THEN
                            REPEAT
                                //PurchLine."Order Address Code" := "Order Address Code";
                                PurchLine."Buy-From GST Registration No" := "Vendor GST Reg. No.";
                                PurchLine.MODIFY
                            UNTIL PurchLine.NEXT = 0;
                    END;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Updated');
            end;

            trigger OnPreDataItem()
            begin
                DocFilter := "Purchase Header".GETFILTER("No.");
                IF DocFilter = '' THEN
                    ERROR('Kindly specify the No.');
            end;
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

    var
        Vend: Record 23;
        PurchLine: Record 39;
        Location: Record 14;
        DocFilter: Text;
}

