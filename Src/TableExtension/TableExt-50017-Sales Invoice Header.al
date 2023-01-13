tableextension 50017 SalesInvHdrExt extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "Our Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(50002; "Contract Ref."; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Invoice Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Invoice Description 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Debit Note"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    procedure RoundGSTInvoicePrecision(GSTAmount: Decimal): Decimal
    var
        GSTRoundingDirection: Text[1];
        GSTRoundingPrecision: Decimal;
    begin
        /*
         IF GSTAmount = 0 THEN
             EXIT(0);
         CASE "GST Inv. Rounding Type" OF
             "GST Inv. Rounding Type"::Nearest:
                 GSTRoundingDirection := '=';
             "GST Inv. Rounding Type"::Up:
                 GSTRoundingDirection := '>';
             "GST Inv. Rounding Type"::Down:
                 GSTRoundingDirection := '<';
         END;
         GSTRoundingPrecision := "GST Inv. Rounding Precision";
         EXIT(GSTAmount);
         */
    end;

    var
        myInt: Integer;
}