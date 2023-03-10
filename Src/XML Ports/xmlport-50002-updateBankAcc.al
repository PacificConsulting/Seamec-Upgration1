xmlport 50002 "update BankAcc"
{
    Format = VariableText;
    Permissions = TableData 271 = rim;

    schema
    {
        textelement(root)
        {
            tableelement("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                AutoSave = false;
                XmlName = 'banckaccledger';
                textelement(DocuNo)
                {
                }
                textelement(cleardate)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    //IF "Bank Account Ledger Entry"."Document No."
                    "Bank Account Ledger Entry".SETRANGE("Document No.", DocuNo);
                    IF "Bank Account Ledger Entry".FINDFIRST THEN BEGIN
                        REPEAT
                            IF "Bank Account Ledger Entry"."Clearing Date" = 0D THEN BEGIN
                                //currXMLport.SKIP;
                                EVALUATE(clearingDate, cleardate);
                                "Bank Account Ledger Entry"."Clearing Date" := clearingDate;
                                "Bank Account Ledger Entry".MODIFY;
                            END;
                        UNTIL "Bank Account Ledger Entry".NEXT = 0;
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

    var
        clearingDate: Date;
}

