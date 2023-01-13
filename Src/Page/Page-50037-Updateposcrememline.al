page 50037 "Update pos cre mem line"
{
    PageType = List;
    Permissions = TableData 115 = rm;
    SourceTable = "Sales Cr.Memo Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
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
                field("Shipment Date"; Rec."Shipment Date")
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
                field("Unit Price"; Rec."Unit Price")
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
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
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
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
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
                field("Exit Point"; Rec."Exit Point")
                {
                }
                //         field(Area;Area)
                // {
                // }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("Tax Category"; Rec."Tax Category")
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
                field("VAT Clause Code"; Rec."VAT Clause Code")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
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
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                }
                field("VAT Identifier"; Rec."VAT Identifier")
                {
                }
                field("IC Partner Ref. Type"; Rec."IC Partner Ref. Type")
                {
                }
                field("IC Partner Reference"; Rec."IC Partner Reference")
                {
                }
                field("Prepayment Line"; Rec."Prepayment Line")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
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
                field("Job Contract Entry No."; Rec."Job Contract Entry No.")
                {
                }
                field("Deferral Code"; Rec."Deferral Code")
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
                field("FA Posting Date"; Rec."FA Posting Date")
                {
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                }
                field("Depr. until FA Posting Date"; Rec."Depr. until FA Posting Date")
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
                field("Product Group Code"; '')// Rec."Product Group Code") //pcpl-065
                {
                }
                field("Appl.-from Item Entry"; Rec."Appl.-from Item Entry")
                {
                }
                field("Return Receipt No."; Rec."Return Receipt No.")
                {
                }
                field("Return Receipt Line No."; Rec."Return Receipt Line No.")
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                }
                field("Tax Amount"; '')// Rec."Tax Amount")//pcpl-065
                {
                }
                field("Excise Bus. Posting Group"; '')//Rec."Excise Bus. Posting Group")//pcpl-065
                {
                }
                field("Excise Prod. Posting Group"; '')// Rec."Excise Prod. Posting Group")//pcpl-065
                {
                }
                field("Excise Amount"; '')// Rec."Excise Amount")//pcpl-065
                {
                }
                field("Amount Including Excise"; '')// Rec."Amount Including Excise")//pcpl-065
                {
                }
                field("Excise Base Amount"; '')// Rec."Excise Base Amount")//pcpl-065
                {
                }
                field("Excise Accounting Type"; '')// Rec."Excise Accounting Type")//pcpl-065
                {
                }
                field("Excise Base Quantity"; '')// Rec."Excise Base Quantity")//pcpl-065
                {
                }
                field("Tax %"; '')// Rec."Tax %")//pcpl-065
                {
                }
                field("Amount Including Tax"; '')// Rec."Amount Including Tax")//pcpl-065
                {
                }
                field("Tax Base Amount"; '')// Rec."Tax Base Amount")//pcpl-065
                {
                }
                field("Surcharge %"; '')// Rec."Surcharge %")//pcpl-065
                {
                }
                field("Surcharge Amount"; '')// Rec."Surcharge Amount")//pcpl-065
                {
                }
                field("Concessional Code"; '')// Rec."Concessional Code")//pcpl-065
                {
                }
                field("Assessee Code"; Rec."Assessee Code")
                {
                }
                field("TDS/TCS %"; '')// Rec."TDS/TCS %")//pcpl-065
                {
                }
                field("Bal. TDS/TCS Including SHECESS"; '')// Rec."Bal. TDS/TCS Including SHECESS")//pcpl-065
                {
                }
                field("Claim Deferred Excise"; '')// Rec."Claim Deferred Excise")//pcpl-065
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
                field("SAED Amount"; '')//Rec."SAED Amount")//pcpl-065
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
                field("Form Code"; '')// Rec."Form Code")//pcpl-065
                {
                }
                field("Form No."; '')// Rec."Form No.")//pcpl-065
                {
                }
                field(State; '')// Rec.State)//pcpl-065
                {
                }
                field("TDS/TCS Amount"; '')// Rec."TDS/TCS Amount")//pcpl-065
                {
                }
                field("Amount To Customer"; '')// Rec."Amount To Customer")//pcpl-065
                {
                }
                field("Balance Work Tax Amount"; '')// Rec."Balance Work Tax Amount")//pcpl-065
                {
                }
                field("Charges To Customer"; '')// Rec."Charges To Customer")//pcpl-065
                {
                }
                field("TDS/TCS Base Amount"; '')// Rec."TDS/TCS Base Amount")//pcpl-065
                {
                }
                field("Surcharge Base Amount"; '')// Rec."Surcharge Base Amount")//pcpl-065
                {
                }
                field("Temp TDS/TCS Base"; '')// Rec."Temp TDS/TCS Base")//pcpl-065
                {
                }
                field("Service Tax Group"; '')// Rec."Service Tax Group")//pcpl-065
                {
                }
                field("Service Tax Base"; '')// Rec."Service Tax Base")//pcpl-065
                {
                }
                field("Service Tax Amount"; '')// Rec."Service Tax Amount")//pcpl-065
                {
                }
                field("Service Tax Registration No."; '')// Rec."Service Tax Registration No.")//pcpl-065
                {
                }
                field("eCESS % on TDS/TCS"; '')// Rec."eCESS % on TDS/TCS")//pcpl-065
                {
                }
                field("eCESS on TDS/TCS Amount"; '')// Rec."eCESS on TDS/TCS Amount")//pcpl-065
                {
                }
                field("Total TDS/TCS Incl SHE CESS"; '')// Rec."Total TDS/TCS Incl SHE CESS")//pcpl-065
                {
                }
                field("Per Contract"; '')// Rec."Per Contract")//pcpl-065
                {
                }
                field("Service Tax eCess Amount"; '')// Rec."Service Tax eCess Amount")//pcpl-065
                {
                }
                field("ADET Amount"; '')// Rec."ADET Amount")//pcpl-065
                {
                }
                field("AED(TTA) Amount"; '')// Rec."AED(TTA) Amount")//pcpl-065
                {
                }
                field("Free Supply"; '')// Rec."Free Supply")//pcpl-065
                {
                }
                field("ADE Amount"; '')// Rec."ADE Amount")//pcpl-065
                {
                }
                field("Assessable Value"; '')// Rec."Assessable Value")//pcpl-065
                {
                }
                field("VAT Type"; '')// Rec."VAT Type")//pcpl-065
                {
                }
                field("SHE Cess Amount"; '')// Rec."SHE Cess Amount")//pcpl-065
                {
                }
                field("Service Tax SHE Cess Amount"; '')// Rec."Service Tax SHE Cess Amount")//pcpl-065
                {
                }
                field("TCS Nature of Collection"; Rec."TCS Nature of Collection")
                {
                }
                field("TCS Type"; '')// Rec."TCS Type")//pcpl-065
                {
                }
                field("Standard Deduction %"; '')// Rec."Standard Deduction %")//pcpl-065
                {
                }
                field("Standard Deduction Amount"; '')// Rec."Standard Deduction Amount")//pcpl-065
                {
                }
                field(Supplementary; '')// Rec.Supplementary)//pcpl-065
                {
                }
                field("Source Document Type"; '')// Rec."Source Document Type")//pcpl-065
                {
                }
                field("Source Document No."; '')// Rec."Source Document No.")//pcpl-065
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
                field("Process Carried Out"; '')// Rec."Process Carried Out")//pcpl-065
                {
                }
                field("Identification Mark"; '')// Rec."Identification Mark") //pcpl-065
                {
                }
                field("Re-Dispatch"; '')// Rec."Re-Dispatch") //pcpl-065
                {
                }
                field("Return Rcpt line No."; '')// Rec."Return Rcpt line No.")//pcpl-065
                {
                }
                field("Qty. to be Re-Dispatched"; '')// Rec."Qty. to be Re-Dispatched")//pcpl-065
                {
                }
                field("Return Re-Dispatch Rcpt. No."; '')// Rec."Return Re-Dispatch Rcpt. No.")//pcpl-065
                {
                }
                field("SHE Cess % on TDS/TCS"; '')// Rec."SHE Cess % on TDS/TCS")//pcpl-065
                {
                }
                field("SHE Cess on TDS/TCS Amount"; '')// Rec."SHE Cess on TDS/TCS Amount")//pcpl-065
                {
                }
                field("MRP Price"; '')// Rec."MRP Price")//pcpl-065
                {
                }
                field(MRP; '')// Rec.MRP)//pcpl-065
                {
                }
                field("Abatement %"; '')// Rec."Abatement %")//pcpl-065
                {
                }
                field("PIT Structure"; '')// Rec."PIT Structure")//pcpl-065
                {
                }
                field("Price Inclusive of Tax"; '')// Rec."Price Inclusive of Tax")//pcpl-065
                {
                }
                field("Unit Price Incl. of Tax"; Rec."Unit Price Incl. of Tax")
                {
                }
                field("Amount To Customer UPIT"; '')// Rec."Amount To Customer UPIT")//pcpl-065
                {
                }
                field("UPIT Rounding Inserted"; '')// Rec."UPIT Rounding Inserted")//pcpl-065
                {
                }
                field("Custom eCess Amount"; '')// Rec."Custom eCess Amount")//pcpl-065
                {
                }
                field("Custom SHECess Amount"; '')// Rec."Custom SHECess Amount")//pcpl-065
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
                field("GST Place of Supply"; Rec."GST Place of Supply")
                {
                }
                field("GST Group Code"; Rec."GST Group Code")
                {
                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                }
                field("GST Base Amount"; '')// Rec."GST Base Amount")//pcpl-065
                {
                }
                field("GST %"; '')// Rec."GST %")//pcpl-065
                {
                }
                field("Total GST Amount"; '')// Rec."Total GST Amount") //pcpl-065
                {
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                }
                field(Exempted; Rec.Exempted)
                {
                }
                field("Line Quantity"; Rec."Line Quantity")
                {
                }
            }
        }
    }

    actions
    {
    }
}

