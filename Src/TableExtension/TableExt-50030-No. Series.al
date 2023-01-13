tableextension 50030 NoSeriesExt extends "No. Series"
{
    fields
    {
        field(50001; "Posting No.Serias"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}