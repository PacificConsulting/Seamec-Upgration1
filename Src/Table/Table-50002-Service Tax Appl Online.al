table 50002 "Service Tax Appl Online"
{
    // PS60184   Bhuvnesh Soni       04/08/11    Table added for Service tax Hotfix

    Caption = 'Service Tax Application Online';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            Editable = false;
            OptionCaption = 'Sale,Purchase,Charge';
            OptionMembers = Sale,Purchase,Charge;
        }
        field(2; "Service Tax Group Code"; Code[20])
        {
            Caption = 'Service Tax Group Code';
            Editable = false;
            // TableRelation = "Service Tax Groups"; //pcpl-065
        }
        field(3; "Service Tax Registration No."; Code[20])
        {
            Caption = 'Service Tax Registration No.';
            Editable = false;
            //TableRelation = "Service Tax Registration Nos."; //pcpl-065
        }
        field(4; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            Editable = false;
        }
        field(7; "Party Code"; Code[20])
        {
            Caption = 'Party Code';
            Editable = false;
        }
        field(10; "Service Tax Base Amount"; Decimal)
        {
            Caption = 'Service Tax Base Amount';
            Editable = false;
        }
        field(11; "Service Tax Amount"; Decimal)
        {
            Caption = 'Service Tax Amount';
            Editable = false;
        }
        field(12; "Service Tax eCess Amount"; Decimal)
        {
            Caption = 'Service Tax eCess Amount';
            Editable = false;
        }
        field(13; "Service Tax %"; Decimal)
        {
            Caption = 'Service Tax %';
            Editable = false;
        }
        field(14; "Service Tax eCess %"; Decimal)
        {
            Caption = 'Service Tax eCess %';
            Editable = false;
        }
        field(15; "Service Tax Abatement"; Decimal)
        {
            Caption = 'Service Tax Abatement';
            Editable = false;
        }
        field(20; "Goes to Excise Entry"; Boolean)
        {
            Caption = 'Goes to Excise Entry';
            Editable = false;
        }
        field(21; "From Excise"; Boolean)
        {
            Caption = 'From Excise';
            Editable = false;
        }
        field(30; "Dimension Entry No."; Integer)
        {
            Caption = 'Dimension Entry No.';
            Editable = false;
        }
        field(50; "Location E.C.C. No."; Code[20])
        {
            Caption = 'Location E.C.C. No.';
            Editable = false;
            // TableRelation = "E.C.C. Nos."; //pcpl-065
        }
        field(51; "RG Record Type"; Option)
        {
            Caption = 'RG Record Type';
            Editable = false;
            OptionCaption = ' ,RG23A,RG23C';
            OptionMembers = " ",RG23A,RG23C;
        }
        field(55; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(56; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(57; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(58; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
        }
        field(59; GTA; Boolean)
        {
            Caption = 'GTA';
            Editable = false;
        }
        field(60; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
            Editable = false;
        }
        field(62; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = false;
        }
        field(63; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            Editable = false;
        }
        field(64; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(65; "Service Tax SHE Cess Amount"; Decimal)
        {
            Caption = 'Service Tax SHE Cess Amount';
            Editable = false;
        }
        field(66; "Service Tax SHE Cess %"; Decimal)
        {
            Caption = 'Service Tax SHE Cess %';
            Editable = false;
        }
        field(67; "Additional Reporting Curr. Amt"; Decimal)
        {
            Caption = 'Additional Reporting Curr. Amt';
            Editable = false;
        }
        field(68; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(69; "Tot. Serv Tax Amount (Intm)"; Decimal)
        {
            Caption = 'Tot. Serv Tax Amount (Intm)';
            Editable = false;
        }
        field(70; "S. Tax Base Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax Base Amount (Intm)';
            Editable = false;
        }
        field(71; "S. Tax Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax Amount (Intm)';
            Editable = false;
        }
        field(72; "S. Tax eCess Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax eCess Amount (Intm)';
            Editable = false;
        }
        field(73; "S. Tax SHE Cess Amount (Intm)"; Decimal)
        {
            Caption = 'S. Tax SHE Cess Amount (Intm)';
            Editable = false;
        }
        field(74; "Amt. Incl. Service Tax (Intm)"; Decimal)
        {
            Caption = 'Amt. Incl. Service Tax (Intm)';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Type, "Service Tax Group Code", "Service Tax Registration No.", "Dimension Entry No.", "Goes to Excise Entry", "From Excise", "Location E.C.C. No.", "RG Record Type", "Line No.", "Account No.", "Cheque No.", GTA, "Transaction No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

