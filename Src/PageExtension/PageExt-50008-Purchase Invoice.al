pageextension 50008 PurchaseInvExt extends "Purchase Invoice"
{
    layout
    {
        addlast("Invoice Details")
        {
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = all;
            }

        }
        //PCPL-25/090323
        modify("Posting Description")
        {
            Visible = true;
        }
        //PCPL-25/090323
        addafter(Status)
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Invoice Receipt Date"; Rec."Invoice Receipt Date")
            {
                ApplicationArea = all;
                Caption = 'Invoice/Good Receipt Date';
            }
            //PCPL-25/090323
            field("Purchase Type"; Rec."Purchase Type")
            {
                ApplicationArea = All;
            }
            field("GRN No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
                Caption = 'GRN No.';
            }
            field("Purchase Order No."; Rec."Vendor Order No.")
            {
                ApplicationArea = All;
            }
            //PCPL-25/090323          

        }
        modify("Document Date")
        {
            Caption = 'Vendor Invoice Date';
        }
        // Add changes to page layout here
        modify("Assigned User ID") //pcpl-064 26dec2023
        {
            Editable = false;
        }
    }


    actions
    {
        addafter(SendApprovalRequest)
        {
            action("Update Maker")
            {
                Caption = 'Update Maker';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Image = Create;
                trigger OnAction()
                begin
                    rec.Validate("Assigned User ID", UserId);
                end;
            }
        }
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()

            begin
                if rec."Assigned User ID" = '' then
                    Error('Assigned User Id can not be Blank.Please Update Maker');
            end;
        }
        modify(Post)
        {
            Trigger OnBeforeAction()
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
        //PCPL-0070 01June23 <<
        modify(Statistics)
        {
            trigger OnBeforeAction()
            var
                PurchLine: Record "Purchase Line";
            begin
                GSTTDSAmountTotal(Rec, TotalTDSAmt);
                If TotalTDSAmt = 0 then begin
                    PurchLine.RESET;
                    PurchLine.SETRANGE("Document No.", Rec."No.");
                    IF PurchLine.FINDSET THEN
                        REPEAT
                            //IF PurchLine."TDS Reason Code" = '' THEN
                            IF (PurchLine."TDS Reason Code" = '') AND (PurchLine."TDS Section Code" = '') THEN     //PCPL-25/270723 above code comment
                                ERROR('Please Enter TDS Reason Code. Document No. %1 & Line No. %2', PurchLine."Document No.", PurchLine."Line No.");
                        UNTIL PurchLine.NEXT = 0;
                End;
            end;
        }
        //PCPL-0070 01June23 >>
    }
    procedure GSTTDSAmountTotal(
           PurchaseHeader: Record "Purchase Header";
           var TDSAmount: Decimal)
    var
        PurchaseLine: Record "Purchase Line";
        TDSEntityManagement: Codeunit "TDS Entity Management";
        i: Integer;
        RecordIDList: List of [RecordID];
    begin
        Clear(TDSAmount);

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                RecordIDList.Add(PurchaseLine.RecordId());
            until PurchaseLine.Next() = 0;

        for i := 1 to RecordIDList.Count() do
            TDSAmount += GetTDSAmount(RecordIDList.Get(i));

        TDSAmount := TDSEntityManagement.RoundTDSAmount(TDSAmount);
    end;

    local procedure GetTDSAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TDSSetup: Record "TDS Setup";
    begin
        if not TDSSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Amount);

        exit(TaxTransactionValue.Amount);
    end;

    var
        myInt: Integer;
        TotalTDSAmt: Decimal;
}