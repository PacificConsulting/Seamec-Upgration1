xmlport 50000 "Narration Upload"
{
    Format = Xml;
    Caption = 'Narration Upload';

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Narration"; "Gen. Journal Narration")//16549
            {
                AutoSave = false;
                XmlName = 'IM';
                UseTemporary = true;
                textattribute(JournalTemname)
                {
                }
                textattribute(LineNo)
                {
                }
                textattribute(Narration)
                {
                }
                textattribute(DocumentNo)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    recGenJnlLine.INIT;
                    EVALUATE(recGenJnlLine."Line No.", LineNo);
                    recGenJnlLine.VALIDATE("Journal Template Name", 'JOURNAL VO');
                    recGenJnlLine.VALIDATE("Journal Batch Name", 'SALARY JV');
                    recGenJnlLine.VALIDATE(recGenJnlLine."Document No.", DocumentNo);
                    recGenJnlLine.Narration := Narration;
                    recGenJnlLine.INSERT;
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
        ExtDocNo: Code[50];
        cd_DocumentNo: Code[20];
        cd_newDocumentNo: Code[20];
        cu_NoSeriesMgt: Codeunit 396;
        rec_GenJnlBatch: Record 232;
        rec_GenJnlLine: Record "Gen. Journal Narration";//16549;
        rec_GenJnlTemplate: Record 80;
        dt_PostingDate: Date;
        TdsNature: Code[10];
        ICount: Integer;
        rec_DimensionValue: Record 349;
        ShortCutDim3: Code[10];
        JournalLineDimension: Record 356;
        ShortCutDim1: Code[20];
        ShortCutDim2: Code[20];
        Vendor: Record 23;
        vendRecGenJnlLine: Record 81;
        blnRecFound: Boolean;
        recGenJnlLine: Record "Gen. Journal Narration";//16549;
        intLine: Integer;
        decCreditAmt: Decimal;
        PD: Date;
        tempDimSetEntry: Record 480 temporary;
        recDimSetEntry: Record 480;
        decTDS: Decimal;
}

