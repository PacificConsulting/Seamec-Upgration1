tableextension 50005 VendorExt1 extends Vendor
{
    fields
    {
        field(50006; MSME; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "MSME No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Vendor Type"; Option)
        {

            OptionMembers = ,"Import","Local","One Time vendor","Crew";
            OptionCaption = ',Import,Local,One Time Vendor,Crew';
        }
        modify("P.A.N. No.")
        {
            trigger OnAfterValidate()
            var
                VendorRec: Record Vendor;
            Begin
                IF ("GST Registration No." <> '') AND ("P.A.N. No." <> COPYSTR("GST Registration No.", 3, 10)) THEN
                    ERROR('From postion 3 to 12 in GST Registration No. should be same as it is in PAN No. so delete and then update it.');
                CheckGSTRegBlankInRef;
                IF "P.A.N. No." <> xRec."P.A.N. No." THEN
                    IF GUIALLOWED THEN BEGIN
                        VendorRec.RESET;
                        VendorRec.SETRANGE(VendorRec."P.A.N. No.", "P.A.N. No.");
                        VendorRec.SETFILTER("No.", '<>%1', "No.");    //OA.SM1.0.0.0
                        IF VendorRec.FIND('-') THEN
                            MESSAGE('The PAN No. %1 is already used by Vendor No. %2.', "P.A.N. No.", VendorRec."No.");
                    END;
            end;
        }

        // modify("No.")
        // {
        //     trigger OnAfterValidate()
        //     var
        //         myInt: Integer;
        //         Vendor: Record Vendor;
        //     begin
        //         Message('hi');
        //         NoText := CopyStr(Rec."No.", 1, 3);
        //         if NoText = 'SCI' then
        //             Rec."Vendor Type" := Rec."Vendor Type"::Import
        //         else
        //             if NoText = 'SCL' then
        //                 Rec."Vendor Type" := rec."Vendor Type"::Local;
        //         Rec.Modify();
        //     end;
        // }

    }// Add changes to table fields here
    trigger OnInsert()
    var
        myInt: Integer;
        Vendor: Record Vendor;
    begin
        // Message('hi');

        NoText := CopyStr(Rec."No.", 1, 3);
        // Message(NoText);
        if NoText = 'SCI' then
            Rec."Vendor Type" := Rec."Vendor Type"::Import
        else
            if NoText = 'SCL' then
                Rec."Vendor Type" := rec."Vendor Type"::Local;
        Message(Format("Vendor Type"));

        //PCPL-064 21feb2023<<
        /*
         TestField(Name);
         TestField(Address);
         TestField("Address 2");
         TestField("E-Mail");
         TestField("Phone No.");
         TestField("Gen. Bus. Posting Group");
         TestField("GST Vendor Type");
         TestField("P.A.N. No.");
         if (rec."GST Vendor Type" = rec."GST Vendor Type"::Registered) then
             TestField("GST Registration No.");

         TestField(MSME);
         TestField("MSME No.");
         //PCPL-064 21feb2023<<

         // Rec.Modify();
         */
    end;

    trigger OnAfterInsert()
    var
        myInt: Integer;
    begin

    end;


    procedure CheckPanNo(PanNo: Code[10])
    var
        Position: Integer;
    begin
        IF PanNo = '' THEN
            EXIT;
        IF STRLEN(PanNo) <> 10 THEN
            ERROR(LengthErr);

        FOR Position := 1 TO 10 DO
            CASE Position OF
                1 .. 5, 10:
                    CheckIsAlphabet(PanNo, Position);
                6 .. 9:
                    CheckIsNumeric(PanNo, Position);
            END;
    end;

    local procedure CheckIsAlphabet(PANNo: Code[10]; Position: integer)
    var
    Begin
        IF NOT (COPYSTR(PanNo, Position, 1) IN ['A' .. 'Z']) THEN
            ERROR(OnlyAlphabetErr, Position);
    End;

    local procedure CheckIsNumeric(PANNo: Code[10]; Position: integer)
    var
    Begin
        IF NOT (COPYSTR(PanNo, Position, 1) IN ['0' .. '9']) THEN
            ERROR(OnlyNumericErr, Position);
    End;

    local procedure CheckGSTRegBlankInRef()
    begin
        OrderAddress.SETRANGE("Vendor No.", "No.");
        OrderAddress.SETFILTER("GST Registration No.", '<>%1', '');
        IF OrderAddress.FINDSET THEN
            REPEAT
                IF "P.A.N. No." <> COPYSTR(OrderAddress."GST Registration No.", 3, 10) THEN
                    ERROR('Please update GST Registration No. to blank in the record %1 from Order Address.', OrderAddress.Code);
            UNTIL OrderAddress.NEXT = 0;
    end;

    var
        myInt: Integer;
        LengthErr: Label 'The Length of the PAN No. must be 10.';
        OnlyNumericErr: Label 'Only Numeric is allowed in the position %1.';
        OnlyAlphabetErr: Label 'Only Alphabet is allowed in the position %1.';
        OrderAddress: Record "Order Address";
        NoText: Text[5];


}