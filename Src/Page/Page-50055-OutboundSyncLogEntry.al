page 50055 "Outbound Sync. Log Entry"
{
    Caption = 'Outbound Sync. Log Entry';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Outbound Sync. Log Entry";
    ApplicationArea = All;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Destination Address"; Rec."Destination Address")
                {
                }
                field("Error Code"; Rec."Error Code")
                {
                }
                field("Error Description"; Rec."Error Description")
                {
                }
                field("Process Status"; Rec."Process Status")
                {
                }
                field("Response Message"; Rec."Response Message")
                {
                }
                field("Request Payload"; RequestPayload)
                {
                }
                field(Response; Response)
                {
                }
                field("Creation Date Time"; Rec."Creation Date Time")
                {
                }
                field("Table ID"; Rec."Table ID")
                {
                }
                field("Record ID"; Rec."Record ID")
                {
                }
                field(Acknowledgement; Rec.Acknowledgement)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        RequestPayload := '';// GetMessagePayload; //pcpl-065
        Response := '';//GetResponsePayload;    //pcpl-065
    end;

    var
        RequestPayload: Text;
        Response: Text;
}

