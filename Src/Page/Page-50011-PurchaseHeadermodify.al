page 50011 "Purchase Header modify"
{
    PageType = List;
    Permissions = TableData 38 = rim;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                }
                field("Vendor GST Reg. No."; Rec."Vendor GST Reg. No.")
                {
                    Editable = true;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                }
                field("Pay-to Name 2"; Rec."Pay-to Name 2")
                {
                }
                field("Pay-to Address"; Rec."Pay-to Address")
                {
                }
                field("Pay-to Address 2"; Rec."Pay-to Address 2")
                {
                }
                field("Pay-to City"; Rec."Pay-to City")
                {
                }
                field("Pay-to Contact"; Rec."Pay-to Contact")
                {
                }
                field("Your Reference"; Rec."Your Reference")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                }
                field("Ship-to Name 2"; Rec."Ship-to Name 2")
                {
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                }
                field("Posting Description"; Rec."Posting Description")
                {
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                }
                field("Language Code"; Rec."Language Code")
                {
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                }
                field("Order Class"; Rec."Order Class")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("No. Printed"; Rec."No. Printed")
                {
                }
                field("On Hold"; Rec."On Hold")
                {
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Recalculate Invoice Disc."; Rec."Recalculate Invoice Disc.")
                {
                }
                field(Receive; Rec.Receive)
                {
                }
                field(Invoice; Rec.Invoice)
                {
                }
                field("Print Posted Documents"; Rec."Print Posted Documents")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                }
                field("Receiving No."; Rec."Receiving No.")
                {
                }
                field("Posting No."; Rec."Posting No.")
                {
                }
                field("Last Receiving No."; Rec."Last Receiving No.")
                {
                }
                field("Last Posting No."; Rec."Last Posting No.")
                {
                }
                field("Vendor Order No."; Rec."Vendor Order No.")
                {
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                }
                field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
                {
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("VAT Country/Region Code"; '')// Rec.VAT Country/Region Code") //pcpl-065
                {
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                }
                field("Buy-from Vendor Name 2"; Rec."Buy-from Vendor Name 2")
                {
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                }
                field("Pay-to Post Code"; Rec."Pay-to Post Code")
                {
                }
                field("Pay-to County"; Rec."Pay-to County")
                {
                }
                field("Pay-to Country/Region Code"; Rec."Pay-to Country/Region Code")
                {
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                }
                field("Buy-from County"; Rec."Buy-from County")
                {
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                }
                field("Entry Point"; Rec."Entry Point")
                {
                }
                field(Correction; Rec.Correction)
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                //         field(Area;Area) //pcpl-065
                // {
                // }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                }
                field("Receiving No. Series"; Rec."Receiving No. Series")
                {
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                }
                field("VAT Base Discount %"; Rec."VAT Base Discount %")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
                field("Invoice Discount Calculation"; Rec."Invoice Discount Calculation")
                {
                }
                field("Invoice Discount Value"; Rec."Invoice Discount Value")
                {
                }
                field("Send IC Document"; Rec."Send IC Document")
                {
                }
                field("IC Status"; Rec."IC Status")
                {
                }
                field("Buy-from IC Partner Code"; Rec."Buy-from IC Partner Code")
                {
                }
                field("Pay-to IC Partner Code"; Rec."Pay-to IC Partner Code")
                {
                }
                field("IC Direction"; Rec."IC Direction")
                {
                }
                field("Prepayment No."; Rec."Prepayment No.")
                {
                }
                field("Last Prepayment No."; Rec."Last Prepayment No.")
                {
                }
                field("Prepmt. Cr. Memo No."; Rec."Prepmt. Cr. Memo No.")
                {
                }
                field("Last Prepmt. Cr. Memo No."; Rec."Last Prepmt. Cr. Memo No.")
                {
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                }
                field("Prepayment No. Series"; Rec."Prepayment No. Series")
                {
                }
                field("Compress Prepayment"; Rec."Compress Prepayment")
                {
                }
                field("Prepayment Due Date"; Rec."Prepayment Due Date")
                {
                }
                field("Prepmt. Cr. Memo No. Series"; Rec."Prepmt. Cr. Memo No. Series")
                {
                }
                field("Prepmt. Posting Description"; Rec."Prepmt. Posting Description")
                {
                }
                field("Prepmt. Pmt. Discount Date"; Rec."Prepmt. Pmt. Discount Date")
                {
                }
                field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
                {
                }
                field("Prepmt. Payment Discount %"; Rec."Prepmt. Payment Discount %")
                {
                }
                field("Quote No."; Rec."Quote No.")
                {
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                }
                field("Job Queue Entry ID"; Rec."Job Queue Entry ID")
                {
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                }
                field("Doc. No. Occurrence"; Rec."Doc. No. Occurrence")
                {
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                }
                field("Pay-to Contact No."; Rec."Pay-to Contact No.")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Completely Received"; Rec."Completely Received")
                {
                }
                field("Posting from Whse. Ref."; Rec."Posting from Whse. Ref.")
                {
                }
                field("Location Filter"; Rec."Location Filter")
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
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Vendor Authorization No."; Rec."Vendor Authorization No.")
                {
                }
                field("Return Shipment No."; Rec."Return Shipment No.")
                {
                }
                field("Return Shipment No. Series"; Rec."Return Shipment No. Series")
                {
                }
                field(Ship; Rec.Ship)
                {
                }
                field("Last Return Shipment No."; Rec."Last Return Shipment No.")
                {
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                }
                field("Assessee Code"; '')// Rec."Assessee Code") //pcpl-065
                {
                }
                field("Excise Bus. Posting Group"; '')// Rec."Excise Bus. Posting Group") //pcpl-065
                {
                }
                field("Amount to Vendor"; '')// Rec."Amount to Vendor")//pcpl-065
                {
                }
                field("Form Code"; '')// Rec."Form Code")//pcpl-065
                {
                }
                field("Form No."; '')// Rec."Form No.")//pcpl-065
                {
                }
                field("Transit Document"; '')// Rec."Transit Document")//pcpl-065
                {
                }
                field("LC No."; '')// Rec."LC No.")//pcpl-065
                {
                }
                field(State; Rec.State)
                {
                }
                field(Structure; '')// Rec.Structure)//pcpl-065
                {
                }
                field(Subcontracting; Rec.Subcontracting)
                {
                }
                field("Subcon. Order No."; '')// "Subcon. Order No.")//pcpl-065
                {
                }
                field("Subcon. Order Line No."; Rec."Subcon. Order Line No.")
                {
                }
                field(SubConPostLine; Rec.SubConPostLine)
                {
                }
                field("Vendor Shipment Date"; '')// Rec."Vendor Shipment Date")//pcpl-065
                {
                }
                field("C Form"; '')// Rec."C Form")//pcpl-065
                {
                }
                field("Consignment Note No."; '')// Rec."Consignment Note No.")//pcpl-065
                {
                }
                field("Declaration Form (GTA)"; '')// Rec."Declaration Form (GTA)")//pcpl-065
                {
                }
                field("Service Type (Rev. Chrg.)"; '')// Rec."Service Type (Rev. Chrg.)")//pcpl-065
                {
                }
                field("Manufacturer E.C.C. No."; '')// Rec."Manufacturer E.C.C. No.")//pcpl-065
                {
                }
                field("Manufacturer Name"; '')// Rec."Manufacturer Name")//pcpl-065
                {
                }
                field("Manufacturer Address"; '')// Rec."Manufacturer Address")//pcpl-065
                {
                }
                field(Trading; Rec.Trading)
                {
                }
                field("Transaction No. Serv. Tax"; '')// Rec."Transaction No. Serv. Tax")//pcpl-065
                {
                }
                field(CVD; '')// Rec.CVD)//pcpl-065
                {
                }
                field("Input Service Distribution"; '')// Rec."Input Service Distribution")//pcpl-065
                {
                }
                field("Service Tax Rounding Precision"; '')// Rec."Service Tax Rounding Precision")//pcpl-065
                {
                }
                field("Service Tax Rounding Type"; '')// Rec."Service Tax Rounding Type") //pcpl-065
                {
                }
                field(PoT; '')// Rec.PoT) //pcpl-065
                {
                }
                field("Nature of Supply"; Rec."Nature of Supply")
                {
                }
                field("Bill of Entry No."; Rec."Bill of Entry No.")
                {
                }
                field("Bill of Entry Date"; Rec."Bill of Entry Date")
                {
                }
                field("Bill of Entry Value"; Rec."Bill of Entry Value")
                {
                }
                field("GST Vendor Type"; Rec."GST Vendor Type")
                {
                    Editable = true;
                }
                field("Associated Enterprises"; Rec."Associated Enterprises")
                {
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                }
                field("GST Inv. Rounding Precision"; Rec."GST Inv. Rounding Precision")
                {
                }
                field("GST Inv. Rounding Type"; Rec."GST Inv. Rounding Type")
                {
                }
                field("GST Input Service Distribution"; Rec."GST Input Service Distribution")
                {
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

