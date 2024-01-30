page 50201 "Modify Voucher Narration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Gen. Journal Narration";

    layout
    {
        area(Content)
        {
            repeater(Control001)
            {
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("New")
            {
                action("Deleted")
                {
                    Caption = 'Deleted';
                    ApplicationArea = all;
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;
                    trigger OnAction()
                    begin
                        GenJourNarr.Reset();
                        GenJourNarr.SetRange("Journal Template Name", 'JOURNAL VO');
                        GenJourNarr.SetRange("Journal Batch Name", 'SALARY JV');
                        // GenJourNarr.SetRange("Document No.", 'SALJV/2324/03505');
                        if GenJourNarr.FindSet() then begin
                            GenJourNarr.DeleteAll();
                        end;
                    end;
                }

            }
        }
    }

    var
        myInt: Integer;
        GenJourNarr: Record "Gen. Journal Narration";
}