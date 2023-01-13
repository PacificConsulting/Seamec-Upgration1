tableextension 50021 PurchInvHdrExt extends "Purch. Inv. Header"
{
    fields
    {
        field(50001; "Purchase Type"; Option)
        {
            OptionMembers = ,Vessel,Others;
            OptionCaption = ',Vessel,Others';
        }
        field(50006; "Vendor Shipment No."; Code[50])
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