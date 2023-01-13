pageextension 50007 SalesCrMemoExt extends "Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore(Post)
        {
            action("Credit Note")
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
                    //REPORT.RUN(50016,TRUE,FALSE,recSalesHeader);

                End;
            }
        }
    }

    var
        myInt: Integer;
}