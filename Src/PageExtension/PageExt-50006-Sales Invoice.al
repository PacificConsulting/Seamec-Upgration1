pageextension 50006 SalesInvExt extends "Sales Invoice"
{
    layout
    {
        addafter(Status)
        {
            field("Our Bank Account No."; Rec."Our Bank Account No.")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        modify(Post)
        {
            Caption = 'Post';
            trigger OnBeforeAction()
            begin
                Rec.TestField("Our Bank Account No.");
                Rec.TestField("Salesperson Code");
            end;
        }
        addafter(Preview)
        {
            action("Invoice for Approval")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    recSalesHeader: Record 36;
                begin
                    recSalesHeader.RESET;
                    recSalesHeader.COPY(Rec);
                    recSalesHeader.SETRANGE("Document Type", recSalesHeader."Document Type");
                    recSalesHeader.SETRANGE("No.", recSalesHeader."No.");
                    //REPORT.RUN(50001,TRUE,FALSE,recSalesHeader);
                end;
            }
            action("Details of Invoice of chapter")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    recSalesHeader: Record 36;
                Begin
                    recSalesHeader.RESET;
                    recSalesHeader.COPY(Rec);
                    recSalesHeader.SETRANGE("Document Type", recSalesHeader."Document Type");
                    recSalesHeader.SETRANGE("No.", recSalesHeader."No.");
                    //REPORT.RUN(50003,TRUE,FALSE,recSalesHeader);
                End;
            }
            action("Details of Invoice of Others")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    recSalesHeader: Record 36;
                Begin
                    recSalesHeader.RESET;
                    recSalesHeader.COPY(Rec);
                    recSalesHeader.SETRANGE("Document Type", recSalesHeader."Document Type");
                    recSalesHeader.SETRANGE("No.", recSalesHeader."No.");
                    //REPORT.RUN(50004,TRUE,FALSE,recSalesHeader);
                End;
            }
        }
    }

    var
        myInt: Integer;
}