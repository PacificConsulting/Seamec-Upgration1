xmlport 50055 ITems
{
    Caption = 'DMS Universal XMLport - www.dynms.com';
    DefaultFieldsValidation = true;
    Direction = Both;
    FieldDelimiter = '<>';
    Format = VariableText;
    TextEncoding = UTF16;

    schema
    {
        textelement(FileRoot)
        {
            tableelement(Item; Item)
            {
                XmlName = 'DummyTable';
                fieldelement(a; Item."No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(b; Item.Description)
                {
                }
                fieldelement(c; Item."Inventory Posting Group")
                {
                }
                fieldelement(d; Item."Costing Method")
                {
                }
                fieldelement(f; Item."VAT Prod. Posting Group")
                {
                }
                fieldelement(m; Item."Description 2")
                {
                }
                fieldelement(n; Item."Inventory Value Zero")
                {
                }
            }
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
        }

        actions
        {
            area(navigation)
            {
                group(Data)
                {
                    Caption = 'Data';
                    action("View Table Data")
                    {
                        Caption = 'View Table Data';
                        Image = "Table";
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;

                        trigger OnAction()
                        begin
                            // do nothing
                        end;
                    }
                }
            }
        }
    }

    trigger OnInitXmlPort()
    var
        lcNewLine: Char;
    begin
    end;

    trigger OnPostXmlPort()
    begin
        MESSAGE('Completed');
    end;

    var
        tcProgress: Label 'Filename #1\Table #2\Importing Record #3';
        tcComplete: Label 'Import complete.  %1 records imported in %2 seconds';
        tcFileDlgTitle: Label 'Verify Import File';
        tcFileFilter: Label 'Text Files|*.txt';
        tcTableID: Label 'dynamicsnav://%1:%2/%3/%4/runtable?table=%5';
        Text000: Label '%1 record(s) %2ed.';
}

