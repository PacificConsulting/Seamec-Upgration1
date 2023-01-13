tableextension 50013 UserIDExt extends "User Setup"
{
    fields
    {
        field(50001; "Vendor Master"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Customer Master"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Fixed Asset"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "G/L Account"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Bank Master"; boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Journal Voucher Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Journal Voucher Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50008; "Cash Payment Approval"; boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Cash Payment Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50010; "Bank Contra Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Bank Contra Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50012; "Bank Payment Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Bank Payment Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50014; "Bank Reciept Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Bank Reciept Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50016; "Purchase Journal Approver ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50017; "Purchase Journal Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Recurring Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Recurring Approval ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50020; "Cash Reciept Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Cash Reciept Approval ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50022; "Limited JV Approval Limit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Jounal Voucher Approval Limit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "Bank Payment Aproval Limit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "FA Journal Approval ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50026; "FA Journal Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "Self Approver"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Approve Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Approve Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
        myInt: Integer;
}