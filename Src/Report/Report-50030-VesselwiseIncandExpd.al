report 50030 "Vesselwise Inc. and  Expd."
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.")
                                WHERE("No." = FILTER(755000 .. 755999 | 810000 .. 819999 | 820000 .. 829999 | 850000 .. 859999));

            trigger OnAfterGetRecord()
            begin


                //for Month 1
                IF MonthStartDate[1] <> 0D THEN       //003
                BEGIN
                    CLEAR(dataAmount);
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[1], MonthEndDate[1]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[1] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 2
                //IF MonthStartDate[2]<>0D THEN       //003
                //BEGIN
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[2], MonthEndDate[2]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[2] := (-recGLEntry.Amount);
                END;
                //END;

                //for Month 3
                IF MonthStartDate[3] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[3], MonthEndDate[3]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[3] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 4
                IF MonthStartDate[4] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[4], MonthEndDate[4]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[4] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 5
                IF MonthStartDate[5] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[5], MonthEndDate[5]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[5] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 6
                IF MonthStartDate[6] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[6], MonthEndDate[6]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[6] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 7
                IF MonthStartDate[7] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[7], MonthEndDate[7]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[7] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 8
                IF MonthStartDate[8] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[8], MonthEndDate[8]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[8] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 9
                IF MonthStartDate[9] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[9], MonthEndDate[9]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[9] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 10
                IF MonthStartDate[10] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[10], MonthEndDate[10]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[10] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 11
                IF MonthStartDate[11] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[11], MonthEndDate[11]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[11] := (-recGLEntry.Amount);
                    END;
                END;

                //for Month 12
                IF MonthStartDate[12] <> 0D THEN       //003
                BEGIN
                    recGLEntry.SETRANGE("G/L Account No.", "No.");
                    recGLEntry.SETRANGE("Posting Date", MonthStartDate[12], MonthEndDate[12]);
                    IF recGLEntry.FINDFIRST THEN BEGIN
                        recGLEntry.CALCSUMS(Amount);
                        dataAmount[12] := (-recGLEntry.Amount);
                    END;
                END;

                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];

                IF (dataAmount[1] = 0) AND (dataAmount[2] = 0) AND (dataAmount[3] = 0) AND (dataAmount[4] = 0)
                AND (dataAmount[5] = 0) AND (dataAmount[6] = 0)
                AND (dataAmount[7] = 0) AND (dataAmount[8] = 0) AND (dataAmount[9] = 0) AND (dataAmount[10] = 0) AND
                 (dataAmount[11] = 0) AND (dataAmount[12] = 0) THEN
                    CurrReport.SKIP;


                //Section

                introw += 1;
                fctEnterCell(introw, 1, FORMAT(Name), FALSE, '');

                // 002 ++
                fctEnterCell(introw, 2, FORMAT((dataAmount[1])), FALSE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT((dataAmount[2])), FALSE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT((dataAmount[3])), FALSE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT((dataAmount[4])), FALSE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT((dataAmount[5])), FALSE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT((dataAmount[6])), FALSE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT((dataAmount[7])), FALSE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT((dataAmount[8])), FALSE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT((dataAmount[9])), FALSE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT((dataAmount[10])), FALSE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT((dataAmount[11])), FALSE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT((dataAmount[12])), FALSE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT((total)), TRUE, '0,0.00');
                //002 --
                //Section

                IncomeAmount1 += (dataAmount[1]);
                IncomeAmount2 += (dataAmount[2]);
                IncomeAmount3 += (dataAmount[3]);
                IncomeAmount4 += (dataAmount[4]);
                IncomeAmount5 += (dataAmount[5]);
                IncomeAmount6 += (dataAmount[6]);
                IncomeAmount7 += (dataAmount[7]);
                IncomeAmount8 += (dataAmount[8]);
                IncomeAmount9 += (dataAmount[9]);
                IncomeAmount10 += (dataAmount[10]);
                IncomeAmount11 += (dataAmount[11]);
                IncomeAmount12 += (dataAmount[12]);

                /*
                IncomeAmount1 += ABS(dataAmount[1]);
                IncomeAmount2 += ABS(dataAmount[2]);
                IncomeAmount3 += ABS(dataAmount[3]);
                IncomeAmount4 += ABS(dataAmount[4]);
                IncomeAmount5 += ABS(dataAmount[5]);
                IncomeAmount6 += ABS(dataAmount[6]);
                IncomeAmount7 += ABS(dataAmount[7]);
                IncomeAmount8 += ABS(dataAmount[8]);
                IncomeAmount9 += ABS(dataAmount[9]);
                IncomeAmount10+= ABS(dataAmount[10]);
                IncomeAmount11+= ABS(dataAmount[11]);
                IncomeAmount12+= ABS(dataAmount[12]);
                */

                FinalTot += total;

            end;

            trigger OnPostDataItem()
            begin
                //Section Footer
                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];
                introw += 1;
                fctEnterCell(introw, 1, FORMAT('Total Income'), TRUE, '');
                fctEnterCell(introw, 2, FORMAT((IncomeAmount1)), TRUE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT((IncomeAmount2)), TRUE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT((IncomeAmount3)), TRUE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT((IncomeAmount4)), TRUE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT((IncomeAmount5)), TRUE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT((IncomeAmount6)), TRUE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT((IncomeAmount7)), TRUE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT((IncomeAmount8)), TRUE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT((IncomeAmount9)), TRUE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT((IncomeAmount10)), TRUE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT((IncomeAmount11)), TRUE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT((IncomeAmount12)), TRUE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT((FinalTot)), TRUE, '0,0.00');
                introw += 1;
                //Section Footer
            end;

            trigger OnPreDataItem()
            begin

                recGLEntry.RESET;
                //recGLEntry.SETCURRENTKEY("G/L Account No.","Posting Date");
                recGLEntry.SETCURRENTKEY("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                IF costCentre <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 1 Code", costCentre);

                IF projectcode <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 2 Code", projectcode);

                CurrReport.CREATETOTALS(dataAmount[1], dataAmount[2], dataAmount[3], dataAmount[4], dataAmount[5], dataAmount[6], dataAmount[7],
                dataAmount[8], dataAmount[9], dataAmount[10]);

                CurrReport.CREATETOTALS(dataAmount[11], dataAmount[12]);

                companyinfo.GET;
                fctEnterCell(1, 1, companyinfo.Name, TRUE, '');
                fctEnterCell(2, 1, FORMAT(companyinfo.Address + companyinfo."Address 2"), TRUE, '');


                fctEnterCell(3, 1, 'From date : ' + FORMAT(FromDate) + ' to date :' + FORMAT(ToDate), TRUE, '');
                fctEnterCell(4, 1, 'Cost Centre Filter: ' + FORMAT(costCentre), TRUE, '');
                fctEnterCell(5, 1, 'Project Code Filter: ' + FORMAT(projectcode), TRUE, '');
                fctEnterCell(6, 1, 'Particulars : ', TRUE, '0');
                fctEnterCell(6, 2, FORMAT(MonthStartDate[1], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 3, FORMAT(MonthStartDate[2], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 4, FORMAT(MonthStartDate[3], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 5, FORMAT(MonthStartDate[4], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 6, FORMAT(MonthStartDate[5], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 7, FORMAT(MonthStartDate[6], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 8, FORMAT(MonthStartDate[7], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 9, FORMAT(MonthStartDate[8], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 10, FORMAT(MonthStartDate[9], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 11, FORMAT(MonthStartDate[10], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 12, FORMAT(MonthStartDate[11], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 13, FORMAT(MonthStartDate[12], 0, '<Month Text>-<Year>'), TRUE, '');
                fctEnterCell(6, 14, 'Total', TRUE, '');
                introw := 7;
            end;
        }
        dataitem("<G/L Account1>"; "G/L Account")
        {
            DataItemTableView = SORTING("No.")
                                WHERE("No." = FILTER(730210 | 701000 .. 719999 | 740000 .. 753999 | 756000 .. 756999));

            trigger OnAfterGetRecord()
            begin

                CLEAR(dataAmount);

                //for month1
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[1], MonthEndDate[1]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[1] := (-recGLEntry.Amount);
                END;



                //for month2
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[2], MonthEndDate[2]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[2] := (-recGLEntry.Amount);
                END;

                //for month3
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[3], MonthEndDate[3]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[3] := (-recGLEntry.Amount);

                END;

                //for month4
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[4], MonthEndDate[4]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[4] := (-recGLEntry.Amount);
                END;

                //for month5
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[5], MonthEndDate[5]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[5] := (-recGLEntry.Amount);
                END;

                //for month6
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[6], MonthEndDate[6]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[6] := (-recGLEntry.Amount);
                END;

                //for month7
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[7], MonthEndDate[7]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[7] := (-recGLEntry.Amount);
                END;

                //for month8
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[8], MonthEndDate[8]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[8] := (-recGLEntry.Amount);
                END;

                //for month9
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[9], MonthEndDate[9]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[9] := (-recGLEntry.Amount);
                END;

                //for month10
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[10], MonthEndDate[10]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[10] := (-recGLEntry.Amount);
                END;

                //for month11
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[11], MonthEndDate[11]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[11] := (-recGLEntry.Amount);
                END;

                //for month12
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[12], MonthEndDate[12]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[12] := (-recGLEntry.Amount);
                END;
                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];

                IF (dataAmount[1] = 0) AND (dataAmount[2] = 0) AND (dataAmount[3] = 0) AND (dataAmount[4] = 0)
                AND (dataAmount[5] = 0) AND (dataAmount[6] = 0)
                AND (dataAmount[7] = 0) AND (dataAmount[8] = 0) AND (dataAmount[9] = 0) AND (dataAmount[10] = 0) AND
                 (dataAmount[11] = 0) AND (dataAmount[12] = 0) THEN
                    CurrReport.SKIP;

                //Section

                introw += 1;
                fctEnterCell(introw, 1, FORMAT(Name), FALSE, '');
                fctEnterCell(introw, 2, FORMAT(dataAmount[1]), FALSE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT(dataAmount[2]), FALSE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT(dataAmount[3]), FALSE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT(dataAmount[4]), FALSE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT(dataAmount[5]), FALSE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT(dataAmount[6]), FALSE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT(dataAmount[7]), FALSE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT(dataAmount[8]), FALSE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT(dataAmount[9]), FALSE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT(dataAmount[10]), FALSE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT(dataAmount[11]), FALSE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT(dataAmount[12]), FALSE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT(total), TRUE, '0,0.00');
                //Section


                dataAmount1 += dataAmount[1];
                dataAmount2 += dataAmount[2];
                dataAmount3 += dataAmount[3];
                dataAmount4 += dataAmount[4];
                dataAmount5 += dataAmount[5];
                dataAmount6 += dataAmount[6];
                dataAmount7 += dataAmount[7];
                dataAmount8 += dataAmount[8];
                dataAmount9 += dataAmount[9];
                dataAmount10 += dataAmount[10];
                dataAmount11 += dataAmount[11];
                dataAmount12 += dataAmount[12];

                FinalExpTot += total;
            end;

            trigger OnPostDataItem()
            begin
                //Section Footer

                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];
                /*
                dataAmount1:=dataAmount[1];
                dataAmount2:=dataAmount[2];
                dataAmount3:=dataAmount[3];
                dataAmount4:=dataAmount[4];
                dataAmount5:=dataAmount[5];
                dataAmount6:=dataAmount[6];
                dataAmount7:=dataAmount[7];
                dataAmount8:=dataAmount[8];
                dataAmount9:=dataAmount[9];
                dataAmount10:=dataAmount[10];
                dataAmount11:=dataAmount[11];
                dataAmount12:=dataAmount[12];
                */

                introw += 1;
                fctEnterCell(introw, 1, FORMAT('Total Expenditure'), TRUE, '');
                fctEnterCell(introw, 2, FORMAT(dataAmount1), TRUE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT(dataAmount2), TRUE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT(dataAmount3), TRUE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT(dataAmount4), TRUE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT(dataAmount5), TRUE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT(dataAmount6), TRUE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT(dataAmount7), TRUE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT(dataAmount8), TRUE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT(dataAmount9), TRUE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT(dataAmount10), TRUE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT(dataAmount11), TRUE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT(dataAmount12), TRUE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT(FinalExpTot), TRUE, '0,0.00');
                introw += 1;
                //Section Footer

            end;

            trigger OnPreDataItem()
            begin

                recGLEntry.RESET;
                //recGLEntry.SETCURRENTKEY("G/L Account No.","Posting Date");
                recGLEntry.SETCURRENTKEY("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                IF costCentre <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 1 Code", costCentre);

                IF projectcode <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 2 Code", projectcode);

                CurrReport.CREATETOTALS(dataAmount[1], dataAmount[2], dataAmount[3], dataAmount[4], dataAmount[5], dataAmount[6], dataAmount[7],
                dataAmount[8], dataAmount[9], dataAmount[10]);

                CurrReport.CREATETOTALS(dataAmount[11], dataAmount[12]);
            end;
        }
        dataitem("<G/L Account2>"; "G/L Account")
        {
            DataItemTableView = SORTING("No.")
                                WHERE("No." = FILTER(720000 .. 729999 | 754000 .. 754299 | 770000 .. 775999 | 860000 .. 869999 | 900000 .. 959999));

            trigger OnAfterGetRecord()
            begin

                //for Month 1
                CLEAR(dataAmount);
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[1], MonthEndDate[1]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[1] := (-recGLEntry.Amount);
                END;

                //for month2
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[2], MonthEndDate[2]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[2] := (-recGLEntry.Amount);
                END;

                //for month3
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[3], MonthEndDate[3]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[3] := (-recGLEntry.Amount);
                END;

                //for month4
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[4], MonthEndDate[4]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[4] := (-recGLEntry.Amount);
                END;

                //for may
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[5], MonthEndDate[5]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[5] := (-recGLEntry.Amount);
                END;

                //for june
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[6], MonthEndDate[6]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[6] := (-recGLEntry.Amount);
                END;

                //for july
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[7], MonthEndDate[7]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[7] := (-recGLEntry.Amount);
                END;

                //for august
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[8], MonthEndDate[8]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[8] := (-recGLEntry.Amount);
                END;

                //for september
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[9], MonthEndDate[9]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[9] := (-recGLEntry.Amount);
                END;

                //for octomber
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[10], MonthEndDate[10]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[10] := (-recGLEntry.Amount);
                END;

                //for november
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[11], MonthEndDate[11]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[11] := (-recGLEntry.Amount);
                END;

                //for december
                recGLEntry.SETRANGE("G/L Account No.", "No.");
                recGLEntry.SETRANGE("Posting Date", MonthStartDate[12], MonthEndDate[12]);
                IF recGLEntry.FINDFIRST THEN BEGIN
                    recGLEntry.CALCSUMS(Amount);
                    dataAmount[12] := (-recGLEntry.Amount);
                END;
                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];

                IF (dataAmount[1] = 0) AND (dataAmount[2] = 0) AND (dataAmount[3] = 0) AND (dataAmount[4] = 0)
                AND (dataAmount[5] = 0) AND (dataAmount[6] = 0)
                AND (dataAmount[7] = 0) AND (dataAmount[8] = 0) AND (dataAmount[9] = 0) AND (dataAmount[10] = 0) AND
                 (dataAmount[11] = 0) AND (dataAmount[12] = 0) THEN
                    CurrReport.SKIP;


                introw += 1;
                fctEnterCell(introw, 1, FORMAT(Name), FALSE, '');
                fctEnterCell(introw, 2, FORMAT(dataAmount[1]), FALSE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT(dataAmount[2]), FALSE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT(dataAmount[3]), FALSE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT(dataAmount[4]), FALSE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT(dataAmount[5]), FALSE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT(dataAmount[6]), FALSE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT(dataAmount[7]), FALSE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT(dataAmount[8]), FALSE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT(dataAmount[9]), FALSE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT(dataAmount[10]), FALSE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT(dataAmount[11]), FALSE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT(dataAmount[12]), FALSE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT(total), TRUE, '0,0.00');


                DataAmtDepre1 += dataAmount[1];
                DataAmtDepre2 += dataAmount[2];
                DataAmtDepre3 += dataAmount[3];
                DataAmtDepre4 += dataAmount[4];
                DataAmtDepre5 += dataAmount[5];
                DataAmtDepre6 += dataAmount[6];
                DataAmtDepre7 += dataAmount[7];
                DataAmtDepre8 += dataAmount[8];
                DataAmtDepre9 += dataAmount[9];
                DataAmtDepre10 += dataAmount[10];
                DataAmtDepre11 += dataAmount[11];
                DataAmtDepre12 += dataAmount[12];


                FinalDepreTot += total;
                /*
                totalExp :=dataAmount1+dataAmount2+dataAmount3+dataAmount4+dataAmount5+dataAmount6+dataAmount7+dataAmount8+
                dataAmount9+dataAmount10+dataAmount11+dataAmount12+DataAmtDepre1+DataAmtDepre2+DataAmtDepre3+DataAmtDepre4+
                DataAmtDepre5+DataAmtDepre6+DataAmtDepre7+DataAmtDepre8+DataAmtDepre9+DataAmtDepre10+DataAmtDepre11+DataAmtDepre12;
                */

            end;

            trigger OnPostDataItem()
            begin

                total := dataAmount[1] + dataAmount[2] + dataAmount[3] + dataAmount[4] + dataAmount[5] + dataAmount[6] + dataAmount[7] + dataAmount[8] +
                dataAmount[9] + dataAmount[10] + dataAmount[11] + dataAmount[12];
                /*
                dataAmount1 +=dataAmount[1];
                dataAmount2 +=dataAmount[2];
                dataAmount3 +=dataAmount[3];
                dataAmount4 +=dataAmount[4];
                dataAmount5 +=dataAmount[5];
                dataAmount6 +=dataAmount[6];
                dataAmount7 +=dataAmount[7];
                dataAmount8 +=dataAmount[8];
                dataAmount9 +=dataAmount[9];
                dataAmount10+=dataAmount[10];
                dataAmount11+=dataAmount[11];
                dataAmount12+=dataAmount[12];
                */

                introw += 1;
                fctEnterCell(introw, 1, FORMAT('Total Depreciation'), TRUE, '');
                fctEnterCell(introw, 2, FORMAT(DataAmtDepre1), TRUE, '0,0.00');
                fctEnterCell(introw, 3, FORMAT(DataAmtDepre2), TRUE, '0,0.00');
                fctEnterCell(introw, 4, FORMAT(DataAmtDepre3), TRUE, '0,0.00');
                fctEnterCell(introw, 5, FORMAT(DataAmtDepre4), TRUE, '0,0.00');
                fctEnterCell(introw, 6, FORMAT(DataAmtDepre5), TRUE, '0,0.00');
                fctEnterCell(introw, 7, FORMAT(DataAmtDepre6), TRUE, '0,0.00');
                fctEnterCell(introw, 8, FORMAT(DataAmtDepre7), TRUE, '0,0.00');
                fctEnterCell(introw, 9, FORMAT(DataAmtDepre8), TRUE, '0,0.00');
                fctEnterCell(introw, 10, FORMAT(DataAmtDepre9), TRUE, '0,0.00');
                fctEnterCell(introw, 11, FORMAT(DataAmtDepre10), TRUE, '0,0.00');
                fctEnterCell(introw, 12, FORMAT(DataAmtDepre11), TRUE, '0,0.00');
                fctEnterCell(introw, 13, FORMAT(DataAmtDepre12), TRUE, '0,0.00');
                fctEnterCell(introw, 14, FORMAT(FinalDepreTot), TRUE, '0,0.00');


                totalExp := dataAmount1 + dataAmount2 + dataAmount3 + dataAmount4 + dataAmount5 + dataAmount6 + dataAmount7 + dataAmount8 +
                dataAmount9 + dataAmount10 + dataAmount11 + dataAmount12 + DataAmtDepre1 + DataAmtDepre2 + DataAmtDepre3 + DataAmtDepre4 +
                DataAmtDepre5 + DataAmtDepre6 + DataAmtDepre7 + DataAmtDepre8 + DataAmtDepre9 + DataAmtDepre10 + DataAmtDepre11 + DataAmtDepre12;


                fctEnterCell(introw + 2, 1, FORMAT('Total Expenses'), TRUE, '');
                fctEnterCell(introw + 2, 2, FORMAT(dataAmount1 + DataAmtDepre1), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 3, FORMAT(dataAmount2 + DataAmtDepre2), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 4, FORMAT(dataAmount3 + DataAmtDepre3), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 5, FORMAT(dataAmount4 + DataAmtDepre4), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 6, FORMAT(dataAmount5 + DataAmtDepre5), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 7, FORMAT(dataAmount6 + DataAmtDepre6), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 8, FORMAT(dataAmount7 + DataAmtDepre7), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 9, FORMAT(dataAmount8 + DataAmtDepre8), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 10, FORMAT(dataAmount9 + DataAmtDepre9), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 11, FORMAT(dataAmount10 + DataAmtDepre10), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 12, FORMAT(dataAmount11 + DataAmtDepre11), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 13, FORMAT(dataAmount12 + DataAmtDepre12), TRUE, '0,0.00');
                fctEnterCell(introw + 2, 14, FORMAT((totalExp)), TRUE, '0,0.00');
                //MESSAGE('Total Expense %1',dataAmount2+DataAmtDepre2);//

                /*
                fctEnterCell(introw+4,1,FORMAT('Net Profit'),TRUE,'');
                fctEnterCell(introw+4,2,FORMAT(ABS(IncomeAmount1)-(dataAmount1+DataAmtDepre1)),TRUE,'0,0.00');
                fctEnterCell(introw+4,3,FORMAT(ABS(IncomeAmount2)-dataAmount2+DataAmtDepre2),TRUE,'0,0.00');
                fctEnterCell(introw+4,4,FORMAT(ABS(IncomeAmount3)-(dataAmount3+DataAmtDepre3)),TRUE,'0,0.00');
                fctEnterCell(introw+4,5,FORMAT(ABS(IncomeAmount4)-(dataAmount4+DataAmtDepre4)),TRUE,'0,0.00');
                fctEnterCell(introw+4,6,FORMAT(ABS(IncomeAmount5)-(dataAmount5+DataAmtDepre5)),TRUE,'0,0.00');
                fctEnterCell(introw+4,7,FORMAT(ABS(IncomeAmount6)-(dataAmount6+DataAmtDepre6)),TRUE,'0,0.00');
                fctEnterCell(introw+4,8,FORMAT(ABS(IncomeAmount7)-(dataAmount7+DataAmtDepre7)),TRUE,'0,0.00');
                fctEnterCell(introw+4,9,FORMAT(ABS(IncomeAmount8)-(dataAmount8+DataAmtDepre8)),TRUE,'0,0.00');
                fctEnterCell(introw+4,10,FORMAT(ABS(IncomeAmount9)-(dataAmount9+DataAmtDepre9)),TRUE,'0,0.00');
                fctEnterCell(introw+4,11,FORMAT(ABS(IncomeAmount10)-(dataAmount10+DataAmtDepre10)),TRUE,'0,0.00');
                fctEnterCell(introw+4,12,FORMAT(ABS(IncomeAmount11)-(dataAmount11+DataAmtDepre11)),TRUE,'0,0.00');
                fctEnterCell(introw+4,13,FORMAT(ABS(IncomeAmount12)-(dataAmount12+DataAmtDepre12)),TRUE,'0,0.00');
                */

                fctEnterCell(introw + 4, 1, FORMAT('Net Profit'), TRUE, '');
                fctEnterCell(introw + 4, 2, FORMAT(ABS(IncomeAmount1) + (dataAmount1 + DataAmtDepre1)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 3, FORMAT(ABS(IncomeAmount2) + dataAmount2 + DataAmtDepre2), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 4, FORMAT(ABS(IncomeAmount3) + (dataAmount3 + DataAmtDepre3)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 5, FORMAT(ABS(IncomeAmount4) + (dataAmount4 + DataAmtDepre4)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 6, FORMAT(ABS(IncomeAmount5) + (dataAmount5 + DataAmtDepre5)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 7, FORMAT(ABS(IncomeAmount6) + (dataAmount6 + DataAmtDepre6)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 8, FORMAT(ABS(IncomeAmount7) + (dataAmount7 + DataAmtDepre7)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 9, FORMAT(ABS(IncomeAmount8) + (dataAmount8 + DataAmtDepre8)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 10, FORMAT(ABS(IncomeAmount9) + (dataAmount9 + DataAmtDepre9)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 11, FORMAT(ABS(IncomeAmount10) + (dataAmount10 + DataAmtDepre10)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 12, FORMAT(ABS(IncomeAmount11) + (dataAmount11 + DataAmtDepre11)), TRUE, '0,0.00');
                fctEnterCell(introw + 4, 13, FORMAT(ABS(IncomeAmount12) + (dataAmount12 + DataAmtDepre12)), TRUE, '0,0.00');
                /*
                totalIncome:=(ABS(IncomeAmount1)-(dataAmount1+DataAmtDepre1))+(ABS(IncomeAmount2)-(dataAmount2+DataAmtDepre2))+(ABS(IncomeAmount3)-(dataAmount3+DataAmtDepre3))+
                (ABS(IncomeAmount4)-(dataAmount4+DataAmtDepre4))+(ABS(IncomeAmount5)-(dataAmount5+DataAmtDepre5))+(ABS(IncomeAmount6)-(dataAmount6+DataAmtDepre6))+
                (ABS(IncomeAmount7)-(dataAmount7+DataAmtDepre7))+(ABS(IncomeAmount8)-(dataAmount8+DataAmtDepre8))+(ABS(IncomeAmount9)-(dataAmount9+DataAmtDepre9))+
                (ABS(IncomeAmount10)-(dataAmount10+DataAmtDepre10))+(ABS(IncomeAmount11)-(dataAmount11+DataAmtDepre11))+(ABS(IncomeAmount12)-(dataAmount12+DataAmtDepre12));
                */
                fctEnterCell(introw + 4, 14, FORMAT((FinalTot) + totalExp), TRUE, '0,0.00');

            end;

            trigger OnPreDataItem()
            begin

                recGLEntry.RESET;
                //recGLEntry.SETCURRENTKEY("G/L Account No.","Posting Date");
                recGLEntry.SETCURRENTKEY("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date");
                IF costCentre <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 1 Code", costCentre);

                IF projectcode <> '' THEN
                    recGLEntry.SETRANGE("Global Dimension 2 Code", projectcode);

                CurrReport.CREATETOTALS(dataAmount[1], dataAmount[2], dataAmount[3], dataAmount[4], dataAmount[5], dataAmount[6], dataAmount[7],
                dataAmount[8], dataAmount[9], dataAmount[10]);

                CurrReport.CREATETOTALS(dataAmount[11], dataAmount[12]);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("From Date"; FromDate)
                {
                }
                field("To Date"; ToDate)
                {
                }
                field("Cost Center"; costCentre)
                {
                    // TableRelation = "Dimension Value".Code WHERE("Dimension Code"= CONST("COSTCENTRE")); //PCPL-064
                }
                field("Project code"; projectcode)
                {
                    //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST(PROJECT)); //PCPL-064
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        /* <<PCPL-064
        recExcelBuffer.CreateBookAndOpenExcel('', 'Analysis', '', COMPANYNAME, USERID);
        recExcelBuffer.GiveUserControl;
        ERROR('');*///>>PCPL-064
        //<<PCPL-064
        recExcelBuffer.CreateNewBook('Analysis');
        recExcelBuffer.WriteSheet('Analysis', CompanyName, UserId);
        recExcelBuffer.CloseBook();
        recExcelBuffer.SetFriendlyFilename('Analysis');
        recExcelBuffer.OpenExcel();
        //>>PCPL-064
    end;

    trigger OnPreReport()
    begin

        IF FromDate <> 0D THEN
            IF (ToDate < FromDate) THEN
                ERROR('"From Date" should be less than "To Date"');

        IF ToDate <> 0D THEN
            IF (ToDate < FromDate) THEN
                ERROR('"To Date" should be greater than "From Date"');

        IF (FromDate = 0D) THEN
            ERROR('Enter "From Date" first');

        IF (ToDate = 0D) THEN
            ERROR('Enter "To Date" first');

        //for Month 1
        dataMonth[1] := DATE2DMY(FromDate, 2);
        dataYear[1] := DATE2DMY(FromDate, 3);
        MonthStartDate[1] := DMY2DATE(1, dataMonth[1], dataYear[1]);
        MonthEndDate[1] := CALCDATE('CM', MonthStartDate[1]);
        IF MonthStartDate[1] > ToDate THEN    //003
        BEGIN
            MonthStartDate[1] := 0D;
            MonthEndDate[1] := 0D;
        END;
        //MonthEndDate[1] := DMY2DATE(dateRange(dataMonth[1],dataYear[1]),dataMonth[1],dataYear[1]);

        StartYear := DATE2DMY(FromDate, 3);
        EndYear := DATE2DMY(ToDate, 3);

        //for Month 2
        NextDate := CALCDATE('1M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[2] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[2] := CALCDATE('CM', MonthStartDate[2]);
        IF MonthStartDate[2] > ToDate THEN    //003
        BEGIN
            MonthStartDate[2] := 0D;
            MonthEndDate[2] := 0D;
        END;


        //for Month 3
        NextDate := CALCDATE('2M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[3] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[3] := CALCDATE('CM', MonthStartDate[3]);
        IF MonthStartDate[3] > ToDate THEN    //003
        BEGIN
            MonthStartDate[3] := 0D;
            MonthEndDate[3] := 0D;
        END;


        //for Month 4
        NextDate := CALCDATE('3M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[4] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[4] := CALCDATE('CM', MonthStartDate[4]);
        IF MonthStartDate[4] > ToDate THEN    //003
        BEGIN
            MonthStartDate[4] := 0D;
            MonthEndDate[4] := 0D;
        END;


        //for Month 5
        NextDate := CALCDATE('4M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[5] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[5] := CALCDATE('CM', MonthStartDate[5]);
        IF MonthStartDate[5] > ToDate THEN    //003
        BEGIN
            MonthStartDate[5] := 0D;
            MonthEndDate[5] := 0D;
        END;

        //for Month 6
        NextDate := CALCDATE('5M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[6] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[6] := CALCDATE('CM', MonthStartDate[6]);
        IF MonthStartDate[6] > ToDate THEN    //003
        BEGIN
            MonthStartDate[6] := 0D;
            MonthEndDate[6] := 0D;
        END;

        //for dataMonth 7
        NextDate := CALCDATE('6M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[7] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[7] := CALCDATE('CM', MonthStartDate[7]);
        IF MonthStartDate[7] > ToDate THEN    //003
        BEGIN
            MonthStartDate[7] := 0D;
            MonthEndDate[7] := 0D;
        END;

        //for Month 8
        NextDate := CALCDATE('7M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[8] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[8] := CALCDATE('CM', MonthStartDate[8]);
        IF MonthStartDate[8] > ToDate THEN    //003
        BEGIN
            MonthStartDate[8] := 0D;
            MonthEndDate[8] := 0D;
        END;

        //for Month 9
        NextDate := CALCDATE('8M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[9] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[9] := CALCDATE('CM', MonthStartDate[9]);
        IF MonthStartDate[9] > ToDate THEN    //003
        BEGIN
            MonthStartDate[9] := 0D;
            MonthEndDate[9] := 0D;
        END;

        //for Month 10
        NextDate := CALCDATE('9M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[10] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[10] := CALCDATE('CM', MonthStartDate[10]);
        IF MonthStartDate[10] > ToDate THEN    //003
        BEGIN
            MonthStartDate[10] := 0D;
            MonthEndDate[10] := 0D;
        END;

        //for Month 11
        NextDate := CALCDATE('10M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[11] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[11] := CALCDATE('CM', MonthStartDate[11]);
        IF MonthStartDate[11] > ToDate THEN    //003
        BEGIN
            MonthStartDate[11] := 0D;
            MonthEndDate[11] := 0D;
        END;

        //for Month 12
        NextDate := CALCDATE('11M', FromDate);
        NextMonth := DATE2DMY(NextDate, 2);
        NextYear := DATE2DMY(NextDate, 3);
        MonthStartDate[12] := DMY2DATE(1, NextMonth, NextYear);
        MonthEndDate[12] := CALCDATE('CM', MonthStartDate[12]);
        IF MonthStartDate[12] > ToDate THEN    //003
        BEGIN
            MonthStartDate[12] := 0D;
            MonthEndDate[12] := 0D;
        END;
    end;

    var
        recGLEntry: Record 17;
        Year: Integer;
        recExcelBuffer: Record 370 temporary;
        companyinfo: Record 79;
        introw: Integer;
        total: Decimal;
        FromDate: Date;
        ToDate: Date;
        dataMonth: array[12] of Integer;
        dataYear: array[12] of Integer;
        dataAmount: array[12] of Decimal;
        MonthStartDate: array[12] of Date;
        MonthEndDate: array[12] of Date;
        NextDate: Date;
        StartYear: Integer;
        EndYear: Integer;
        NextMonth: Integer;
        NextYear: Integer;
        dataAmount1: Decimal;
        dataAmount2: Decimal;
        dataAmount3: Decimal;
        dataAmount4: Decimal;
        dataAmount5: Decimal;
        dataAmount6: Decimal;
        dataAmount7: Decimal;
        dataAmount8: Decimal;
        dataAmount9: Decimal;
        dataAmount10: Decimal;
        dataAmount11: Decimal;
        dataAmount12: Decimal;
        totalExp: Decimal;
        IncomeAmount1: Decimal;
        IncomeAmount2: Decimal;
        IncomeAmount3: Decimal;
        IncomeAmount4: Decimal;
        IncomeAmount5: Decimal;
        IncomeAmount6: Decimal;
        IncomeAmount7: Decimal;
        IncomeAmount8: Decimal;
        IncomeAmount9: Decimal;
        IncomeAmount10: Decimal;
        IncomeAmount11: Decimal;
        IncomeAmount12: Decimal;
        totalIncome: Decimal;
        costCentre: Code[20];
        projectcode: Code[20];
        FinalTot: Decimal;
        FinalExpTot: Decimal;
        FinalDepreTot: Decimal;
        DataAmtDepre1: Decimal;
        DataAmtDepre2: Decimal;
        DataAmtDepre3: Decimal;
        DataAmtDepre4: Decimal;
        DataAmtDepre5: Decimal;
        DataAmtDepre6: Decimal;
        DataAmtDepre7: Decimal;
        DataAmtDepre8: Decimal;
        DataAmtDepre9: Decimal;
        DataAmtDepre10: Decimal;
        DataAmtDepre11: Decimal;
        DataAmtDepre12: Decimal;

    //[Scope('Extension')] PCPL-064
    procedure fctEnterCell(RowId: Integer; ColumnId: Integer; CellValue: Text[500]; BoldBool: Boolean; NumberFormat: Text)
    begin
        recExcelBuffer.RESET;
        recExcelBuffer.VALIDATE("Row No.", RowId);
        recExcelBuffer.VALIDATE("Column No.", ColumnId);
        recExcelBuffer."Cell Value as Text" := CellValue;
        recExcelBuffer.Bold := BoldBool;
        recExcelBuffer.NumberFormat := NumberFormat;
        recExcelBuffer.INSERT;
    end;
}

