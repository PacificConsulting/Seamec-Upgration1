report 50068 delete
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/delete.rdl';
    ProcessingOnly = false;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            column(GlobalDimension1Code_FixedAsset; "Fixed Asset"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_FixedAsset; "Fixed Asset"."Global Dimension 2 Code")
            {
            }
            column(No_FixedAsset; "Fixed Asset"."No.")
            {
            }
            column(Description_FixedAsset; "Fixed Asset".Description)
            {
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

    trigger OnPostReport()
    var
        PurchaseLine: Record 39;
        Text: Text;
        DetailedVendorLedgEntry: Record 380;
    begin
    end;

    var
        ItemUnitofMeasure: Record 5404;
        PurchaseHeader: Record 38;
}

