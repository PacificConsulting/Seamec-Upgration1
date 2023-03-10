xmlport 50026 "Bank Payment RTGS NEFT"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                AutoSave = false;
                XmlName = 'IM';
                UseTemporary = true;
                textattribute(PostingDate)
                {
                }
                textattribute(PartyCode)
                {
                }
                textattribute(DebitAmt)
                {
                }
                textattribute(ShortDim1)
                {
                }
                textattribute(ShortDim2)
                {
                }
                textattribute(Batchname)
                {
                }
                textattribute(bankaccount)
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    COMMIT;
                    cd_DocumentNo := '';
                    rec_GenJnlBatch.RESET;
                    rec_GenJnlBatch.SETRANGE("Journal Template Name", 'BANKPAYMT');
                    rec_GenJnlBatch.SETRANGE(Name, Batchname);
                    IF rec_GenJnlBatch.FINDFIRST THEN BEGIN
                        IF rec_GenJnlBatch."No. Series" <> '' THEN BEGIN
                            CLEAR(cu_NoSeriesMgt);
                            cd_DocumentNo := cu_NoSeriesMgt.TryGetNextNo(rec_GenJnlBatch."No. Series", rec_GenJnlLine."Posting Date");
                        END;
                    END;


                    rec_GenJnlLine.RESET;
                    rec_GenJnlLine.SETRANGE("Journal Template Name", 'BANKPAYMT');
                    rec_GenJnlLine.SETRANGE("Journal Batch Name", Batchname);
                    IF rec_GenJnlLine.FINDLAST THEN
                        intLine := rec_GenJnlLine."Line No.";
                    recGenJnlLine.INIT;
                    recGenJnlLine.VALIDATE("Journal Template Name", 'BANKPAYMT');
                    recGenJnlLine.VALIDATE("Journal Batch Name", Batchname); //Avinash)
                    recGenJnlLine.VALIDATE("Document No.", cd_DocumentNo);
                    recGenJnlLine.VALIDATE("Source Code", 'BANKPYMTV');

                    recGenJnlLine."Line No." := intLine + 10000;
                    recGenJnlLine."External Document No." := cd_DocumentNo;
                    recGenJnlLine.INSERT;

                    ICount := ICount + 1;
                    ShortCutDim1 := ShortDim1;
                    ShortCutDim2 := ShortDim2;

                    EVALUATE(decDebitAmt, DebitAmt);
                    IF decDebitAmt <> 0 THEN
                        recGenJnlLine.VALIDATE("Debit Amount", decDebitAmt);

                    //VALIDATE("Party Code");


                    // Anupam Start
                    Vendor.RESET;
                    recGenJnlLine.VALIDATE("Party Type", recGenJnlLine."Party Type"::Vendor);  //pcpl code uncommented
                    recGenJnlLine.VALIDATE("Account Type", recGenJnlLine."Account Type"::Vendor);
                    recGenJnlLine.VALIDATE("Document Type", recGenJnlLine."Document Type"::Payment);
                    recGenJnlLine.VALIDATE("Bal. Account Type", recGenJnlLine."Bal. Account Type"::"Bank Account");
                    recGenJnlLine.VALIDATE("Party Code", PartyCode);
                    recGenJnlLine.VALIDATE("Bal. Account No.", bankaccount);
                    EVALUATE(PD, PostingDate);
                    recGenJnlLine.VALIDATE("Posting Date", PD);
                    recGenJnlLine.Description := Vendor.Name;
                    recGenJnlLine."Posting Group" := Vendor."Vendor Posting Group";
                    recGenJnlLine."Salespers./Purch. Code" := Vendor."Purchaser Code";
                    recGenJnlLine."Payment Terms Code" := Vendor."Payment Terms Code";
                    recGenJnlLine.VALIDATE("Payment Terms Code");

                    //recGenJnlLine.VALIDATE("Bill-to/Pay-to No.",AccNo);
                    //recGenJnlLine.VALIDATE("Sell-to/Buy-from No.",AccNo);
                    recGenJnlLine.VALIDATE("Currency Code", Vendor."Currency Code");

                    recGenJnlLine."Gen. Posting Type" := 0;
                    recGenJnlLine."Gen. Bus. Posting Group" := '';
                    recGenJnlLine."Gen. Prod. Posting Group" := '';
                    recGenJnlLine."VAT Bus. Posting Group" := '';
                    recGenJnlLine."VAT Prod. Posting Group" := '';
                    //EVALUATE(decTDS,TDSTCSAmt);
                    //recGenJnlLine.VALIDATE("TDS/TCS Amount",decTDS);
                    // recGenJnlLine."TDS Nature of Deduction" := TdsNature; //PCPL-065
                    // recGenJnlLine.VALIDATE("TDS Nature of Deduction");//PCPL-065
                    recGenJnlLine.VALIDATE("Shortcut Dimension 1 Code", ShortCutDim1);
                    recGenJnlLine.VALIDATE("Shortcut Dimension 2 Code", ShortCutDim2);
                    tempDimSetEntry.DELETEALL;
                    tempDimSetEntry.INIT;
                    tempDimSetEntry.VALIDATE("Dimension Code", 'COSTCENTRE');
                    tempDimSetEntry.VALIDATE("Dimension Value Code", ShortDim1);
                    tempDimSetEntry.INSERT;
                    tempDimSetEntry.INIT;
                    tempDimSetEntry.VALIDATE("Dimension Code", 'PROJECT');
                    tempDimSetEntry.VALIDATE("Dimension Value Code", ShortDim2);
                    tempDimSetEntry.INSERT;
                    tempDimSetEntry.INIT;
                    tempDimSetEntry.VALIDATE("Dimension Code", 'EMPLOYEE');
                    //tempDimSetEntry.VALIDATE("Dimension Value Code",ShortDim3);
                    tempDimSetEntry.INSERT;
                    recGenJnlLine."Dimension Set ID" := recDimSetEntry.GetDimensionSetID(tempDimSetEntry);
                    recGenJnlLine.MODIFY;
                    cd_DocumentNo := INCSTR(cd_DocumentNo);
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

    trigger OnPreXmlPort()
    begin
        rec_GenJnlLine.RESET;
        rec_GenJnlLine.SETRANGE("Journal Template Name", 'JOURNAL VO');
        rec_GenJnlLine.SETRANGE("Journal Batch Name", 'SALARY JV');
        rec_GenJnlLine.SETFILTER(Amount, '%1', 0);
        IF rec_GenJnlLine.FINDLAST THEN
            rec_GenJnlBatch.SETRANGE("Journal Template Name", 'JOURNAL VO');
        rec_GenJnlBatch.SETRANGE(Name, 'SALARY JV');
        IF rec_GenJnlBatch.FINDFIRST THEN BEGIN
            IF rec_GenJnlBatch."No. Series" <> '' THEN BEGIN
                CLEAR(cu_NoSeriesMgt);
                cd_DocumentNo := cu_NoSeriesMgt.GetNextNo(rec_GenJnlBatch."No. Series", rec_GenJnlLine."Posting Date", FALSE);
            END;
        END;
    end;

    var
        ExtDocNo: Code[50];
        cd_DocumentNo: Code[20];
        cd_newDocumentNo: Code[20];
        cu_NoSeriesMgt: Codeunit 396;
        rec_GenJnlBatch: Record 232;
        rec_GenJnlLine: Record 81;
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
        recGenJnlLine: Record 81;
        intLine: Integer;
        decCreditAmt: Decimal;
        PD: Date;
        tempDimSetEntry: Record 480 temporary;
        recDimSetEntry: Record 480;
        decTDS: Decimal;
        decDebitAmt: Decimal;
}

