report 50071 "UpdatePurchase Line TDS"
{
    Caption = 'Update Vendor GST No. On PO';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE(Quantity = FILTER(<> 0));
            RequestFilterFields = "Document Type", "Document No.";

            trigger OnAfterGetRecord()
            begin
                IF PurchaseHeader.GET("Purchase Line"."Document Type", "Purchase Line"."Document No.") THEN BEGIN
                    //PCPL-064
                    /*IF "Purchase Line"."Assessee Code" = '' THEN BEGIN
                         "Purchase Line"."Assessee Code" := PurchaseHeader."Assessee Code";
                         "Purchase Line".MODIFY;
                     END; *///PCPL-064
                    IF "Purchase Line"."State Code" = '' THEN BEGIN
                        "Purchase Line"."State Code" := PurchaseHeader.State;
                        "Purchase Line".MODIFY;
                    END;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Updated');
            end;

            trigger OnPreDataItem()
            begin
                DocFilter := "Purchase Line".GETFILTER("Purchase Line"."Document No.");
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
        PurchaseHeader: Record 38;
        Location: Record 14;
        DocFilter: Text;
}

