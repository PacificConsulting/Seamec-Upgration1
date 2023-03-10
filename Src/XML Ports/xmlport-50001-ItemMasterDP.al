xmlport 50001 ItemMasterDP
{
    FieldDelimiter = '<">';
    FieldSeparator = ',';
    Format = VariableText;

    schema
    {
        textelement("<root>")
        {
            XmlName = 'Root';
            tableelement("Item Unit of Measure"; "Item Unit of Measure")
            {
                XmlName = 'Item';
                fieldelement(aa; "Item Unit of Measure"."Item No.")
                {
                }
                fieldelement(aaa; "Item Unit of Measure".Code)
                {
                }
            }
        }
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

    trigger OnPostXmlPort()
    begin
        MESSAGE('Done');
    end;
}

