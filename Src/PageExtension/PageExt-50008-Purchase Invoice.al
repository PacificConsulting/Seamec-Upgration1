pageextension 50008 PurchaseInvExt extends "Purchase Invoice"
{
    layout
    {
        //PCPL-25/090323
        modify("Posting Description")
        {
            Visible = true;
        }
        //PCPL-25/090323
        addafter(Status)
        {
            field("Invoice Receipt Date"; Rec."Invoice Receipt Date")
            {
                ApplicationArea = all;
            }
            //PCPL-25/090323
            field("Purchase Type"; Rec."Purchase Type")
            {
                ApplicationArea = All;
            }
            field("GRN No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
            }
            field("Purchase Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = All;
            }
            //PCPL-25/090323          

        }
        // Add changes to page layout here
    }


    actions
    {
        modify(Post)
        {
            Trigger OnAfterAction()
            var
                recPurchComment: Record 43;
            Begin
                recPurchComment.RESET;
                recPurchComment.SETRANGE(recPurchComment."No.", rec."No.");
                IF recPurchComment.FINDFIRST THEN BEGIN
                    IF recPurchComment.Comment = '' THEN
                        ERROR('Narration for order is compulsory');
                END
                ELSE
                    ERROR('Narration for order is compulsory');

                Rec.TestField("Purchase Type");
                if Rec."Purchase Type" = Rec."Purchase Type"::Vessel then
                    Rec.TestField("Vendor Order No.");
            End;
        }

    }

    var
        myInt: Integer;
}