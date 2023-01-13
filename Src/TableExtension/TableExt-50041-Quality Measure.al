tableextension 50041 QualityMeasureExt extends "Quality Measure"
{
    fields
    {
        field(50001; "Unit of Measure"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50002; URL; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}