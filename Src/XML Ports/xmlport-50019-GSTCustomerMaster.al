xmlport 50019 GST_CustomerMaster
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("<cust>"; Customer)
            {
                AutoSave = false;
                XmlName = 'IM';
                UseTemporary = true;
                textattribute(No)
                {
                }
                textattribute(GSTRegNo)
                {
                }
                fieldattribute(GSTCustTYpe; "<Cust>"."GST Customer Type")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    Customer.RESET;
                    Customer.SETRANGE(Customer."No.", No);
                    IF Customer.FINDFIRST THEN BEGIN
                        Customer.VALIDATE("GST Registration No.", GSTRegNo);
                        Customer.VALIDATE("GST Customer Type", "<Cust>"."GST Customer Type");
                        Customer.MODIFY;
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
        Customer: Record 18;
        GSTCustmType: Option " ",Registered,Unregistered,Export,"Deemed Export",Exempted;
}

