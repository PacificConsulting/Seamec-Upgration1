tableextension 50012 GenJnlLineExt extends "Gen. Journal Line"
{
    fields
    {
        field(50001; "Vendor Bank Account"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Account No."));
        }
        field(50002; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,"Pending Prepayment";
            OptionCaption = 'Open,"Pending Approval",Approved,"Pending Prepayment"';
            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(50003; "Self Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Entry Type"; Option)
        {
            OptionMembers = ,Check,Transfer;
            OptionCaption = ',Check,Transfer';
        }
        field(50005; "Salary Transaction"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Manual Entry"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; Narration; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }
    procedure CalculateTDS()
    Begin
    End;

    var
        myInt: Integer;
}