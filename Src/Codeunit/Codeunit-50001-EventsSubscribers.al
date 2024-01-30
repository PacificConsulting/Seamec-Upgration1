codeunit 50001 EventSubscribers
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post + Print", 'OnBeforeOnRun', '', false, false)]
    local procedure checkinvendoremail(var PurchaseHeader: Record "Purchase Header"; var PurchaseHeaderRec: Record "Purchase Header")
    var
        vend: Record Vendor;
        purch: Page "Purchase Order";
    begin
        vend.Reset();
        vend.SetRange("No.", PurchaseHeaderRec."Buy-from Vendor No.");
        if vend.FindFirst() then
            vend.TestField("E-Mail");
    end;

    [EventSubscriber(ObjectType::Page, page::"Purchase Invoice", 'OnBeforeActionEvent', 'Preview', false, false)]
    local procedure checkinvendoremailPurchaseinvoiceCard(var Rec: Record "Purchase Header")
    var
        vend: Record Vendor;

    begin
        vend.Reset();
        vend.SetRange("No.", Rec."Buy-from Vendor No.");
        if vend.FindFirst() then
            vend.TestField("E-Mail");
    end;

    [EventSubscriber(ObjectType::Page, page::"Purchase Invoices", 'OnBeforeActionEvent', 'Preview', false, false)]
    local procedure checkinvendoremailPurchaseinvoiceList(var Rec: Record "Purchase Header")
    var
        vend: Record Vendor;

    begin
        vend.Reset();
        vend.SetRange("No.", Rec."Buy-from Vendor No.");
        if vend.FindFirst() then
            vend.TestField("E-Mail");
    end;

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


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeOnRun', '', false, false)]
    local procedure Checking(var PurchaseHeader: Record "Purchase Header")
    var
        Recvendor: Record Vendor;
    begin
        Recvendor.Reset();
        Recvendor.SetRange("No.", PurchaseHeader."Buy-from Vendor No.");
        if Recvendor.FindFirst() then begin
            Recvendor.TestField("E-Mail");
        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure InsertInvoiceHeader(PurchInvHdrNo: Code[20])
    var
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        PurchInvHeader.Reset();
        PurchInvHeader.SetRange("No.", PurchInvHdrNo);
        if PurchInvHeader.FindFirst() then
            SendEmail2(PurchInvHeader);
    end;

    procedure SendEmail(RecPurInvHdr: Record "Purch. Inv. Header")
    var
        EMail: Codeunit Email;
        Emailmessage: Codeunit "Email Message";
        Char: Char;
        Body: Text;
        Recvendor: Record Vendor;
    begin
        RecPurInvHdr.Reset();
        RecPurInvHdr.SETRANGE("No.", RecPurInvHdr."Buy-from Vendor No.");
        IF RecPurInvHdr.FINDFIRST THEN;
        Body := 'Dear Vendor' + Recvendor.Name;
        Body := 'Greetings from Seamec Limited!!';
        Body := 'We are in receipt of your invoice with following details. It gives us immense pleasure to inform you that the invoice has been successfully booked in our system.';
        Body := 'Invoice No: ' + RecPurInvHdr."Vendor Invoice No.";
        Body := 'Invoice Date:' + Format(RecPurInvHdr."Document Date");
        Body := 'Invoice Amount:' + Format(RecPurInvHdr.Amount);
        //  Body := 'PO/WO No.:' + ;
        Body := 'Purchase Ref. No.:' + RecPurInvHdr."No." + 'Dated:' + Format(RecPurInvHdr."Posting Date") + '(This can be used for your future references)';

        Body := '<p><font face="Georgia"><B>Thanks, and Best Regards,</B></font></p>';

        EmailMessage.Create(Recvendor."E-Mail", 'This is the subject', Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


        EMail.Send(Emailmessage, Enum::"Email Scenario"::Default);
    end;


    procedure SendEmail2(RecPurInvHdr: Record "Purch. Inv. Header")
    //procedure sendinginvoices(customer: Code[50])
    var
        EmailMsg: Codeunit "Email Message";
        EmailObj: Codeunit Email;
        Char: Char;
        Recvendor: Record Vendor;
        RecPurInvHdr2: Record "Purch. Inv. Header";
        recreceipt: Record "Purch. Rcpt. Header";
        RecPurInvLine: Record "Purch. Inv. Line";
    begin

        Recvendor.Reset();
        Recvendor.SetRange("No.", RecPurInvHdr."Buy-from Vendor No.");
        if Recvendor.FindFirst() then begin
            Recvendor.TestField("E-Mail");
        end;

        RecPurInvHdr2.Reset();
        RecPurInvHdr2.SetRange("No.", RecPurInvHdr."No.");
        if RecPurInvHdr2.FindFirst() then begin

            EmailMsg.Create(Recvendor."E-Mail", 'Purchase Invoice: ' + RecPurInvHdr2."No.", '', true);
            EmailMsg.AppendToBody('<p><font face="Georgia">Dear Vendor ' + RecPurInvHdr2."Buy-from Vendor Name" + ',</font></p>');
            Char := 13;
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('<p><font face="Georgia">Greetings from Seamec Limited!!</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('<p><font face="Georgia">We are in receipt of your invoice with following details. It gives us immense pleasure to inform you that the invoice has been successfully booked in our system.</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('<p><font face="Georgia">Invoice No:' + RecPurInvHdr2."Vendor Invoice No." + '</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('<p><font face="Georgia">Invoice Date:' + Format(RecPurInvHdr2."Document Date") + '</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));
            RecPurInvHdr2.CalcFields("Amount Including VAT");
            EmailMsg.AppendToBody('<p><font face="Georgia">Invoice Amount:' + Format(RecPurInvHdr2."Amount Including VAT") + '</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));

            RecPurInvLine.Reset();
            RecPurInvLine.SetRange("Document No.", RecPurInvHdr2."No.");
            RecPurInvLine.SetRange(Type, RecPurInvLine.Type::Item);
            if RecPurInvLine.FindFirst() then begin
                recreceipt.Reset();
                recreceipt.SetRange("No.", RecPurInvLine."Receipt No.");
                if recreceipt.FindFirst() then begin
                end;
            end;
            EmailMsg.AppendToBody('<p><font face="Georgia">PO/WO No.:' + Format(recreceipt."Order No.") + '</font></p>');

            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('<p><font face="Georgia">Purchase Ref. No.:' + RecPurInvHdr2."No." + ' Dated:' + Format(RecPurInvHdr2."Posting Date") + ' (This can be used for your future references)' + '</font></p>');
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody(FORMAT(Char));
            EmailMsg.AppendToBody('</BR></BR><font face="Georgia">Thanks, and Best Regards,</font>');


            //**** Email Send Function ****

            EmailObj.Send(EmailMsg, Enum::"Email Scenario"::Default);
        end;
    end;

    var
        myInt: Integer;
}