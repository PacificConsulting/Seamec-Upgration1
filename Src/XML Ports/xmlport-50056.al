// xmlport 50056 "Salary Upload 1"
// {
//     Format = VariableText;

//     schema
//     {
//         textelement(Root)
//         {
//             tableelement("Gen. Journal Line"; "Gen. Journal Line")
//             {
//                 AutoSave = false;
//                 XmlName = 'IM';
//                 UseTemporary = true;
//                 textattribute(PostingDate)
//                 {
//                 }
//                 textattribute(PartType)
//                 {
//                 }
//                 textattribute(PartyCode)
//                 {
//                 }
//                 textattribute(Accounttype)
//                 {
//                 }
//                 textattribute(AccNo)
//                 {
//                 }
//                 textattribute(CreditAmt)
//                 {
//                 }
//                 textattribute(TDSTCSAmt)
//                 {
//                 }
//                 textattribute(BalAccNo)
//                 {
//                 }
//                 textattribute(TDSNature11)
//                 {
//                 }
//                 textattribute(ShortDim1)
//                 {
//                 }
//                 textattribute(ShortDim2)
//                 {
//                 }
//                 textattribute(ShortDim3)
//                 {
//                 }

//                 trigger OnBeforeInsertRecord()
//                 begin
//                     rec_GenJnlLine.RESET;
//                     rec_GenJnlLine.SETRANGE("Journal Template Name", 'JOURNAL VO');
//                     rec_GenJnlLine.SETRANGE("Journal Batch Name", 'SALARY JV');
//                     IF rec_GenJnlLine.FINDLAST THEN
//                         intLine := rec_GenJnlLine."Line No.";

//                     recGenJnlLine.INIT;
//                     recGenJnlLine.VALIDATE("Journal Template Name", 'JOURNAL VO');
//                     recGenJnlLine.VALIDATE("Journal Batch Name", 'SALARY JV'); //Avinash)
//                     recGenJnlLine.VALIDATE("Document No.", cd_DocumentNo);
//                     recGenJnlLine.VALIDATE("Source Code", 'JOURNALV');
//                     recGenJnlLine.VALIDATE("Document Type", "Gen. Journal Line"."Document Type"::Invoice);
//                     recGenJnlLine.VALIDATE("Account Type", "Gen. Journal Line"."Account Type"::Vendor);
//                     recGenJnlLine.VALIDATE("Bal. Account Type", "Gen. Journal Line"."Bal. Account Type"::"G/L Account");
//                     recGenJnlLine.VALIDATE("Bal. Gen. Posting Type", "Gen. Journal Line"."Bal. Gen. Posting Type"::Purchase);
//                     recGenJnlLine."Salary Transaction" := TRUE;
//                     recGenJnlLine."Line No." := intLine + 10000;
//                     recGenJnlLine."External Document No." := cd_DocumentNo;
//                     recGenJnlLine.INSERT;

//                     ICount := ICount + 1;
//                     TdsNature := TDSNature11;
//                     ShortCutDim1 := ShortDim1;
//                     ShortCutDim2 := ShortDim2;
//                     EVALUATE(decCreditAmt, CreditAmt);
//                     IF decCreditAmt <> 0 THEN
//                         recGenJnlLine.VALIDATE("Credit Amount", decCreditAmt);

