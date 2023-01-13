pageextension 50018 BankPaymentVoucherExt extends "Bank Payment Voucher"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Journal Template Name", Rec."Journal Template Name");
                RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Journal Batch Name", Rec."Journal Batch Name");
                RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Document No.", Rec."Document No.");
                IF NOT RecGenJnlNarration.FINDFIRST THEN
                    ERROR('Please enter the Voucher Narration');
            end;
        }
    }

    var
        myInt: Integer;
        RecGenJnlNarration: Record "Gen. Journal Narration";
}