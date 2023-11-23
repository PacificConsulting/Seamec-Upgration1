report 50067 "Item Master"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/ItemMaster.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Item; Item)
        {
            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Item.Description)
            {
            }
            column(BaseUnitofMeasure_Item; Item."Base Unit of Measure")
            {
            }
            column(Type_Item; Item.Type)
            {
            }
            column(Inventory_Item; Item.Inventory)
            {
            }
            column(Blocked_Item; Item.Blocked)
            {
            }
            column(LastTrasDate; LastTrasDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                GetLastDate;
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
        LastTrasDate: Date;

    local procedure GetLastDate()
    var
        ValueEntry: Record "Value Entry";//5802;
    begin
        CLEAR(LastTrasDate);
        ValueEntry.RESET;
        ValueEntry.SETRANGE("Item No.", Item."No.");
        IF ValueEntry.FINDLAST THEN
            LastTrasDate := ValueEntry."Posting Date";
    end;
}

