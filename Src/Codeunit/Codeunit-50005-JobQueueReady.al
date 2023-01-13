// codeunit 50005 "Job Queue Ready"
// {
//     Permissions = TableData 50016 = rm;

//     trigger OnRun()
//     begin
//         CreateandSendEmail;
//         // JobQueueEntry.SETRANGE(Status,JobQueueEntry.Status::Finished);
//         // IF JobQueueEntry.FINDSET THEN
//         //  REPEAT
//         //    CreateandSendEmail
//         //  UNTIL JobQueueEntry.NEXT = 0;
//         // JobQueueEntry.SETRANGE(Status,JobQueueEntry.Status::Error);
//         // IF JobQueueEntry.FINDSET THEN
//         //  REPEAT
//         //    JobQueueEntry.SetStatus(JobQueueEntry.Status::Ready);
//         //  UNTIL JobQueueEntry.NEXT = 0;
//     end;

//     var
//         JobQueueEntry: Record 472;

//     [Scope('Internal')]
//     procedure CreateandSendEmail()
//     var
//         EmailItem: Record 9500;
//         MailManagement: Codeunit 9520;
//         DotNetExceptionHandler: Codeunit 1291;
//         OutStream: OutStream;
//         RecRef: RecordRef;
//         SMTPSetupErr: Label 'The SMTP Setup does not exist.';
//         JobQueue: Record 470;
//         CurrentTime: DateTime;
//         OldTime: DateTime;
//         cDate: Date;
//         cTime: Time;
//         oDate: Date;
//         oTime: Time;
//         MailToBeSent: Boolean;
//         diffdate: Integer;
//         difftime: Integer;
//         NASService: Text;
//         JobQueueCode: Code[20];
//     begin
//         EmailItem.Init;
//         EmailItem."From Name" := COMPANYNAME;
//         EmailItem.Subject := 'Seamec Job queue ERROR';
//         EmailItem."From Address" := 'samridhi.binjola@onactuate.com';
//         EmailItem."Send to" := 'samridhi.binjola@onactuate.com';
//         //EmailItem."Send CC" := 'singh.sandeep@onactuate.com';
//         EmailItem.Body.CREATEOUTSTREAM(OutStream);
//         JobQueueCode := JobQueue.Code;
//         OutStream.WRITE('Dear Sir / Madam,' + '<br><br>' +
//                         'Kindly check Dynamics NAV job queue' + JobQueueEntry.Description + ' is in error stage.' + '<br><br>' +
//                         'ERROR :' + JobQueueEntry.GetErrorMessage + '<br>' +
//                         'Job Queue Code :' + JobQueueCode + '<br><br>' +
//                         'Regards' + '<br>' + 'Seamec pvt limited ');


//         // IF MailManagement.IsSMTPEnabled AND MailManagement.IsEnabled THEN BEGIN
//         MailManagement.InitializeFrom(TRUE, FALSE);
//         IF NOT MailManagement.Send(EmailItem) THEN BEGIN
//             DotNetExceptionHandler.Collect;
//             ERROR(DotNetExceptionHandler.GetMessage);
//         END ELSE
//             MESSAGE('Mail Sent');
//         //END;
//         //END;
//     end;

//     [Scope('Internal')]
//     procedure SendEmail()
//     var
//         EmailItem: Record 9500;
//         MailManagement: Codeunit 9520;
//         DotNetExceptionHandler: Codeunit 1291;
//         OutStream: OutStream;
//         RecRef: RecordRef;
//         SMTPSetupErr: Label 'The SMTP Setup does not exist.';
//         JobQueue: Record 470;
//         CurrentTime: DateTime;
//         OldTime: DateTime;
//         cDate: Date;
//         cTime: Time;
//         oDate: Date;
//         oTime: Time;
//         MailToBeSent: Boolean;
//         diffdate: Integer;
//         difftime: Integer;
//         NASService: Text;
//         JobQueueCode: Code[20];
//     begin
//         // cDate := DT2DATE(CURRENTDATETIME);
//         // cTime := DT2TIME(CURRENTDATETIME);
//         // MailToBeSent := FALSE;
//         // oDate := 0D;
//         // oTime := 0T;
//         // IF IntegreonSetup."No. of NAS error To be Sent" < 6 THEN BEGIN
//         //  IF JobQueue.FINDFIRST THEN BEGIN
//         //    REPEAT
//         //      CLEAR(OldTime);
//         //      CLEAR(MailToBeSent);
//         //      OldTime := CREATEDATETIME(cDate-10,0T);
//         //
//         //      IF DT2TIME(JobQueue."Last Heartbeat") <> 0T THEN
//         //        OldTime := JobQueue."Last Heartbeat";
//         //
//         //      oDate := DT2DATE(OldTime);
//         //      oTime := DT2TIME(OldTime);
//         //
//         //      //oDate := cDate;//Temporary for testing
//         //      //cTime := cTime;//Temporary for testing
//         //
//         //      diffdate := (cDate - oDate);
//         //      difftime := (cTime - oTime) DIV 1000 DIV 60 DIV 60;
//         //
//         //      {
//         //      Hours := Milliseconds DIV 1000 DIV 60 DIV 60;
//         //      Milliseconds -= Hours * 1000 * 60 * 60;
//         //
//         //      Minutes := Milliseconds DIV 1000 DIV 60;
//         //      Milliseconds -= Minutes * 1000 * 60;
//         //
//         //      Seconds := Milliseconds DIV 1000;
//         //      Milliseconds -= Seconds * 1000;
//         //      }
//         //
//         //      //MESSAGE('diffdate %1  difftime %2',diffdate,difftime);
//         //      IF diffdate > 0 THEN BEGIN
//         //        MailToBeSent := TRUE;
//         //        IF MailToBeSent = FALSE THEN BEGIN
//         //          IF difftime > 2 THEN
//         //            MailToBeSent := TRUE;
//         //        END;
//         //      END;
//         //
//         //      IF MailToBeSent THEN BEGIN
//         //        EmailItem.Init;
//         //        EmailItem."From Name" := COMPANYNAME;
//         //        EmailItem.Subject := 'Dynamics NAV NAS Service not responding';
//         //        EmailItem."From Address" := 'samridhi.binjola@onactuate.com';
//         //        EmailItem."Send to" := 'samridhi.binjola@onactuate.com';
//         //        EmailItem."Send CC" := 'singh.sandeep@onactuate.com';
//         //        EmailItem.Body.CREATEOUTSTREAM(OutStream);
//         //        NASService := JobQueue."Start on This NAS Instance";
//         //        JobQueueCode := JobQueue.Code;
//         //        OutStream.WRITE('Dear Sir / Madam,'+'<br><br>'+
//         //                        'Kindly check Dynamics NAV NAS Service is not responding.'+'<br><br>'+
//         //                        'NAS Service Name :'+ NASService +'<br>'+
//         //                        'Job Queue Code :'+ JobQueueCode +'<br><br>'+
//         //                        'Regards'+'<br>' +'Company IT Departments ');
//         //
//         //
//         //        IF MailManagement.IsSMTPEnabled AND MailManagement.IsEnabled THEN BEGIN
//         //          MailManagement.InitializeFrom(TRUE,FALSE);
//         //          IF NOT MailManagement.Send(EmailItem) THEN BEGIN
//         //            DotNetExceptionHandler.Collect;
//         //            ERROR(DotNetExceptionHandler.GetMessage);
//         //          END;
//         //        END ELSE
//         //          ERROR(SMTPSetupErr);
//         //       END;
//         //    UNTIL JobQueue.NEXT = 0;
//         //  END;
//         //
//         // END;
//     end;
// }

