codeunit 50001 EventSubscribers
{

    // START  ********************************CU 12 ******************************************
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', false, false)]
    local procedure OnBeforeCustLedgEntryInsert(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; var NextEntryNo: Integer);
    begin
        if GenJournalLine."Currency Factor" > 0 then
            CustLedgerEntry."Exchange Factor" := 1 / GenJournalLine."Currency Factor";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeVendLedgEntryInsert', '', false, false)]
    local procedure OnBeforeVendLedgEntryInsert(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register");
    begin
        if GenJournalLine."Currency Factor" > 0 then
            VendorLedgerEntry."Exchange Factor" := 1 / GenJournalLine."Currency Factor";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitVendLedgEntry', '', false, false)]
    local procedure OnAfterInitVendLedgEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line"; var GLRegister: Record "G/L Register");
    var
        recpinv: Record 122;
    begin
        recpinv.RESET;
        recpinv.SETRANGE(recpinv."No.", VendorLedgerEntry."Document No.");
        IF recpinv.FINDFIRST THEN;
        VendorLedgerEntry."Purchase Order No." := recpinv."Vendor Order No.";
    end;
    // END  ********************************CU 12 ******************************************

    // START *******************************CU 113*********************************************
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Vend. Entry-Edit", 'OnBeforeVendLedgEntryModify', '', false, false)]
    local procedure OnBeforeVendLedgEntryModify(var VendLedgEntry: Record "Vendor Ledger Entry"; FromVendLedgEntry: Record "Vendor Ledger Entry");
    begin
        VendLedgEntry."Print Document" := FromVendLedgEntry."Print Document";
    end;
    // END *******************************CU 113*********************************************


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