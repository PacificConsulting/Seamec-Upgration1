page 50058 re
{
    PageType = List;
    Permissions = TableData 121 = rimd;
    SourceTable = "Purch. Rcpt. Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                }
                field("VAT %"; Rec."VAT %")
                {
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                }
                field("Net Weight"; Rec."Net Weight")
                {
                }
                field("Units per Parcel"; Rec."Units per Parcel")
                {
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                }
                field("Item Rcpt. Entry No."; Rec."Item Rcpt. Entry No.")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                }
                field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
                {
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                }
                field("Sales Order Line No."; Rec."Sales Order Line No.")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("VAT Calculation Type"; Rec."VAT Calculation Type")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("Attached to Line No."; Rec."Attached to Line No.")
                {
                }
                field("Entry Point"; Rec."Entry Point")
                {
                }
                //         field(Area;Area) //pcpl-065
                // {
                // }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                }
                field("Use Tax"; Rec."Use Tax")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    AccessByPermission = TableData 121 = RIMD;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                }
                field("Blanket Order Line No."; Rec."Blanket Order Line No.")
                {
                }
                field("VAT Base Amount"; Rec."VAT Base Amount")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("IC Partner Ref. Type"; Rec."IC Partner Ref. Type")
                {
                }
                field("IC Partner Reference"; Rec."IC Partner Reference")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                }
                field("Job Unit Price"; Rec."Job Unit Price")
                {
                }
                field("Job Total Price"; Rec."Job Total Price")
                {
                }
                field("Job Line Amount"; Rec."Job Line Amount")
                {
                }
                field("Job Line Discount Amount"; Rec."Job Line Discount Amount")
                {
                }
                field("Job Line Discount %"; Rec."Job Line Discount %")
                {
                }
                field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
                {
                }
                field("Job Total Price (LCY)"; Rec."Job Total Price (LCY)")
                {
                }
                field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
                {
                }
                field("Job Line Disc. Amount (LCY)"; Rec."Job Line Disc. Amount (LCY)")
                {
                }
                field("Job Currency Factor"; Rec."Job Currency Factor")
                {
                }
                field("Job Currency Code"; Rec."Job Currency Code")
                {
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                }
                field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
                {
                }
                field("FA Posting Date"; Rec."FA Posting Date")
                {
                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                }
                field("Salvage Value"; Rec."Salvage Value")
                {
                }
                field("Depr. until FA Posting Date"; Rec."Depr. until FA Posting Date")
                {
                }
                field("Depr. Acquisition Cost"; Rec."Depr. Acquisition Cost")
                {
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                }
                field("Insurance No."; Rec."Insurance No.")
                {
                }
                field("Budgeted FA No."; Rec."Budgeted FA No.")
                {
                }
                field("Duplicate in Depreciation Book"; Rec."Duplicate in Depreciation Book")
                {
                }
                field("Use Duplication List"; Rec."Use Duplication List")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Cross-Reference No."; Rec."Cross-Reference No.")
                {
                }
                field("Unit of Measure (Cross Ref.)"; Rec."Unit of Measure (Cross Ref.)")
                {
                }
                field("Cross-Reference Type"; Rec."Cross-Reference Type")
                {
                }
                field("Cross-Reference Type No."; Rec."Cross-Reference Type No.")
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
                field("Product Group Code"; '')// Rec."Product Group Code")//pcpl-065
                {
                }
                field("Special Order Sales No."; Rec."Special Order Sales No.")
                {
                }
                field("Special Order Sales Line No."; Rec."Special Order Sales Line No.")
                {
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                }
                field("Planned Receipt Date"; Rec."Planned Receipt Date")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Item Charge Base Amount"; Rec."Item Charge Base Amount")
                {
                }
                field(Correction; Rec.Correction)
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("Tax %"; '')// Rec."Tax %")//pcpl-065
                {
                }
                field("Form Code"; '')// Rec."Form Code")//pcpl-065
                {
                }
                field("Form No."; '')// Rec."Form No.")//pcpl-065
                {
                }
                field(State; '')// Rec.State)//pcpl-065
                {
                }
                field("Excise Bus. Posting Group"; '')// Rec."Excise Bus. Posting Group")//pcpl-065
                {
                }
                field("Excise Prod. Posting Group"; '')// Rec."Excise Prod. Posting Group")//pcpl-065
                {
                }
                field("Amount Including Excise"; '')// Rec."Amount Including Excise")//pcpl-065
                {
                }
                field("Excise Amount"; '')// Rec."Excise Amount")//pcpl-065
                {
                }
                field("Excise Base Quantity"; '')// Rec."Excise Base Quantity")//pcpl-065
                {
                }
                field("Excise Accounting Type"; '')// Rec."Excise Accounting Type")//pcpl-065
                {
                }
                field("Excise Base Amount"; '')// Rec."Excise Base Amount")//pcpl-065
                {
                }
                field("Capital Item"; '')// Rec."Capital Item")//pcpl-065
                {
                }
                field("BED Amount"; '')// Rec."BED Amount")//pcpl-065
                {
                }
                field("AED(GSI) Amount"; '')// Rec."AED(GSI) Amount")//pcpl-065
                {
                }
                field("SED Amount"; '')// Rec."SED Amount")//pcpl-065
                {
                }
                field("SAED Amount"; '')// Rec."SAED Amount")//pcpl-065
                {
                }
                field("CESS Amount"; '')// Rec."CESS Amount")//pcpl-065
                {
                }
                field("NCCD Amount"; '')// Rec."NCCD Amount")//pcpl-065
                {
                }
                field("eCess Amount"; '')// Rec."eCess Amount")//pcpl-065
                {
                }
                field("Claim VAT"; '')// Rec."Claim VAT")//pcpl-065
                {
                }
                field("Refund VAT"; '')// Rec."Refund VAT")//pcpl-065
                {
                }
                field("Consume VAT"; '')// Rec."Consume VAT")//pcpl-065
                {
                }
                field("Reverse VAT"; '')// Rec."Reverse VAT")//pcpl-065
                {
                }
                field("Set Off Available"; '')// Rec."Set Off Available")//pcpl-065
                {
                }
                field("Qty. Rejected (Rework)"; '')// Rec."Qty. Rejected (Rework)")//pcpl-065
                {
                }
                field("Qty. Rejected (C.E.)"; '')// Rec."Qty. Rejected (C.E.)")//pcpl-065
                {
                }
                field("Qty. Rejected (V.E.)"; '')// Rec."Qty. Rejected (V.E.)")//pcpl-065
                {
                }
                field("Vendor Shipment No."; '')// Rec."Vendor Shipment No.")//pcpl-065
                {
                }
                field("Service Tax Group"; '')//Rec."Service Tax Group")//pcpl-065
                {
                }
                field("Service Tax %"; '')// Rec."Service Tax %")//pcpl-065
                {
                }
                field("Service Tax eCess %"; '')// Rec."Service Tax eCess %")//pcpl-065
                {
                }
                field("RG Record Type"; '')// Rec."RG Record Type")//pcpl-065
                {
                }
                field("Excise as Service Tax Credit"; '')// Rec."Excise as Service Tax Credit")//pcpl-065
                {
                }
                field("Service Tax as Excise Credit"; '')// Rec."Service Tax as Excise Credit")//pcpl-065
                {
                }
                field("ADET Amount"; '')// Rec."ADET Amount")//pcpl-065
                {
                }
                field("AED(TTA) Amount"; '')// Rec."AED(TTA) Amount")//pcpl-065
                {
                }
                field("ADE Amount"; '')// Rec."ADE Amount")//pcpl-065
                {
                }
                field("Assessable Value"; '')// Rec."Assessable Value")//pcpl-065
                {
                }
                field("SHE Cess Amount"; '')// Rec."SHE Cess Amount")//pcpl-065
                {
                }
                field(Supplementary; Rec.Supplementary)
                {
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                }
                field("ADC VAT Amount"; '')// Rec."ADC VAT Amount")//pcpl-065
                {
                }
                field("CIF Amount"; '')// Rec."CIF Amount")//pcpl-065
                {
                }
                field("BCD Amount"; '')// Rec."BCD Amount")//pcpl-065
                {
                }
                field(CVD; '')// Rec.CVD)//pcpl-065
                {
                }
                field("Notification Sl. No."; '')// Rec."Notification Sl. No.")//pcpl-065
                {
                }
                field("Notification No."; '')// Rec."Notification No.")//pcpl-065
                {
                }
                field("CTSH No."; '')// Rec."CTSH No.")//pcpl-065
                {
                }
                field("Reason Code"; '')// Rec."Reason Code")//pcpl-065
                {
                }
                field("Excise Loading on Inventory"; '')// Rec."Excise Loading on Inventory")//pcpl-065
                {
                }
                field("Custom eCess Amount"; '')// Rec."Custom eCess Amount")//pcpl-065
                {
                }
                field("Custom SHECess Amount"; '')// Rec."Custom SHECess Amount")//pcpl-065
                {
                }
                field("Excise Refund"; '')// Rec."Excise Refund")//pcpl-065
                {
                }
                field("CWIP G/L Type"; '')// Rec."CWIP G/L Type")//pcpl-065
                {
                }
                field("Service Tax SBC %"; '')// Rec."Service Tax SBC %")//pcpl-065
                {
                }
                field("Service Tax SBC Amount"; '')// Rec."Service Tax SBC Amount")//pcpl-065
                {
                }
                field("Service Tax SBC Amount (Intm)"; '')// Rec."Service Tax SBC Amount (Intm)")//pcpl-065
                {
                }
                field("KK Cess%"; '')// Rec."KK Cess%")//pcpl-065
                {
                }
                field("KK Cess Amount"; '')// Rec."KK Cess Amount")//pcpl-065
                {
                }
                field("GST Credit"; Rec."GST Credit")
                {
                }
                field("GST Group Code"; Rec."GST Group Code")
                {
                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                }
                field("GST Base Amount"; '')// Rec."GST Base Amount")//pcpl-065
                {
                }
                field("GST %"; '')// Rec."GST %") //pcpl-065
                {
                }
                field("Total GST Amount"; '')// Rec."Total GST Amount")//pcpl-065
                {
                }
                field(Exempted; Rec.Exempted)
                {
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                }
                field("Custom Duty Amount"; Rec."Custom Duty Amount")
                {
                }
                field("GST Reverse Charge"; Rec."GST Reverse Charge")
                {
                }
                field("GST Assessable Value"; Rec."GST Assessable Value")
                {
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                }
                field("Buy-From GST Registration No"; Rec."Buy-From GST Registration No")
                {
                }
                field("GST Rounding Line"; Rec."GST Rounding Line")
                {
                }
                field("Bill to-Location(POS)"; Rec."Bill to-Location(POS)")
                {
                }
                field("Non-GST Line"; Rec."Non-GST Line")
                {
                }
                field("Routing No."; Rec."Routing No.")
                {
                }
                field("Operation No."; Rec."Operation No.")
                {
                }
                field("Work Center No."; Rec."Work Center No.")
                {
                }
                field("Prod. Order Line No."; Rec."Prod. Order Line No.")
                {
                }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                }
                field("Routing Reference No."; Rec."Routing Reference No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

