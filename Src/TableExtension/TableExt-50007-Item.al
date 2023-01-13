tableextension 50007 ItemExt extends Item
{
    fields
    {
        field(50001; "Responsibility Center"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(50002; Tolerance; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}