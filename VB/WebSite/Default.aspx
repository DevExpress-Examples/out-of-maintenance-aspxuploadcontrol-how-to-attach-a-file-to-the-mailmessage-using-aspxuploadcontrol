<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v11.2, Version=11.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function OnSendClick(s, e) {
			if (sendTo.GetText() && subject.GetText() && from.GetText())
				upload.Upload();
			else alert("Please enter From, To, Subject fields and attach a file");
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<table>
			<tr>
				<td>
					<dx:ASPxLabel ID="SendToLbl" runat="server" Text="To ">
					</dx:ASPxLabel>
				</td>
				<td>
					<dx:ASPxTextBox ID="SendToTB" runat="server" Width="500" NullText="Enter e-mail" ClientInstanceName="sendTo">
						<ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Right"
							SetFocusOnError="true">
							<ErrorFrameStyle Font-Size="Smaller" />
							<RegularExpression ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
								ErrorText="Invalid e-mail" />
						</ValidationSettings>
					</dx:ASPxTextBox>
				</td>
			</tr>
			<tr>
				<td>
					<dx:ASPxLabel ID="FromLbl" runat="server" Text="From ">
					</dx:ASPxLabel>
				</td>
				<td>
					<dx:ASPxTextBox ID="FromTB" runat="server" Width="500" NullText="Enter e-mail" ClientInstanceName="from">
						<ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Right"
							SetFocusOnError="true">
							<ErrorFrameStyle Font-Size="Smaller" />
							<RegularExpression ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
								ErrorText="Invalid e-mail" />
						</ValidationSettings>
					</dx:ASPxTextBox>
				</td>
			</tr>
			<tr>
				<td>
					<dx:ASPxLabel ID="SubjectLbl" runat="server" Text="Subject ">
					</dx:ASPxLabel>
				</td>
				<td>
					<dx:ASPxTextBox ID="SubjectTB" runat="server" Width="500" ClientInstanceName="subject">
					</dx:ASPxTextBox>
				</td>
			</tr>
		</table>
		<dx:ASPxHyperLink ID="AttachHL" runat="server" Text="Attach a file" ClientSideEvents-Click="function (s,e) { s.SetClientVisible(false); upload.SetClientVisible(true); }" />
		<dx:ASPxUploadControl ID="uc" runat="server" Width="280px" FileUploadMode="OnPageLoad" OnFileUploadComplete="uc_FileUploadComplete"
			ClientInstanceName="upload" ClientVisible="false">
		</dx:ASPxUploadControl>
	</div>
	<dx:ASPxHtmlEditor ID="MailBody" runat="server">
		<Settings AllowHtmlView="false" AllowInsertDirectImageUrls="false" AllowPreview="false" />
		<Toolbars>
			<dx:HtmlEditorToolbar>
			</dx:HtmlEditorToolbar>
		</Toolbars>
	</dx:ASPxHtmlEditor>
	<br />
	<dx:ASPxButton ID="SendBtn" runat="server" Text="Send" AutoPostBack="false">
		<ClientSideEvents Click="OnSendClick" />
	</dx:ASPxButton>
	</form>
</body>
</html>