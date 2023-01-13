page 50026 "Update ILE"
{
    PageType = List;
    Permissions = TableData 32 = rim;
    SourceTable = "Item Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Positive; Rec.Positive)
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
                field("Entry/Exit Point"; Rec."Entry/Exit Point")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                //         field(Area;Area)///pcpl-065
                // {
                // }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Assemble to Order"; '')// "Assemble to Order") //pcpl-065
                {
                }
                field("Job No."; Rec."Job No.")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Job Purchase"; Rec."Job Purchase")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Derived from Blanket Order"; Rec."Derived from Blanket Order")
                {
                }
                field("Cross-Reference No."; Rec."Cross-Reference No.")
                {
                }
                field("Originally Ordered No."; Rec."Originally Ordered No.")
                {
                }
                field("Originally Ordered Var. Code"; Rec."Originally Ordered Var. Code")
                {
                }
                field("Out-of-Stock Substitution"; Rec."Out-of-Stock Substitution")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field(Nonstock; Rec.Nonstock)
                {
                }
                field("Purchasing Code"; Rec."Purchasing Code")
                {
                }
                field("Product Group Code"; '')// Rec."Product Group Code") //pcpl-065
                {
                }
                field("Completely Invoiced"; Rec."Completely Invoiced")
                {
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                }
                field("Applied Entry to Adjust"; Rec."Applied Entry to Adjust")
                {
                }
                field("Cost Amount (Expected)"; Rec."Cost Amount (Expected)")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Cost Amount (Non-Invtbl.)"; Rec."Cost Amount (Non-Invtbl.)")
                {
                }
                field("Cost Amount (Expected) (ACY)"; Rec."Cost Amount (Expected) (ACY)")
                {
                }
                field("Cost Amount (Actual) (ACY)"; Rec."Cost Amount (Actual) (ACY)")
                {
                }
                field("Cost Amount (Non-Invtbl.)(ACY)"; Rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                }
                field("Purchase Amount (Expected)"; Rec."Purchase Amount (Expected)")
                {
                }
                field("Purchase Amount (Actual)"; Rec."Purchase Amount (Actual)")
                {
                }
                field("Sales Amount (Expected)"; Rec."Sales Amount (Expected)")
                {
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                }
                field(Correction; Rec.Correction)
                {
                }
                field("Shipped Qty. Not Returned"; Rec."Shipped Qty. Not Returned")
                {
                }
                field("Prod. Order Comp. Line No."; Rec."Prod. Order Comp. Line No.")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Lot No."; Rec."Lot No.")
                {
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                }
                field("Item Tracking"; Rec."Item Tracking")
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("DSA Entry No."; '')// Rec."DSA Entry No.")//pcpl-065
                {
                }
                field("BED %"; '')// Rec."BED %")//pcpl-065
                {
                }
                field("BED Amount"; '')// Rec."BED Amount")//pcpl-065
                {
                }
                field("Other Duties %"; '')// Rec."Other Duties %")//pcpl-065
                {
                }
                field("Other Duties Amount"; '')// Rec."Other Duties Amount")//pcpl-065
                {
                }
                field("Laboratory Test"; '')// Rec."Laboratory Test")//pcpl-065
                {
                }
                field("Other Usage"; '')// Rec."Other Usage")//pcpl-065
                {
                }
                field("Nature of Disposal"; '')// Rec."Nature of Disposal")//pcpl-065
                {
                }
                field("Type of Disposal"; '')// Rec."Type of Disposal")//pcpl-065
                {
                }
                field("Reason Code"; '')// Rec."Reason Code") //pcpl-065
                {
                }
                field("Captive Consumption"; '')// Rec."Captive Consumption")//pcpl-065
                {
                }
                field("Re-Dispatch"; '')// Rec."Re-Dispatch")//pcpl-065
                {
                }
                field("Assessable Value"; '')// Rec."Assessable Value")//pcpl-065
                {
                }
                field("Subcon Order No."; Rec."Subcon Order No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

