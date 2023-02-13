tableextension 50015 SalesShipmentHdrExt extends "Sales Shipment Header"
{
    fields
    {
        field(50005; "Debit Note"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}