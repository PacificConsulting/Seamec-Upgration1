pageextension 50001 PaymentTermsExt extends "Payment Terms"
{
    layout
    {
        addafter(Description)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}