pageextension 50031 ItemJournal extends "Item Journal"
{
    layout
    {
        // Add changes to page layout here
        modify(EntryType)
        {

            trigger OnAfterValidate()
            begin
                if (EntryType = EntryType::Sale) or (EntryType = EntryType::Purchase) then
                    Error('You can selct only "Positive Adjmt." or "Negative Adjmt." entry type');
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

}