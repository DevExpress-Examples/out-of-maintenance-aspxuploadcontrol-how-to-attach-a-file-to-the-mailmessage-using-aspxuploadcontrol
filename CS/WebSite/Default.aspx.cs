using System;
using System.Net;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page {
    const string HOST_ADDRESS = "###";
    const int HOST_PORT = 0;
    const string HOST_USERNAME = "###";
    const string HOST_PASSWORD = "###";

    protected void uc_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e) {
        //It is not allowed to post messages in the online mode. Download this example on your machine and remove this restriction
        bool isOnlineMode = true;
        if(!isOnlineMode) {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(FromTB.Text.Trim());
            mail.To.Add(new MailAddress(SendToTB.Text.Trim()));
            mail.Body = MailBody.Html;
            mail.Attachments.Add(new Attachment(e.UploadedFile.FileContent, e.UploadedFile.FileName));

            SmtpClient smtp = new SmtpClient(HOST_ADDRESS, HOST_PORT);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(HOST_USERNAME, HOST_PASSWORD);
            smtp.Send(mail);
        }
    }
}