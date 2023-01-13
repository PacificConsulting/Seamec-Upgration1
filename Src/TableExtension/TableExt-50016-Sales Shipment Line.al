tableextension 50016 SalesShipmentLineExt extends "Sales Shipment Line"
{
    fields
    {
        field(50001; "Line Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}