tableextension 50034 AprvlEntryExt extends "Approval Entry"
{
    fields
    {
        field(50001; "Journal Template Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(50002; "Journal batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}