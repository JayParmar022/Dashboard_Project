
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Web.Services.Description.Types
Imports System.Net
Imports System.Text
Imports System.IO
Imports System.Reflection
Imports System.Security.Authentication
Imports System.Net.Security


Partial Class user_signup
    Inherits System.Web.UI.Page
    Dim obj As New class1
    
    ' Method to send email
    Private Sub SendEmail(ByVal email As String, ByVal otp As String)
        Dim mail As New MailMessage()
        mail.To.Add(email)
        mail.From = New MailAddress("jhonjamesbuttler@gmail.com")
        mail.Subject = "Your OTP Code"
        mail.Body = "Your OTP is " & otp
        mail.IsBodyHtml = False

        Dim smtp As New SmtpClient("smtp.gmail.com")
        smtp.Credentials = New System.Net.NetworkCredential("jhonjamesbuttler@gmail.com", "cbqtasdmezcguteq")
        smtp.Port = 587
        smtp.EnableSsl = True
        smtp.Send(mail)
    End Sub

    ' Method to generate OTP
    Private Function GenerateOtp() As String
        Dim rnd As New Random()
        Return rnd.Next(100000, 999999).ToString()
    End Function

    Protected Sub btnsignup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsignup.Click
        Dim gen As String = If(male.Checked, "Male", "Female")
        Dim address As String = txthouseno.Text & "," & txtaddress.Text & "," & txtlandmark.Text & "," & txtpincode.Text & "," & txtstate.Text

        ' Generate OTPs
        Dim emailOtp As String = GenerateOtp()

        ' Send OTPs

        SendEmail(txtemail.Text, emailOtp)

        ' Store OTPs and user information in Session for verification

        Session("emailOtp") = emailOtp
        Session("userInfo") = New With {.Name = txtname.Text, .Password = txtuserpass.Text, .Email = txtemail.Text, .Gender = gen, .Address = address, .Phone = txtphno.Text}

        Response.Redirect("~/user/verifyotp.aspx")
    End Sub
End Class
