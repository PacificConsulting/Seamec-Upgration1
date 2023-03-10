xmlport 50018 "GST Item Master Upload"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                AutoSave = false;
                XmlName = 'IM';
                UseTemporary = true;
                textattribute(No)
                {
                }
                textattribute(GST)
                {
                }
                textattribute(GSTCREDIT)
                {
                }
                textattribute(HSN)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    /*
                    IF RecPSI.GET(No) THEN BEGIN
                       EVALUATE(RecPSI."Actual Freight Amount",Amt);
                       EVALUATE(RecPSI."Freight Invoice Date",Date1);
                       EVALUATE(RecPSI."Freight Invoice No",InvocieNo);
                       RecPSI.MODIFY(TRUE);
                    END;
                    */
                    Item1.RESET;
                    Item1.SETRANGE(Item1."No.", No);
                    IF Item1.FINDFIRST THEN BEGIN
                        Item1.VALIDATE(Item1."GST Group Code", GST);
                        Item1."GST Credit" := GSTCREDIT1;
                        Item1.VALIDATE(Item1."HSN/SAC Code", HSN);
                        Item1.MODIFY;
                    END;

                end;
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
        MESSAGE('Data Updated Successfully');
    end;

    var
        Item1: Record 27;
        GSTCREDIT1: Option Availment,"NON-Availment";
}

