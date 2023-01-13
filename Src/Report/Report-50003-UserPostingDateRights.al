report 50003 "User Posting Date Rights"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Src/Report Layout/UserPostingDateRights.rdl';

    dataset
    {
        dataitem("User Setup"; "User Setup")
        {
            DataItemTableView = SORTING("User ID")
                                ORDER(Ascending);
            RequestFilterFields = "User ID";
            column(UserID; "User Setup"."User ID")
            {
            }
            column(AllowPostingForm; "User Setup"."Allow Posting From")
            {
            }
            column(AllowPostingTo; "User Setup"."Allow Posting To")
            {
            }
            column(boolProc; boolprocess)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //PCPL0017


                GeneralLedgerSetup.GET;
                //"User Setup"."Allow Posting From" := CALCDATE(GeneralLedgerSetup."User Posting Date Period",TODAY);

                "User Setup"."Allow Posting To" := TODAY;

                "User Setup".MODIFY;

                //PCPL0017
            end;
        }
        dataitem("FA Setup"; "FA Setup")
        {
            DataItemTableView = SORTING("Primary Key")
                                ORDER(Ascending);
            column(FAFrom; "FA Setup"."Allow FA Posting From")
            {
            }
            column(FATo; "FA Setup"."Allow FA Posting To")
            {
            }
            column(boolFA; boolFA)
            {
            }
            column(USEIFA; USEIDFA)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                IF boolFA THEN BEGIN
                IF frmdate=0D THEN
                ERROR('Please Specify Start Date');
                IF todate=0D THEN
                ERROR('Please Specify End Date');
                USEIDFA:="User Setup"."User ID";
                "FA Setup"."Allow FA Posting From":=frmdate;
                "FA Setup"."Allow FA Posting To":=todate;
                "FA Setup".MODIFY;
                END;
                */

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Allow Posting From"; frmdate)
                    {
                    }
                    field("Allow Posting To"; todate)
                    {
                    }
                    field("Process update"; boolprocess)
                    {
                    }
                    field("Process FA"; boolFA)
                    {
                    }
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

    var
        frmdate: Date;
        todate: Date;
        boolprocess: Boolean;
        UserSetup1: Record 91;
        boolFA: Boolean;
        USEIDFA: Code[30];
        USERNEW: Record 91;
        GeneralLedgerSetup: Record 98;

    local procedure Testcode()
    begin


        /*
        IF boolFA THEN BEGIN
        
          "User Setup"."Allow FA Posting From":=frmdate;
          "User Setup"."Allow FA Posting To":=todate;
          "User Setup".MODIFY;
        
        END;
        
        IF boolFA THEN BEGIN
        IF frmdate=0D THEN
        ERROR('Please Specify Start Date');
        IF todate=0D THEN
        ERROR('Please Specify End Date');
        USEIDFA:="User Setup"."User ID";
        "FA Setup"."Allow FA Posting From":=frmdate;
        "FA Setup"."Allow FA Posting To":=todate;
        "FA Setup".MODIFY;
        END;
        */

    end;
}

