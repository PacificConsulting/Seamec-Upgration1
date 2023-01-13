table 50008 "Outbound Sync. Log Entry"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Destination Address"; Text[250])
        {
        }
        field(3; "Error Code"; Integer)
        {
        }
        field(4; "Error Description"; Text[250])
        {
        }
        field(5; "Process Status"; Option)
        {
            OptionCaption = ' ,Success,Created,Bad Request,Unauthorized,Forbidden,Not Found,Method Not Allowed,Conflict,Length Required,Precondition Failed,Too Many Requests,Internal Server Error,Service Unavailable';
            OptionMembers = " ",Success,Created,"Bad Request",Unauthorized,Forbidden,"Not Found","Method Not Allowed",Conflict,"Length Required","Precondition Failed","Too Many Requests","Internal Server Error","Service Unavailable";
        }
        field(6; "Message Payload"; BLOB)
        {
        }
        field(7; "Response Payload"; BLOB)
        {
        }
        field(8; "Creation Date Time"; DateTime)
        {
        }
        field(9; "Table ID"; Integer)
        {
        }
        field(10; "Record ID"; RecordID)
        {
        }
        field(11; Acknowledgement; Option)
        {
            OptionCaption = 'Pending,Completed';
            OptionMembers = Pending,Completed;
        }
        field(12; "Response Message"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    [Scope('Internal')]
    procedure GetMessagePayload(): Text
    var
        //TempBlob: Record TempBlob temporary; //pcpl-065
        CR: Text[1];
    begin
        CALCFIELDS("Message Payload");
        IF NOT "Message Payload".HASVALUE THEN
            EXIT('');

        CR[1] := 10;
        /* PCPL-0070 <<
        TempBlob.Blob := "Message Payload"; //pcpl-065
        EXIT(TempBlob.ReadAsText(CR, TEXTENCODING::UTF8)); // pcpl-065
        */ //PCPL-0070 >>
    end;

    [Scope('Internal')]
    procedure GetResponsePayload(): Text
    var
        /// TempBlob: Record TempBlob temporary;
        CR: Text[1];
    begin
        CALCFIELDS("Response Payload");
        IF NOT "Response Payload".HASVALUE THEN
            EXIT('');

        CR[1] := 10;
        /* PCPL-0070 <<
        TempBlob.Blob := "Response Payload"; //pcpl-065
        EXIT(TempBlob.ReadAsText(CR, TEXTENCODING::UTF8)); //pcpl-065
        */ //PCPL-0070 >>
    end;
}

