// page 60016 Execute
// {
//     ApplicationArea = All;
//     UsageCategory = Lists;

//     layout
//     {
//         area(content)
//         {
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("Send Stock Item")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendStockItemRequest(); //pcpl-065
//                 end;
//             }
//             action("Send Service Item")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendServiceItemRequest();
//                 end;
//             }
//             action("Send Vendor Status")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendVendorRequest();
//                 end;
//             }
//             action(SendStockItem)
//             {

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendStockItemRequest; //pcpl-065
//                 end;
//             }
//             action(SendServiceItem)
//             {

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendServiceItemRequest;
//                 end;
//             }
//             action(SendVendor)
//             {

//                 trigger OnAction()
//                 begin
//                     // EAMInterface.SendVendorRequest;
//                 end;
//             }
//             action(SendPaymentTerm)
//             {

//                 trigger OnAction()
//                 var
//                 //EAMInterface: Codeunit 50004; //pcpl-065
//                 begin
//                     // EAMInterface.SendPaymentTermRequest;
//                 end;
//             }
//             action("Review EAM")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     // ProcessEAMMaster.ReviewEamStagging;
//                 end;
//             }
//             action("Create Vendor ")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Create Item")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Create Employee")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Create Payment")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Create UOM")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Create Item UOM")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Review Employee")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Review Item UOM")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Review Item")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Review Payment")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//             action("Review UOM")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//             }
//         }
//     }

//     var
//         Month: Option January,February,March,April,May,June,July,August,September,October,November,December;
//         MonthEndDate: Date;
//         DateRec: Record 2000000007;
//         Month1: Text;
//         MonthValue: Integer;
//         StartDate: Date;
//         CurrentYear: Integer;
//         StoreCode: Code[10];
//         Text001: Label 'Please process the pending entries in Phys. Inventory Journal for Store location %1.';
//         DeptCode: Code[20];
//         Year: Integer;
//         //EAMInterface: Codeunit 50015; //pcpl-065
//         ProcessEAMMaster: Codeunit 50001;

//     local procedure CalculateDate()
//     begin
//         DateRec.RESET;
//         DateRec.SETRANGE("Period Type", DateRec."Period Type"::Month);
//         DateRec.SETRANGE("Period Name", FORMAT(Month));
//         IF DateRec.FINDFIRST THEN
//             MonthValue := DateRec."Period No.";
//         //>>OA.RG.20180102
//         //CurrentYear := DATE2DMY(TODAY,3);
//         IF Year = 0 THEN
//             CurrentYear := DATE2DMY(TODAY, 3)
//         ELSE
//             CurrentYear := Year;
//         //<<OA.RG.20180102
//         StartDate := DMY2DATE(1, MonthValue, CurrentYear);
//         DateRec.SETRANGE("Period Start", StartDate);
//         IF DateRec.FINDFIRST THEN
//             MonthEndDate := NORMALDATE(DateRec."Period End");
//     end;
// }

