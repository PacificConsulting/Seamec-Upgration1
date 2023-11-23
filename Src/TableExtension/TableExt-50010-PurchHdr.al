tableextension 50010 PurchHdrExt extends "Purchase Header"
{
    fields
    {

        field(50001; "Purchase Type"; Option)
        {
            OptionMembers = ,Vessel,Others;
            OptionCaption = ' ,Vessel,Others';
        }
        field(50004; "User ID"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Rejected"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Receiving Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Invoice Receipt Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        modify("Shortcut Dimension 2 Code")
        {
            trigger OnBeforeValidate()
            begin
                /*
                IF "Shortcut Dimension 2 Code" <> '' THEN BEGIN
                    DimensionValue.RESET;
                    DimensionValue.SETRANGE(DimensionValue.Code, "Shortcut Dimension 2 Code");
                    IF DimensionValue.FINDFIRST THEN
                        VALIDATE("Shortcut Dimension 1 Code", DimensionValue."Assign Dimension Value");
                END
                ELSE
                    VALIDATE("Shortcut Dimension 1 Code", '');
                    */
            end;
        }
    }
    //PCPL-25/140723
    trigger OnAfterInsert()
    begin
        if "Order Date" <> 0D then begin
            Rec.Validate("Expected Receipt Date", CalcDate('<90D>', Rec."Order Date"));
        end;
    end;
    //PCPL-25/140723
    procedure CheckTDSLimit(DocNo: Code[20])
    var
        TotalTDSBaseAmt: Decimal;
        PurchLine: Record "Purchase Line";
    Begin
        /*
         TotalTDSBaseAmt := 0;
         PurchLine.RESET;
         PurchLine.SETRANGE(PurchLine."Document No.", DocNo);
         IF PurchLine.FIND('-') THEN
             REPEAT
                 TotalTDSBaseAmt += PurchLine."Total TDS Including SHE CESS";
             UNTIL PurchLine.NEXT = 0;
 */
    End;


    var
        myInt: Integer;
        DimensionValue: Record "Dimension Value";

}