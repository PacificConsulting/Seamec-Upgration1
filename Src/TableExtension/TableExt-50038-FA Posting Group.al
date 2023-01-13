tableextension 50038 FAPostingGroupExt extends "FA Posting Group"
{
    fields
    {
        field(50001; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}