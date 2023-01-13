codeunit 50002 "Tables-EventSubscribers"
{
    // START ******************** Table-123*****************************
    [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Line", 'OnAfterInitFromPurchLine', '', false, false)]
    local procedure OnAfterInitFromPurchLine(PurchInvHeader: Record "Purch. Inv. Header"; PurchLine: Record "Purchase Line"; var PurchInvLine: Record "Purch. Inv. Line");
    begin
        PurchInvLine."Purchase Line No." := PurchLine."Line No.";
    end;
    // END ******************** Table-123*****************************
    var
        myInt: Integer;
}