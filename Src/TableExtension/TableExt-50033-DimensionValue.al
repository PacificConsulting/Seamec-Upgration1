tableextension 50033 DimensionValueExt extends "Dimension Value"
{
    fields
    {
        field(50001; "Group Dimension Link Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }
        field(50002; "Group Dimension Link Value"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("Group Dimension Link Code"));
        }
        field(50003; "No Of Working Days"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Assign Dimension Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50005; "Assign Dimension Value"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            begin
                DimensionValue.RESET;
                DimensionValue.SETRANGE(DimensionValue."Dimension Code", "Assign Dimension Code");
                IF DimensionValue.FINDFIRST THEN BEGIN
                    IF PAGE.RUNMODAL(537, DimensionValue) = ACTION::LookupOK THEN
                        "Assign Dimension Value" := DimensionValue.Code;
                END;
            end;
        }
    }

    var
        myInt: Record 352;
        DimensionValue: Record "Dimension Value";
}