table 50007 "Payment Ledger Entry"
{
    Caption = 'Payment Ledger Entry';
    DrillDownPageID = 29;
    LookupPageID = 29;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            MinValue = 1;
        }
        field(2; "Applied VLE Entry No."; Integer)
        {
            Caption = 'Applied VLE Entry No.';
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; "Payment Posting Date"; Date)
        {
            Caption = 'Payment Posting Date';
        }
        field(5; "Payment Document No."; Code[20])
        {
            Caption = 'Payment Document No.';

            trigger OnLookup()
            var
                IncomingDocument: Record 130;
            begin
            end;
        }
        field(6; "Invoice Document No."; Code[20])
        {
            Caption = 'Invoice Document No.';

            trigger OnLookup()
            var
                IncomingDocument: Record 130;
            begin
            end;
        }
        field(7; "Invoice Posting Date"; Date)
        {
            Caption = 'Invoice Posting Date';
        }
        field(8; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(10; "Applied Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Applied Amount (LCY)';
        }
        field(11; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(12; "Replicate in EAM"; Boolean)
        {
        }
        field(13; "Replicated in EAM"; Boolean)
        {
        }
        field(14; "VLE Entry No."; Integer)
        {
            Caption = 'VLE Entry No.';
        }
        field(15; Unapply; Boolean)
        {
        }
        field(16; "Purchase Order No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Invoice Posting Date", "Vendor No.", "Payment Posting Date", "Payment Document No.", "Invoice Document No.")
        {
        }
        // fieldgroup(Brick; "Invoice Document No.", "Invoice Posting Date", "Purchase Order No", Field37) //pcpl-065
        // {
        // }
    }

    trigger OnInsert()
    var
        GenJnlPostPreview: Codeunit 19;
    begin
    end;
}

