reportextension 50000 "Posted Voucher Ext" extends "Posted Voucher"
{
    //PCPL-064 
    RDLCLayout = './rdlc/PostedVoucher.rdl';
    dataset
    {

        add("G/L Entry")
        {
            column(SalesComment; SalesComment)
            {

            }
            column(PurchComm; PurchComment)
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(ProjectCode; ProjectCode)
            {

            }
            column(CostCentre; CostCentre)
            {

            }
            column(Reason_Code; "Reason Code")
            {

            }
            column(CommentCaption; CommentCaption)
            {

            }

        }

        modify("G/L Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                SIH: Record "Sales Invoice Header";
                PIH: Record "Purch. Inv. Header";
                SalesComm: Record "Sales Comment Line";
                PurchComm: Record "Purch. Comment Line";

            begin
                clear(SalesComment);
                Clear(PurchComment);
                IF SIH.get("G/L Entry"."Document No.") then begin
                    SalesComm.Reset();
                    SalesComm.SetRange("No.", SIH."No.");
                    IF SalesComm.FindSet() then
                        repeat
                            SalesComment += SalesComment + SalesComm.Comment;
                        until SalesComm.Next() = 0;
                end;
                //Else
                IF PIH.get("G/L Entry"."Document No.") then begin
                    PurchComm.Reset();
                    PurchComm.SetRange("No.", PIH."No.");
                    IF PurchComm.FindSet() then
                        repeat
                            PurchComment += PurchComment + ' ' + PurchComm.Comment;
                        until PurchComm.Next() = 0;

                    IF (PurchComment <> '') OR (SalesComment <> '') then
                        CommentCaption := 'Comment';

                    // ProjectCode := "Global Dimension 2 Code";
                    // CostCentre := "Global Dimension 1 Code";
                end;
                //Message(PurchComment);
            end;



        }

    }


    requestpage
    {
        // Add changes to the requestpage here
    }
    // trigger OnPostReport()
    // begin
    //     Message(PurchComment);
    // end;


    var
        SalesComment: Text;
        PurchComment: text;
        ProjectCode: Code[20];
        CostCentre: Code[30];
        CommentCaption: Text;
}