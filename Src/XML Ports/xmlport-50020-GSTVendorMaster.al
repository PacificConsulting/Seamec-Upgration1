xmlport 50020 GST_VendorMaster
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("<vend>"; Vendor)
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
                fieldattribute(GSTVendType; "<Vend>"."GST Vendor Type")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    Vendor.RESET;
                    Vendor.SETRANGE(Vendor."No.", No);
                    IF Vendor.FINDFIRST THEN BEGIN
                        Vendor.VALIDATE("GST Registration No.", GSTRegNo);
                        Vendor.VALIDATE(Vendor."GST Vendor Type", "<Vend>"."GST Vendor Type");
                        Vendor.MODIFY;
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
        Vendor: Record 23;
}

