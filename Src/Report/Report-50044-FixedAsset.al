report 50044 "Fixed Asset"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/FixedAsset.rdl';
    Caption = 'Fixed Asset - Book Value 01';

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            RequestFilterFields = "No.", "FA Class Code", "FA Subclass Code", "Budgeted Asset";
            column(Readydate; Readydate)
            {
            }
            column(DepStart; DepStart)
            {
            }
            column(DepEnd; DepEnd)
            {
            }
            column(MainHeadLineText_FA; MainHeadLineText)
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(DeprBookText_FA; DeprBookText)
            {
            }
            column(TableFilter_FA; TABLECAPTION + ': ' + FAFilter)
            {
            }
            column(Filter_FA; FAFilter)
            {
            }
            column(PrintDetails; PrintDetails)
            {
            }
            column(GroupTotals; SELECTSTR(GroupTotals + 1, GroupTotalsTxt))
            {
            }
            column(GroupCodeName; GroupCodeName)
            {
            }
            column(HeadLineText1; HeadLineText[1])
            {
            }
            column(HeadLineText2; HeadLineText[2])
            {
            }
            column(HeadLineText3; HeadLineText[3])
            {
            }
            column(HeadLineText4; HeadLineText[4])
            {
            }
            column(HeadLineText5; HeadLineText[5])
            {
            }
            column(HeadLineText6; HeadLineText[6])
            {
            }
            column(HeadLineText7; HeadLineText[7])
            {
            }
            column(HeadLineText8; HeadLineText[8])
            {
            }
            column(HeadLineText9; HeadLineText[9])
            {
            }
            column(HeadLineText10; HeadLineText[10])
            {
            }
            column(FANo; FANo)
            {
            }
            column(Desc_FA; FADescription)
            {
            }
            column(GroupHeadLine; GroupHeadLine)
            {
            }
            column(No_FA; "No.")
            {
            }
            column(Description_FA; Description)
            {
            }
            column(StartAmounts1; StartAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(NetChangeAmounts1; NetChangeAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(DisposalAmounts1; DisposalAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(TotalEndingAmounts1; TotalEndingAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(StartAmounts2; StartAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(NetChangeAmounts2; NetChangeAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(DisposalAmounts2; DisposalAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(TotalEndingAmounts2; TotalEndingAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(BookValueAtStartingDate; BookValueAtStartingDate)
            {
                AutoFormatType = 1;
            }
            column(BookValueAtEndingDate; BookValueAtEndingDate)
            {
                AutoFormatType = 1;
            }
            column(FormatGrpTotGroupHeadLine; FORMAT(Text002 + ': ' + GroupHeadLine))
            {
            }
            column(GroupStartAmounts1; GroupStartAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(GroupNetChangeAmounts1; GroupNetChangeAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(GroupDisposalAmounts1; GroupDisposalAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(GroupStartAmounts2; GroupStartAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(GroupNetChangeAmounts2; GroupNetChangeAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(GroupDisposalAmounts2; GroupDisposalAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(TotalStartAmounts1; TotalStartAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(TotalNetChangeAmounts1; TotalNetChangeAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(TotalDisposalAmounts1; TotalDisposalAmounts[1])
            {
                AutoFormatType = 1;
            }
            column(TotalStartAmounts2; TotalStartAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(TotalNetChangeAmounts2; TotalNetChangeAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(TotalDisposalAmounts2; TotalDisposalAmounts[2])
            {
                AutoFormatType = 1;
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF NOT FADeprBook.GET("No.", DeprBookCode) THEN
                    CurrReport.SKIP;


                Readydate := 0D;//FADeprBook."Ready To Use Date"; // PCPL-064
                DepStart := FADeprBook."Depreciation Starting Date";
                DepEnd := FADeprBook."Depreciation Ending Date";
                IF SkipRecord THEN
                    CurrReport.SKIP;

                IF GroupTotals = GroupTotals::"FA Posting Group" THEN
                    IF "FA Posting Group" <> FADeprBook."FA Posting Group" THEN
                        ERROR(Text007, FIELDCAPTION("FA Posting Group"), "No.");

                BeforeAmount := 0;
                EndingAmount := 0;
                IF BudgetReport THEN
                    BudgetDepreciation.Calculate(
                      "No.", GetStartingDate(StartingDate), EndingDate, DeprBookCode, BeforeAmount, EndingAmount);

                i := 0;
                WHILE i < NumberOfTypes DO BEGIN
                    i := i + 1;
                    CASE i OF
                        1:
                            PostingType := FADeprBook.FIELDNO("Acquisition Cost");
                        2:
                            PostingType := FADeprBook.FIELDNO(Depreciation);
                        3:
                            PostingType := FADeprBook.FIELDNO("Write-Down");
                        4:
                            PostingType := FADeprBook.FIELDNO(Appreciation);
                        5:
                            PostingType := FADeprBook.FIELDNO("Custom 1");
                        6:
                            PostingType := FADeprBook.FIELDNO("Custom 2");
                    END;
                    IF StartingDate <= 00000101D THEN
                        StartAmounts[i] := 0
                    ELSE
                        StartAmounts[i] := FAGenReport.CalcFAPostedAmount("No.", PostingType, Period1, StartingDate,
                            EndingDate, DeprBookCode, BeforeAmount, EndingAmount, FALSE, TRUE);
                    NetChangeAmounts[i] :=
                      FAGenReport.CalcFAPostedAmount(
                        "No.", PostingType, Period2, StartingDate, EndingDate,
                        DeprBookCode, BeforeAmount, EndingAmount, FALSE, TRUE);
                    IF GetPeriodDisposal THEN
                        DisposalAmounts[i] := -(StartAmounts[i] + NetChangeAmounts[i])
                    ELSE
                        DisposalAmounts[i] := 0;
                    IF i >= 3 THEN
                        AddPostingType(i - 3);
                END;
                FOR j := 1 TO NumberOfTypes DO
                    TotalEndingAmounts[j] := StartAmounts[j] + NetChangeAmounts[j] + DisposalAmounts[j];
                BookValueAtEndingDate := 0;
                BookValueAtStartingDate := 0;
                FOR j := 1 TO NumberOfTypes DO BEGIN
                    BookValueAtEndingDate := BookValueAtEndingDate + TotalEndingAmounts[j];
                    BookValueAtStartingDate := BookValueAtStartingDate + StartAmounts[j];
                END;

                MakeGroupHeadLine;
                UpdateTotals;
                CreateGroupTotals;
            end;

            trigger OnPostDataItem()
            begin
                CreateTotals;
            end;

            trigger OnPreDataItem()
            begin
                CASE GroupTotals OF
                    GroupTotals::"FA Class":
                        SETCURRENTKEY("FA Class Code");
                    GroupTotals::"FA Subclass":
                        SETCURRENTKEY("FA Subclass Code");
                    GroupTotals::"FA Location":
                        SETCURRENTKEY("FA Location Code");
                    GroupTotals::"Main Asset":
                        SETCURRENTKEY("Component of Main Asset");
                    GroupTotals::"Global Dimension 1":
                        SETCURRENTKEY("Global Dimension 1 Code");
                    GroupTotals::"Global Dimension 2":
                        SETCURRENTKEY("Global Dimension 2 Code");
                    GroupTotals::"FA Posting Group":
                        SETCURRENTKEY("FA Posting Group");
                END;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DeprBookCode; DeprBookCode)
                    {
                        Caption = 'Depreciation Book';
                        TableRelation = "Depreciation Book";
                    }
                    field(StartingDate; StartingDate)
                    {
                        Caption = 'Starting Date';
                    }
                    field(EndingDate; EndingDate)
                    {
                        Caption = 'Ending Date';
                    }
                    field(GroupTotals; GroupTotals)
                    {
                        Caption = 'Group Totals';
                        OptionCaption = ' ,FA Class,FA Subclass,FA Location,Main Asset,Global Dimension 1,Global Dimension 2,FA Posting Group';
                    }
                    field(PrintDetails; PrintDetails)
                    {
                        Caption = 'Print per Fixed Asset';
                    }
                    field(BudgetReport; BudgetReport)
                    {
                        Caption = 'Budget Report';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            //GetDepreciationBookCode; PCL-064
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        NumberOfTypes := 6;
        DeprBook.GET(DeprBookCode);
        IF GroupTotals = GroupTotals::"FA Posting Group" THEN
            FAGenReport.SetFAPostingGroup("Fixed Asset", DeprBook.Code);
        FAGenReport.AppendFAPostingFilter("Fixed Asset", StartingDate, EndingDate);
        FAFilter := "Fixed Asset".GETFILTERS;
        MainHeadLineText := Text000;
        IF BudgetReport THEN
            MainHeadLineText := STRSUBSTNO('%1 %2', MainHeadLineText, Text001);
        DeprBookText := STRSUBSTNO('%1%2 %3', DeprBook.TABLECAPTION, ':', DeprBookCode);
        MakeGroupTotalText;
        FAGenReport.ValidateDates(StartingDate, EndingDate);
        MakeDateText;
        MakeHeadLine;
        IF PrintDetails THEN BEGIN
            FANo := "Fixed Asset".FIELDCAPTION("No.");
            FADescription := "Fixed Asset".FIELDCAPTION(Description);
        END;
        Period1 := Period1::"Before Starting Date";
        Period2 := Period2::"Net Change";
    end;

    var
        Text000: Label 'Fixed Asset - Book Value 01';
        Text001: Label '(Budget Report)';
        Text002: Label 'Group Total';
        Text003: Label 'Group Totals';
        Text004: Label 'in Period';
        Text005: Label 'Disposal';
        Text006: Label 'Addition';
        Text007: Label '%1 has been modified in fixed asset %2.';
        FASetup: Record 5603;
        DeprBook: Record 5611;
        FADeprBook: Record 5612;
        FA: Record 5600;
        FAPostingTypeSetup: Record 5604;
        FAGenReport: Codeunit 5626;
        BudgetDepreciation: Codeunit 5615;
        DeprBookCode: Code[10];
        FAFilter: Text;
        MainHeadLineText: Text[100];
        DeprBookText: Text[50];
        GroupCodeName: Text[50];
        GroupHeadLine: Text[50];
        FANo: Text[50];
        FADescription: Text[50];
        GroupTotals: Option " ","FA Class","FA Subclass","FA Location","Main Asset","Global Dimension 1","Global Dimension 2","FA Posting Group";
        HeadLineText: array[10] of Text[50];
        StartAmounts: array[6] of Decimal;
        NetChangeAmounts: array[6] of Decimal;
        DisposalAmounts: array[6] of Decimal;
        GroupStartAmounts: array[6] of Decimal;
        GroupNetChangeAmounts: array[6] of Decimal;
        GroupDisposalAmounts: array[6] of Decimal;
        TotalStartAmounts: array[6] of Decimal;
        TotalNetChangeAmounts: array[6] of Decimal;
        TotalDisposalAmounts: array[6] of Decimal;
        TotalEndingAmounts: array[6] of Decimal;
        BookValueAtStartingDate: Decimal;
        BookValueAtEndingDate: Decimal;
        i: Integer;
        j: Integer;
        NumberOfTypes: Integer;
        PostingType: Integer;
        Period1: Option "Before Starting Date","Net Change","at Ending Date";
        Period2: Option "Before Starting Date","Net Change","at Ending Date";
        StartingDate: Date;
        EndingDate: Date;
        PrintDetails: Boolean;
        BudgetReport: Boolean;
        BeforeAmount: Decimal;
        EndingAmount: Decimal;
        AcquisitionDate: Date;
        DisposalDate: Date;
        StartText: Text[30];
        EndText: Text[30];
        PageCaptionLbl: Label 'Page';
        TotalCaptionLbl: Label 'Total';
        GroupTotalsTxt: Label ' ,FA Class,FA Subclass,FA Location,Main Asset,Global Dimension 1,Global Dimension 2,FA Posting Group';
        Readydate: Date;
        DepStart: Date;
        DepEnd: Date;

    local procedure AddPostingType(PostingType: Option "Write-Down",Appreciation,"Custom 1","Custom 2")
    var
        i: Integer;
        j: Integer;
    begin
        i := PostingType + 3;
        WITH FAPostingTypeSetup DO BEGIN
            CASE PostingType OF
                PostingType::"Write-Down":
                    GET(DeprBookCode, "FA Posting Type"::"Write-Down");
                PostingType::Appreciation:
                    GET(DeprBookCode, "FA Posting Type"::Appreciation);
                PostingType::"Custom 1":
                    GET(DeprBookCode, "FA Posting Type"::"Custom 1");
                PostingType::"Custom 2":
                    GET(DeprBookCode, "FA Posting Type"::"Custom 2");
            END;
            IF "Depreciation Type" THEN
                j := 2
            ELSE
                IF "Acquisition Type" THEN
                    j := 1;
        END;
        IF j > 0 THEN BEGIN
            StartAmounts[j] := StartAmounts[j] + StartAmounts[i];
            StartAmounts[i] := 0;
            NetChangeAmounts[j] := NetChangeAmounts[j] + NetChangeAmounts[i];
            NetChangeAmounts[i] := 0;
            DisposalAmounts[j] := DisposalAmounts[j] + DisposalAmounts[i];
            DisposalAmounts[i] := 0;
        END;
    end;

    local procedure SkipRecord(): Boolean
    begin
        AcquisitionDate := FADeprBook."Acquisition Date";
        DisposalDate := FADeprBook."Disposal Date";
        EXIT(
          "Fixed Asset".Inactive OR
          (AcquisitionDate = 0D) OR
          (AcquisitionDate > EndingDate) AND (EndingDate > 0D) OR
          (DisposalDate > 0D) AND (DisposalDate < StartingDate))
    end;

    local procedure GetPeriodDisposal(): Boolean
    begin
        IF DisposalDate > 0D THEN
            IF (EndingDate = 0D) OR (DisposalDate <= EndingDate) THEN
                EXIT(TRUE);
        EXIT(FALSE);
    end;

    local procedure MakeGroupTotalText()
    begin
        CASE GroupTotals OF
            GroupTotals::"FA Class":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("FA Class Code"));
            GroupTotals::"FA Subclass":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("FA Subclass Code"));
            GroupTotals::"FA Location":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("FA Location Code"));
            GroupTotals::"Main Asset":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("Main Asset/Component"));
            GroupTotals::"Global Dimension 1":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("Global Dimension 1 Code"));
            GroupTotals::"Global Dimension 2":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("Global Dimension 2 Code"));
            GroupTotals::"FA Posting Group":
                GroupCodeName := FORMAT("Fixed Asset".FIELDCAPTION("FA Posting Group"));
        END;
        IF GroupCodeName <> '' THEN
            GroupCodeName := FORMAT(STRSUBSTNO('%1%2 %3', Text003, ':', GroupCodeName));
    end;

    local procedure MakeDateText()
    begin
        StartText := STRSUBSTNO('%1', StartingDate - 1);
        EndText := STRSUBSTNO('%1', EndingDate);
    end;

    local procedure MakeHeadLine()
    var
        InPeriodText: Text[30];
        DisposalText: Text[30];
    begin
        InPeriodText := Text004;
        DisposalText := Text005;
        HeadLineText[1] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION("Acquisition Cost"), StartText);
        HeadLineText[2] := STRSUBSTNO('%1 %2', Text006, InPeriodText);
        HeadLineText[3] := STRSUBSTNO('%1 %2', DisposalText, InPeriodText);
        HeadLineText[4] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION("Acquisition Cost"), EndText);
        HeadLineText[5] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION(Depreciation), StartText);
        HeadLineText[6] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION(Depreciation), InPeriodText);
        HeadLineText[7] := STRSUBSTNO(
            '%1 %2 %3', DisposalText, FADeprBook.FIELDCAPTION(Depreciation), InPeriodText);
        HeadLineText[8] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION(Depreciation), EndText);
        HeadLineText[9] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION("Book Value"), StartText);
        HeadLineText[10] := STRSUBSTNO('%1 %2', FADeprBook.FIELDCAPTION("Book Value"), EndText);
    end;

    local procedure MakeGroupHeadLine()
    begin
        FOR j := 1 TO NumberOfTypes DO BEGIN
            GroupStartAmounts[j] := 0;
            GroupNetChangeAmounts[j] := 0;
            GroupDisposalAmounts[j] := 0;
        END;
        WITH "Fixed Asset" DO
            CASE GroupTotals OF
                GroupTotals::"FA Class":
                    GroupHeadLine := FORMAT("FA Class Code");
                GroupTotals::"FA Subclass":
                    GroupHeadLine := FORMAT("FA Subclass Code");
                GroupTotals::"FA Location":
                    GroupHeadLine := FORMAT("FA Location Code");
                GroupTotals::"Main Asset":
                    BEGIN
                        FA."Main Asset/Component" := FA."Main Asset/Component"::"Main Asset";
                        GroupHeadLine :=
                          FORMAT(STRSUBSTNO('%1 %2', FORMAT(FA."Main Asset/Component"), "Component of Main Asset"));
                        IF "Component of Main Asset" = '' THEN
                            GroupHeadLine := FORMAT(STRSUBSTNO('%1 %2', GroupHeadLine, '*****'));
                    END;
                GroupTotals::"Global Dimension 1":
                    GroupHeadLine := FORMAT("Global Dimension 1 Code");
                GroupTotals::"Global Dimension 2":
                    GroupHeadLine := FORMAT("Global Dimension 2 Code");
                GroupTotals::"FA Posting Group":
                    GroupHeadLine := FORMAT("FA Posting Group");
            END;
        IF GroupHeadLine = '' THEN
            GroupHeadLine := FORMAT('*****');
    end;

    local procedure UpdateTotals()
    begin
        FOR j := 1 TO NumberOfTypes DO BEGIN
            GroupStartAmounts[j] := GroupStartAmounts[j] + StartAmounts[j];
            GroupNetChangeAmounts[j] := GroupNetChangeAmounts[j] + NetChangeAmounts[j];
            GroupDisposalAmounts[j] := GroupDisposalAmounts[j] + DisposalAmounts[j];
            TotalStartAmounts[j] := TotalStartAmounts[j] + StartAmounts[j];
            TotalNetChangeAmounts[j] := TotalNetChangeAmounts[j] + NetChangeAmounts[j];
            TotalDisposalAmounts[j] := TotalDisposalAmounts[j] + DisposalAmounts[j];
        END;
    end;

    local procedure CreateGroupTotals()
    begin
        FOR j := 1 TO NumberOfTypes DO
            TotalEndingAmounts[j] :=
              GroupStartAmounts[j] + GroupNetChangeAmounts[j] + GroupDisposalAmounts[j];
        BookValueAtEndingDate := 0;
        BookValueAtStartingDate := 0;
        FOR j := 1 TO NumberOfTypes DO BEGIN
            BookValueAtEndingDate := BookValueAtEndingDate + TotalEndingAmounts[j];
            BookValueAtStartingDate := BookValueAtStartingDate + GroupStartAmounts[j];
        END;
    end;

    local procedure CreateTotals()
    begin
        FOR j := 1 TO NumberOfTypes DO
            TotalEndingAmounts[j] :=
              TotalStartAmounts[j] + TotalNetChangeAmounts[j] + TotalDisposalAmounts[j];
        BookValueAtEndingDate := 0;
        BookValueAtStartingDate := 0;
        FOR j := 1 TO NumberOfTypes DO BEGIN
            BookValueAtEndingDate := BookValueAtEndingDate + TotalEndingAmounts[j];
            BookValueAtStartingDate := BookValueAtStartingDate + TotalStartAmounts[j];
        END;
    end;

    local procedure GetStartingDate(StartingDate: Date): Date
    begin
        IF StartingDate <= 00000101D THEN
            EXIT(0D);

        EXIT(StartingDate - 1);
    end;

    [Scope('Internal')]
    procedure SetMandatoryFields(DepreciationBookCodeFrom: Code[10]; StartingDateFrom: Date; EndingDateFrom: Date)
    begin
        DeprBookCode := DepreciationBookCodeFrom;
        StartingDate := StartingDateFrom;
        EndingDate := EndingDateFrom;
    end;

    [Scope('Internal')]
    procedure SetTotalFields(GroupTotalsFrom: Option; PrintDetailsFrom: Boolean; BudgetReportFrom: Boolean)
    begin
        GroupTotals := GroupTotalsFrom;
        PrintDetails := PrintDetailsFrom;
        BudgetReport := BudgetReportFrom;
    end;

    [Scope('Internal')]
    procedure GetDepreciationBookCode()
    begin
        IF DeprBookCode = '' THEN BEGIN
            FASetup.GET;
            DeprBookCode := FASetup."Default Depr. Book";
        END;
    end;
}

