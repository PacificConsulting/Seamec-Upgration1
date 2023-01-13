pageextension 50012 PurchaseJournalExt extends "Purchase Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Apply Entries")
        {
            action("Send Approval Request")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //IF approval.SendGenlineApprovalRequest(Rec) THEN; >> NAV 16
                    // approval.TrySendJournalLineApprovalRequests(Rec); >> After Change
                end;
            }
            action("Cancel Approval Reauest")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    //IF approval.CancelGenlineApprovalRequest(Rec,TRUE,TRUE) THEN; >> NAV 16
                    //approval.OnCancelGeneralJournalLineApprovalRequest(Rec); >> After Change
                end;
            }
            action("Self Approval")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecUserSetup: Record "User Setup";
                    Genline: Record 81;
                begin
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Self Approver" THEN BEGIN
                        Genline.RESET;
                        Genline.SETRANGE(Genline."Document No.", Rec."Document No.");
                        IF Genline.FINDSET THEN
                            REPEAT
                                Genline."Self Approved" := TRUE;
                                Genline.Status := Genline.Status::Approved;
                                Genline.MODIFY;
                            UNTIL Genline.NEXT = 0;
                    END ELSE
                        ERROR('You are not authorised for Self Approval.');
                end;
            }
        }
    }

    var
        myInt: Integer;
        approval: Codeunit "Approvals Mgmt.";
}