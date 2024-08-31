Imports System.Data.SqlClient
Imports System.Data

Partial Class user_myprofile
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As New SqlDataAdapter
    Dim dt As New DataTable
    Dim dr As SqlDataReader
   
    Public Sub displaydata()

        da = New SqlDataAdapter("select * from usertable where userid ='" + Session("uid") + "'", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        txtname.Text = dt.Rows(0)("username").ToString
        txtuserpass.Text = dt.Rows(0)("password").ToString
        txtemail.Text = dt.Rows(0)("email").ToString
        TextBox1.Text = dt.Rows(0)("gender").ToString
        If TextBox1.Text = "Male" Then
            male.Checked = True
        Else
            f.Checked = True
        End If
        txtaddress.Text = dt.Rows(0)("address").ToString
        txtphno.Text = dt.Rows(0)("mobileno").ToString
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("uid") = "" Then
            Response.Redirect("userlogin.aspx")
        Else

        End If


    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        dt.Clear()
        da = New SqlDataAdapter("select password from usertable where userid='" + Session("uid") + "'", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        Dim pass As String = dt.Rows(0)("password").ToString
        If pass = oldpass.Text Then
            obj.exequery("update usertable set password='" + newpass.Text + "' where userid='" + Session("uid") + "'")
            newpass.Text = ""
            oldpass.Text = ""

            Label2.Visible = True
            Label2.Text = "password changed"

        Else
            Label2.Visible = True
            Label2.Text = "Old password doesn't match!"
        End If
    End Sub
    
    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Dim gen As String = ""
        If male.Checked = True Then
            gen = "Male"
        ElseIf f.Checked = True Then
            gen = "Female"
        End If
        Dim email As String = txtemail.Text
        Dim add As String = txtaddress.Text
        Dim mo As String = txtphno.Text
        obj.exequery("update usertable set email='" + email + "',gender='" + gen + "',address='" + add + "',mobileno=" + mo + " where userid ='" + Session("uid").ToString + "'")
        lblmsg.Visible = True
    End Sub

    
    Protected Sub edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles edit.Click
        Label3.Visible = False
        displaydata()
        lblmsg.Visible = False
        txtaddress.ReadOnly = False
        txtemail.ReadOnly = False
        txtphno.ReadOnly = False

    End Sub
End Class
