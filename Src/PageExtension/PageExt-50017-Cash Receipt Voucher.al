pageextension 50017 CashReceiptVoucherExt extends "Cash Receipt Voucher"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Test Report")
        {
            action(TestReport)
            {
                Caption = 'Test Report';
                ApplicationArea = All;
                Ellipsis = true;
                Image = TestReport;
                trigger OnAction()
                begin
                    Rec.TESTFIELD("Document Type");
                    RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Journal Template Name", Rec."Journal Template Name");
                    RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Journal Batch Name", Rec."Journal Batch Name");
                    RecGenJnlNarration.SETRANGE(RecGenJnlNarration."Document No.", Rec."Document No.");
                    IF NOT RecGenJnlNarration.FINDFIRST THEN
                        ERROR('Please enter the Voucher Narration');

                    IF Rec."Document No." <> '' THEN BEGIN
                        IF (Rec.Status = Rec.Status::"Pending Approval") OR (Rec.Status = Rec.Status::Open) THEN
                            ERROR('Document %1 must be approved and released before you can perform this action.', Rec."Document No.")
                        ELSE begin
                            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", Rec);
                            CurrentJnlBatchName := Rec.GETRANGEMAX("Journal Batch Name");
                            CurrPage.UPDATE(FALSE);
                        END;
                    END;
                end;
            }
        }
    }

    var
        myInt: Integer;
        RecGenJnlNarration: Record "Gen. Journal Narration";
        CurrentJnlBatchName: Code[10];
}