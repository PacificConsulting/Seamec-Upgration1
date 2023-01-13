tableextension 50035 JobPlanningLineExt extends "Job Planning Line"
{
    fields
    {
        field(50001; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Starting Time"; Time)
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
            InitValue = "12:00:00 AM";
        }
        field(50003; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Ending Time"; Time)
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
            InitValue = "11:59:59 PM";
        }
        field(50005; "No. Of Days"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50006; "Line Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
    // /myInt: Integer;
}