tableextension 50042 PaymentTermExt extends "Payment Terms"
{
    fields
    {
        field(50001; Type; Option)
        {
            OptionMembers = ,Pay,SHIP,FRTR;
            OptionCaption = ' ,Pay,SHIP,FRTR';
        }
    }

    var
        myInt: Integer;
}