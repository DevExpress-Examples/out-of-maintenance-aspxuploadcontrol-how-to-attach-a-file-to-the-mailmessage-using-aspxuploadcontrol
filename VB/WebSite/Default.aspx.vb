Imports Microsoft.VisualBasic
Imports System
Imports System.Net
Imports System.Net.Mail

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private Const HOST_ADDRESS As String = "###"
	Private Const HOST_PORT As Integer = 0
	Private Const HOST_USERNAME As String = "###"
	Private Const HOST_PASSWORD As String = "###"

	Protected Sub uc_FileUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs)
		'It is not allowed to post messages in the online mode. Download this example on your machine and remove this restriction
		Dim isOnlineMode As Boolean = True
		If (Not isOnlineMode) Then
			Dim mail As New MailMessage()
			mail.From = New MailAddress(FromTB.Text.Trim())
			mail.To.Add(New MailAddress(SendToTB.Text.Trim()))
			mail.Body = MailBody.Html
			mail.Attachments.Add(New Attachment(e.UploadedFile.FileContent, e.UploadedFile.FileName))

			Dim smtp As New SmtpClient(HOST_ADDRESS, HOST_PORT)
			smtp.EnableSsl = True
			smtp.UseDefaultCredentials = False
			smtp.Credentials = New NetworkCredential(HOST_USERNAME, HOST_PASSWORD)
			smtp.Send(mail)
		End If
	End Sub
End Class