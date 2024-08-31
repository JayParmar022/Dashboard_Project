Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail
Imports System.Web.Services.Description.Types
Imports System.Net
Imports System.Text
Imports System.IO
Imports System.Reflection
Imports System.Security.Authentication
Imports System.Net.Security

Partial Class user_payment
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim dtb As DataTable
    Dim strquery As String = ""
    Dim count, count2 As Integer
    Dim ins As Integer
    Dim vorderid As String
    Dim vpidlst As String
    Dim vpname As String
    Dim vpprice As String
    Dim vpqty As String
    Dim vptotal As String
    Dim cmda As String = ""
    Dim gtotal As Integer
    
    Sub orderdone()
        Try
            
            Dim suid As String = Session("uid")
            Dim vdate As Date = Date.Now
            'Dim vdateform As String = vdate.ToString("dd-MM-yyyy")
            da = New SqlDataAdapter("select * from tblcart where userid='" & suid & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            count = dt.Rows.Count

            'insert user order detail to order_details table
            For ins As Integer = 0 To count - 1

                Dim vpid As String = dt.Rows(ins).Item("pid").ToString()
                Dim vuid As String = dt.Rows(ins).Item("userid").ToString()
                Dim vpname As String = dt.Rows(ins).Item("pname").ToString()
                Dim vprice As String = dt.Rows(ins).Item("price").ToString()
                Dim vqty As String = dt.Rows(ins).Item("qty").ToString()
                Dim vtotal As String = dt.Rows(ins).Item("total").ToString()
                Dim temptotal As Integer = dt.Rows(ins).Item("total")
                Dim vimageurl As String = dt.Rows(ins).Item("imageurl").ToString()
                gtotal += temptotal
                vpidlst += vpid & ","
                
                da = New SqlDataAdapter("insert into order_details (userid,pid,pname,price,qty,total,orderdate,imageurl) values('" & suid & "','" & vpid & "','" & vpname & "', '" & vprice & "', '" & vqty & "', '" & temptotal & "','" + vdate + "','" & vimageurl & "')", obj.connection)
                dtb = New DataTable
                da.Fill(dtb)
                
            Next

            da = New SqlDataAdapter("select * from order_details where orderdate='" & vdate & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            count2 = dt.Rows.Count

            For cou As Integer = 0 To count2 - 1
                Dim orderid As String = dt.Rows(cou)("orderid").ToString
                vorderid += orderid & ","
            Next

            'Insert payment details to tblpayment table
            Dim vptype As String = cmda
            da = New SqlDataAdapter("insert into tblpayment (orderid,pid,userid,paymenttype,total,date) values('" & vorderid & "','" & vpidlst & "','" & suid & "','" & vptype & "', '" & gtotal & "','" + vdate + "')", obj.connection)
            dtb = New DataTable
            da.Fill(dtb)

            da = New SqlDataAdapter("select * from tblpayment where date='" & vdate & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            Dim vpaymentid As String = dt.Rows(0)("paymentid").ToString


            'Update payment details to order_details table
            da = New SqlDataAdapter("update order_details set paymentid='" + vpaymentid + "' where orderdate='" & vdate & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)

            'clear user cart
            da = New SqlDataAdapter("delete from tblcart where userid='" & suid & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
        Response.Redirect("order.aspx")

    End Sub

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

    Protected Sub btncodpayment_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btncodpayment.Command


        Dim emailOtpStored As String = Session("emailOtp")
        If Txtcodotp.Text = emailOtpStored Then
            If (e.CommandName = "cod") Then
                cmda = e.CommandArgument.ToString
                orderdone()
            End If
        Else
            Label5.Visible = True
            Label5.Text = "Invalid OTP"
        End If
    End Sub
    Protected Sub btngpaypayment_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btngpaypayment.Command
        If lblmsg0.Text = txtotp0.Text Then
            If (e.CommandName = "gpay") Then
                cmda = e.CommandArgument.ToString
                orderdone()
            End If
        Else
            Label2.Visible = True
            Label2.Text = "Invalid OTP"
        End If

    End Sub
    Protected Sub btnccpayment_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btnccpayment.Command
        If lblmsg.Text = txtotp.Text Then
            If (e.CommandName = "crdb") Then
                Label1.Visible = False
                cmda = e.CommandArgument.ToString
                MsgBox("Payment Successfull")
                orderdone()
            End If
        Else
            Label1.Visible = True
            Label1.Text = "Invalid OTP"
        End If
    End Sub

    Protected Sub btnupipayment_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btnupipayment.Command
        If lblmsg1.Text = txtotp1.Text Then
            If (e.CommandName = "upi") Then
                cmda = e.CommandArgument.ToString
                orderdone()
            End If
        Else
            Label3.Visible = True
            Label3.Text = "Invalid OTP"
        End If
    End Sub
    Private Function GenerateOtp() As String
        Dim rnd As New Random()
        Return rnd.Next(100000, 999999).ToString()
    End Function

    Protected Sub btnotp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnotp.Click

        lblmsg.Visible = True
        lblmsg.Text = GenerateOtp()
        lblotp.Visible = True
        txtotp.Visible = True
    End Sub

    Protected Sub btnotp0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnotp0.Click

        lblmsg0.Visible = True
        lblmsg0.Text = GenerateOtp()
        lblotp0.Visible = True
        txtotp0.Visible = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        lblmsg1.Visible = True
        lblmsg1.Text = GenerateOtp()
        lblotp1.Visible = True
        txtotp1.Visible = True
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") = "" Then
            Response.Redirect("userlogin.aspx")

        Else
            If radiobuttonlist.SelectedIndex = 0 Then
                panelcreditcard.Visible = True
                panelcod.Visible = False
                panelgpay.Visible = False
                panelpaytm.Visible = False
            End If
            If radiobuttonlist.SelectedIndex = 1 Then
                panelgpay.Visible = True
                panelcreditcard.Visible = False
                panelcod.Visible = False
                panelpaytm.Visible = False
            End If
            If radiobuttonlist.SelectedIndex = 2 Then
                panelpaytm.Visible = True
                panelcreditcard.Visible = False
                panelcod.Visible = False
                panelgpay.Visible = False
            End If
            If radiobuttonlist.SelectedIndex = 3 Then
                panelcod.Visible = True
                panelcreditcard.Visible = False
                panelgpay.Visible = False
                panelpaytm.Visible = False
            End If

        End If

    End Sub
    Protected Sub radiobuttonlist_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radiobuttonlist.SelectedIndexChanged
        Label4.Visible = True
        If radiobuttonlist.SelectedIndex = 0 Then
            panelcreditcard.Visible = True
            Label4.Visible = False
        End If
        If radiobuttonlist.SelectedIndex = 1 Then
            panelgpay.Visible = True
            Label4.Visible = False
        End If
        If radiobuttonlist.SelectedIndex = 2 Then
            panelpaytm.Visible = True
            Label4.Visible = False
        End If
        If radiobuttonlist.SelectedIndex = 3 Then
            panelcod.Visible = True
            Label4.Visible = False
        End If
    End Sub


    Protected Sub btnsubmitcod_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmitcod.Click
        Dim suid As String = Session("uid")
        da = New SqlDataAdapter("select * from usertable where userid='" & suid & "'", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        Dim useremail As String = dt.Rows(0)("email").ToString
        Dim emailOtp As String = GenerateOtp()
        Session("emailOtp") = emailOtp
        SendEmail(useremail, emailOtp)
        btncodpayment.Visible = True
        Txtcodotp.Visible = True
        lblcodotp.Visible = True
        btnsubmitcod.Visible = False
    End Sub

    
End Class
