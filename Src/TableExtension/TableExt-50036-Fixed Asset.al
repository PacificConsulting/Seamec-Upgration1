tableextension 50036 FixedAssetExt extends "Fixed Asset"
{
    fields
    {
        field(50001; "Purch/Sales Qty"; Decimal)
        {
            FieldClass = FlowField;
            //CaptionClass=Sum("FA Ledger Entry".Field4607192 WHERE ("FA No."=FIELD("No.")));
        }
    }

    var
        myInt: Integer;
}