//                     Vendor.RESET;
//                     Vendor.GET(PartyCode);
//                     recGenJnlLine.VALIDATE("Party Type", recGenJnlLine."Party Type"::Vendor);  //pcpl code uncommented
//                     recGenJnlLine.VALIDATE("Party Code", PartyCode);
//                     EVALUATE(PD, PostingDate);
//                     recGenJnlLine.VALIDATE("Posting Date", PD);
//                     recGenJnlLine.Description := Vendor.Name;
//                     recGenJnlLine."Posting Group" := Vendor."Vendor Posting Group";
//                     recGenJnlLine."Salespers./Purch. Code" := Vendor."Purchaser Code";
//                     recGenJnlLine."Payment Terms Code" := Vendor."Payment Terms Code";
//                     recGenJnlLine.VALIDATE("Payment Terms Code");
//                     recGenJnlLine.VALIDATE("Account No.", AccNo);
//                     recGenJnlLine.VALIDATE("Bill-to/Pay-to No.", AccNo);
//                     recGenJnlLine.VALIDATE("Sell-to/Buy-from No.", AccNo);
//                     recGenJnlLine.VALIDATE("Currency Code", Vendor."Currency Code");
//                     recGenJnlLine.VALIDATE("Bal. Account No.", BalAccNo);
//                     recGenJnlLine."Gen. Posting Type" := 0;
//                     recGenJnlLine."Gen. Bus. Posting Group" := '';
//                     recGenJnlLine."Gen. Prod. Posting Group" := '';
//                     recGenJnlLine."VAT Bus. Posting Group" := '';
//                     recGenJnlLine."VAT Prod. Posting Group" := '';
//                     EVALUATE(decTDS, TDSTCSAmt);
//                     // recGenJnlLine.VALIDATE("TDS/TCS Amount", decTDS);
//                     //>>OA.SB
//                     // recGenJnlLine."TDS/TCS Amt Incl Surcharge" := decTDS; //pcpl-065
//                     // recGenJnlLine."Bal. TDS/TCS Including SHECESS" := decTDS;//PCPL-065
//                     // recGenJnlLine."Total TDS/TCS Incl. SHE CESS" := decTDS;//PCPL-065
//                     // recGenJnlLine."TDS/TCS Base Amount" := decCreditAmt; //PCPL-065
//                     // recGenJnlLine."Surcharge Base Amount" := decCreditAmt; //PCPL-065
//                     recGenJnlLine."Manual Entry" := TRUE;
//                     //<<OA.SB
//                     // recGenJnlLine."TDS Nature of Deduction" := TdsNature; //PCPL-065
//                     // recGenJnlLine.VALIDATE("TDS Nature of Deduction"); //PCPL-065
//                     recGenJnlLine.VALIDATE("Shortcut Dimension 1 Code", ShortCutDim1);
//                     recGenJnlLine.VALIDATE("Shortcut Dimension 2 Code", ShortCutDim2);
//                     tempDimSetEntry.DELETEALL;
//                     tempDimSetEntry.INIT;
//                     tempDimSetEntry.VALIDATE("Dimension Code", 'COSTCENTRE');
//                     tempDimSetEntry.VALIDATE("Dimension Value Code", ShortDim1);
//                     tempDimSetEntry.INSERT;
//                     tempDimSetEntry.INIT;
//                     tempDimSetEntry.VALIDATE("Dimension Code", 'PROJECT');
//                     tempDimSetEntry.VALIDATE("Dimension Value Code", ShortDim2);
//                     tempDimSetEntry.INSERT;
//                     tempDimSetEntry.INIT;
//                     tempDimSetEntry.VALIDATE("Dimension Code", 'EMPLOYEE');
//                     tempDimSetEntry.VALIDATE("Dimension Value Code", ShortDim3);
//                     tempDimSetEntry.INSERT;
//                     recGenJnlLine."Dimension Set ID" := recDimSetEntry.GetDimensionSetID(tempDimSetEntry);
//                     recGenJnlLine.MODIFY;

//                     //PCPL-25/270623 for tds
//                     if TDSTCSAmt <> '' then begin
//                         EVALUATE(decTDS, TDSTCSAmt);
//                         rec_GenJnlL.RESET;
//                         rec_GenJnlL.SETRANGE("Journal Template Name", 'JOURNAL VO');
//                         rec_GenJnlL.SETRANGE("Journal Batch Name", 'SALARY JV');
//                         IF rec_GenJnlL.FINDLAST THEN
//                             intLine := rec_GenJnlL."Line No.";

//                         recGenJnlL.INIT;
//                         recGenJnlL.VALIDATE("Journal Template Name", 'JOURNAL VO');
//                         recGenJnlL.VALIDATE("Journal Batch Name", 'SALARY JV'); //Avinash)
//                         recGenJnlL.VALIDATE("Document No.", cd_DocumentNo);
//                         recGenJnlL.VALIDATE("Source Code", 'JOURNALV');
//                         recGenJnlL.VALIDATE("Document Type", "Gen. Journal Line"."Document Type"::Invoice);
//                         recGenJnlL.VALIDATE("Account Type", "Gen. Journal Line"."Account Type"::Vendor);
//                         recGenJnlL.VALIDATE("Bal. Account Type", "Gen. Journal Line"."Bal. Account Type"::"G/L Account");
//                         recGenJnlL.VALIDATE("Bal. Gen. Posting Type", "Gen. Journal Line"."Bal. Gen. Posting Type"::Purchase);
//                         recGenJnlL."Salary Transaction" := TRUE;
//                         recGenJnlL."Line No." := intLine + 10000;
//                         recGenJnlL."External Document No." := cd_DocumentNo;
//                         recGenJnlL.INSERT;

