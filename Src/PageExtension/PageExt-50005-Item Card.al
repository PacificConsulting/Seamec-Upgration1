pageextension 50005 Itemcard extends "Item Card"
{
    layout
    {
        addafter("Qty. on Asm. Component")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
            }
        }
        //PCPL-25/240323
        modify("Item Disc. Group")
        {
            Visible = false;
        }

        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Vendor Item No.")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        modify("Profit %")
        {
            Visible = false;
        }
        modify("Gross Weight")
        {
            Visible = false;
        }
        modify("Net Weight")
        {
            visible = false;
        }
        modify("Country/Region of Origin Code")
        {
            visible = false;
        }
        modify(GTIN)
        {
            visible = false;
        }
        modify("Default Deferral Template Code")
        {
            visible = false;
        }
        modify("Minimum Order Quantity")
        {
            visible = false;
        }
        modify("Maximum Order Quantity")
        {
            visible = false;
        }
        modify("Time Bucket")
        {
            visible = false;
        }
        modify("Safety Stock Quantity")
        {
            visible = false;
        }
        modify("Rescheduling Period")
        {
            visible = false;
        }
        modify("Lot Accumulation Period")
        {
            visible = false;
        }
        modify("Dampener Period")
        {
            visible = false;
        }
        modify("Dampener Quantity")
        {
            visible = false;
        }
        modify("Overflow Level")
        {
            visible = false;
        }
        modify("Purchasing Code")
        {
            visible = false;
        }
        modify("Service Item Group")
        {
            visible = false;
        }
        modify("Item Tracking Code")
        {
            visible = false;
        }
        modify("Lot Nos.")
        {
            visible = false;
        }
        modify("Expiration Calculation")
        {
            visible = false;
        }
        modify("Warehouse Class Code")
        {
            visible = false;
        }
        modify("Special Equipment Code")
        {
            visible = false;
        }
        modify("Put-away Unit of Measure Code")
        {
            visible = false;
        }
        modify("Phys Invt Counting Period Code")
        {
            visible = false;
        }
        modify("Put-away Template Code")
        {
            visible = false;
        }
        modify("Use Cross-Docking")
        {
            visible = false;
        }
        modify("Last Counting Period Update")
        {
            visible = false;
        }
        modify("Next Counting End Date")
        {
            visible = false;
        }
        modify("Next Counting Start Date")
        {
            visible = false;
        }
        modify("Tax Group Code")
        {
            visible = false;
        }
        modify("Purchasing Blocked")
        {
            visible = false;
        }
        modify("Sales Blocked")
        {
            visible = false;
        }
        modify("Over-Receipt Code")
        {
            visible = false;
        }
        modify(Subcontracting)
        {
            visible = false;
        }
        modify("Sub. Comp. Location")
        {
            visible = false;
        }
        // modify("Responsibility Center")
        // {
        //     visible = false;
        // }
        modify("Order Tracking Policy")
        {
            visible = false;
        }
        modify(Critical)
        {
            visible = false;
        }
        //PCPL-25/240323

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}