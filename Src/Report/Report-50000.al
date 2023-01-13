report 50000 "50000"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/50000.rdl';

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        IF Item.FINDSET THEN
            REPEAT
                IF Item."Base Unit of Measure" = '' THEN BEGIN
                    Item."Base Unit of Measure" := 'EA';
                    Item.MODIFY;
                END;
            UNTIL Item.NEXT = 0;
        MESSAGE('Done');
    end;

    var
        Item: Record 27;
}

