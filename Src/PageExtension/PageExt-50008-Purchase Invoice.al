pageextension 50008 PurchaseInvExt extends "Purchase Invoice"
{
    layout
    {
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