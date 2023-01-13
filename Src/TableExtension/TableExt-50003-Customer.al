tableextension 50003 CustomerExt1 extends Customer
{
    fields
    {
        field(50001; "Our Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
    }
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

    var
        myInt: Integer;
        LengthErr: Label 'The Length of the PAN No. must be 10.';
        OnlyNumericErr: Label 'Only Numeric is allowed in the position %1.';
        OnlyAlphabetErr: Label 'Only Alphabet is allowed in the position %1.';

}