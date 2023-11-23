report 50061 "Purchase Line Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/PurchaseLineReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            column(No_PurchInvLine; "Purch. Inv. Line"."No.")
            {
            }
            column(LocationCode_PurchInvLine; "Purch. Inv. Line"."Location Code")
            {
            }
            column(UnitofMeasure_PurchInvLine; "Purch. Inv. Line"."Unit of Measure")
            {
            }
            column(BuyfromVendorNo_PurchInvLine; "Purch. Inv. Line"."Buy-from Vendor No.")
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Inv. Line"."Document No.")
            {
            }
            column(AmountToVendor_PurchInvLine; 0)//"Purch. Inv. Line"."Amount To Vendor") PCPL-064
            {
            }
            column(GSTCredit_PurchInvLine; "Purch. Inv. Line"."GST Credit")
            {
            }
            column(GSTGroupCode_PurchInvLine; "Purch. Inv. Line"."GST Group Code")
            {
            }
            column(GSTGroupType_PurchInvLine; "Purch. Inv. Line"."GST Group Type")
            {
            }
            column(HSNSACCode_PurchInvLine; "Purch. Inv. Line"."HSN/SAC Code")
            {
            }
            column(GSTBaseAmount_PurchInvLine; 0)// "Purch. Inv. Line"."GST Base Amount") PCPL-064
            {
            }
            column(GST_PurchInvLine; 0)//"Purch. Inv. Line"."GST %") PCPL-064
            {
            }
            column(TotalGSTAmount_PurchInvLine; 0)// "Purch. Inv. Line"."Total GST Amount") PCPL-064
            {
            }
            column(TDSReasonCode_PurchInvLine; '')// "Purch. Inv. Line"."TDS Reason Code") PCPL-064
            {
            }
            column(PostingDate_PurchInvLine; "Purch. Inv. Line"."Posting Date")
            {
            }
            column(TDSPer; TDSPer)
            {
            }
            column(TDSAmount; TDSAmount)
            {
            }
            column(TDSBaseAmount; TDSBaseAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //PCPL/0028 Start
                TDSAmount := 0;
                TDSBaseAmount := 0;
                TDSPer := 0;
                TDSEntry.RESET;
                TDSEntry.SETRANGE(TDSEntry."Document No.", "Document No.");
                IF TDSEntry.FINDSET THEN BEGIN
                    TDSAmount := TDSEntry."TDS Amount";
                    TDSBaseAmount := TDSEntry."TDS Base Amount";
                    TDSPer := TDSEntry."TDS %";
                END
                //PCPL/0028 ENd
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
        TDSEntry: Record "TDS Entry";//13729;PCPL-064
        TDSPer: Decimal;
        TDSAmount: Decimal;
        TDSBaseAmount: Decimal;
}

