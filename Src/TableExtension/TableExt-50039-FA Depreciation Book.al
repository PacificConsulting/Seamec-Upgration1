tableextension 50039 FADepreciationBookExt extends "FA Depreciation Book"
{
    fields
    {
        field(50001; "Ready To Use Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ("Last Depreciation Date" > 0D) or
                         ("Last Write-Down Date" > 0D) or
                         ("Last Appreciation Date" > 0D) or
                         ("Last Custom 1 Date" > 0D) or
                         ("Last Custom 2 Date" > 0D) or
                         ("Disposal Date" > 0D)
                      then begin
                    DeprBook.Get("Depreciation Book Code");
                    DeprBook.TestField("Allow Changes in Depr. Fields", true);
                end;
            end;
        }
    }

    var
        myInt: Integer;
}