//                         ICount := ICount + 1;
//                         TdsNature := TDSNature11;
//                         ShortCutDim1 := ShortDim1;
//                         ShortCutDim2 := ShortDim2;
//                         EVALUATE(decCreditAmt, CreditAmt);
//                         IF decCreditAmt <> 0 THEN
//                             recGenJnlL.VALIDATE("Credit Amount", decCreditAmt);
//                         Vendor.RESET;
//                         Vendor.GET(PartyCode);
//                         recGenJnlL.VALIDATE("Party Type", recGenJnlL."Party Type"::Vendor);  //pcpl code uncommented
//                         recGenJnlL.VALIDATE("Party Code", PartyCode);
//                         EVALUATE(PD, PostingDate);
//                         recGenJnlL.VALIDATE("Posting Date", PD);
//                         recGenJnlL.Description := Vendor.Name;
//                         recGenJnlL."Posting Group" := Vendor."Vendor Posting Group";
//                         recGenJnlL."Salespers./Purch. Code" := Vendor."Purchaser Code";
//                         recGenJnlL."Payment Terms Code" := Vendor."Payment Terms Code";
//                         recGenJnlL.VALIDATE("Payment Terms Code");
//                         recGenJnlL.VALIDATE("Account No.", AccNo);
//                         recGenJnlL.VALIDATE("Bill-to/Pay-to No.", AccNo);
//                         recGenJnlL.VALIDATE("Sell-to/Buy-from No.", AccNo);
//                         recGenJnlL.VALIDATE("Currency Code", Vendor."Currency Code");
//                         recGenJnlL.VALIDATE("Bal. Account No.", BalAccNo);
//                         recGenJnlL."Gen. Posting Type" := 0;
//                         recGenJnlL."Gen. Bus. Posting Group" := '';
//                         recGenJnlL."Gen. Prod. Posting Group" := '';
//                         recGenJnlL."VAT Bus. Posting Group" := '';
//                         recGenJnlL."VAT Prod. Posting Group" := '';
//                         EVALUATE(decTDS, TDSTCSAmt);

//                         recGenJnlL."Manual Entry" := TRUE;
//                         recGenJnlL.VALIDATE("Shortcut Dimension 1 Code", ShortCutDim1);
//                         recGenJnlL.VALIDATE("Shortcut Dimension 2 Code", ShortCutDim2);
//                         tempDimSetE.DELETEALL;
//                         tempDimSetE.INIT;
//                         tempDimSetE.VALIDATE("Dimension Code", 'COSTCENTRE');
//                         tempDimSetE.VALIDATE("Dimension Value Code", ShortDim1);
//                         tempDimSetE.INSERT;
//                         tempDimSetE.INIT;
//                         tempDimSetE.VALIDATE("Dimension Code", 'PROJECT');
//                         tempDimSetE.VALIDATE("Dimension Value Code", ShortDim2);
//                         tempDimSetE.INSERT;
//                         tempDimSetE.INIT;
//                         tempDimSetE.VALIDATE("Dimension Code", 'EMPLOYEE');
//                         tempDimSetE.VALIDATE("Dimension Value Code", ShortDim3);
//                         tempDimSetE.INSERT;
//                         recGenJnlL."Dimension Set ID" := recDimSetEntry.GetDimensionSetID(tempDimSetE);
//                         recGenJnlL.MODIFY;
//                     end;
//                     //PCPL-25/270623

//                     cd_DocumentNo := INCSTR(cd_DocumentNo);


//                 end;
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     trigger OnPostXmlPort()
//     begin

//         MESSAGE('Data Updated Successfully');
//     end;

//     trigger OnPreXmlPort()
//     begin
//         rec_GenJnlL.RESET;
//         rec_GenJnlL.SETRANGE("Journal Template Name", 'JOURNAL VO');
//         rec_GenJnlL.SETRANGE("Journal Batch Name", 'SALARY JV');
//         rec_GenJnlL.SETFILTER(Amount, '%1', 0);
//         IF rec_GenJnlL.FINDLAST THEN
//             rec_GenJnlBatch.SETRANGE("Journal Template Name", 'JOURNAL VO');
//         rec_GenJnlBatch.SETRANGE(Name, 'SALARY JV');
//         IF rec_GenJnlBatch.FINDFIRST THEN BEGIN
//             IF rec_GenJnlBatch."No. Series" <> '' THEN BEGIN
//                 CLEAR(cu_NoSeriesMgt);
//                 cd_DocumentNo := cu_NoSeriesMgt.GetNextNo(rec_GenJnlBatch."No. Series", rec_GenJnlLine."Posting Date", FALSE);
//             END;
//         END;
//     end;

//     var
//         ExtDocNo: Code[50];
//         cd_DocumentNo: Code[20];
//         cd_newDocumentNo: Code[20];
//         cu_NoSeriesMgt: Codeunit 396;
//         rec_GenJnlBatch: Record 232;
//         rec_GenJnlL: Record 81;
//         rec_GenJnlTemplate: Record 80;
//         dt_PostingDate: Date;
//         TdsNature: Code[10];
//         ICount: Integer;
//         rec_DimensionValue: Record 349;
//         ShortCutDim3: Code[10];
//         JournalLineDimension: Record 356;
//         ShortCutDim1: Code[20];
//         ShortCutDim2: Code[20];
//         Vendor: Record 23;
//         vendRecGenJnlLine: Record 81;
//         blnRecFound: Boolean;
//         recGenJnlL: Record 81;
//         intLine: Integer;
//         decCreditAmt: Decimal;
//         PD: Date;
//         tempDimSetE: Record 480 temporary;
//         recDimSetEntry: Record 480;
//         decTDS: Decimal;
// }

