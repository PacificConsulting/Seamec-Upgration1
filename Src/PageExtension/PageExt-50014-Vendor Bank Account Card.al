pageextension 50014 VendorBankAccCard extends "Vendor Bank Account Card"
{
    layout
    {
        addbefore("SWIFT Code")
        {
            field("Bank Account No. 2"; Rec."Bank Account No.")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var

                begin
                    RecVendorBankAcc.RESET;
                    RecVendorBankAcc.SETRANGE(RecVendorBankAcc."Bank Account No.", Rec."Bank Account No.");
                    IF RecVendorBankAcc.FINDFIRST THEN
                        ERROR('Vendor Bank Account No. same.please check the Bank Account No.' + 'Vendor No' + ' ' + RecVendorBankAcc."Vendor No.")
                end;
            }
            field("IFSC Code"; Rec."IFSC Code")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                Begin
                    IF (RecVendorBankAcc."Bank Account No." = Rec."Bank Account No.") AND (RecVendorBankAcc."IFSC Code" = Rec."IFSC Code") THEN
                        ERROR('Bank Acc details exist with one or more Vendors');
                End;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        RecVendorBankAcc: Record "Vendor Bank Account";
}