xmlport 50000 "Narration Upload"
{
    //Format = Xml;
    //
    //PCPL-25/240323
    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ',';
    FormatEvaluate = Xml;
    //PCPL-25/240323
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
                    Occurrence = Required;
                }
                textattribute(DocumentNo)
                {
                }
                trigger OnBeforeInsertRecord()
                begin
                    rec_GenJnlLine.INIT;
                    EVALUATE(rec_GenJnlLine."Line No.", LineNo);
                    rec_GenJnlLine.VALIDATE("Journal Template Name", 'JOURNAL VO');
                    rec_GenJnlLine.VALIDATE("Journal Batch Name", 'SALARY JV');
                    rec_GenJnlLine.VALIDATE(rec_GenJnlLine."Document No.", DocumentNo);
                    rec_GenJnlLine.Narration := Narration;
                    //Evaluate(rec_GenJnlLine."Gen. Journal Line No.", LineNo);
                    rec_GenJnlLine.INSERT;
                    //Message('Hii');
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

