pageextension 50016 TDSEntriesExt extends "TDS Entries"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    Begin
        IF Rec."Party Type" = Rec."Party Type"::Vendor THEN BEGIN
            recVendor.GET(Rec."Party Code");
            dataPartyName := recVendor.Name;
        END ELSE
            IF Rec."Party Type" = "Party Type"::Customer THEN BEGIN
                recCustomer.GET(Rec."Party Code");
                dataPartyName := recCustomer.Name;
            END ELSE
                IF Rec."Party Type" = Rec."Party Type"::Party THEN BEGIN
                    recParties.GET(Rec."Party Code");
                    dataPartyName := recParties.Name;
                END;
    End;

    var
        myInt: Integer;
        recVendor: Record Vendor;
        dataPartyName: Text[50];
        recParties: Record Party;
        recCustomer: Record Customer;
}