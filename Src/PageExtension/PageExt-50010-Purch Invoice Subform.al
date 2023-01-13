pageextension 50010 PurchInvSubfromExt extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("Line No.")
        {
            field("TDS Reason Code"; Rec."TDS Reason Code")
            {
                ApplicationArea = All;
                //Editable = fieldeditable;
            }
        }
    }
    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetCurrRecord()
    Begin
        // IF Rec."TDS Nature of Deduction" = '' THEN BEGIN
        //     fieldeditable := TRUE
        // END ELSE
        //     fieldeditable := FALSE;
    End;

    var
        myInt: Integer;
        fieldeditable: Boolean;
}