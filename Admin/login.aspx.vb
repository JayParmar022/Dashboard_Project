Imports System.Data.SqlClient

Partial Class Admin_login
    Inherits System.Web.UI.Page
    Dim ds As New Data.DataSet
    Dim adp As SqlDataAdapter
    Dim obj As New class1

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        'Try

        ds.Clear()
        adp = New SqlDataAdapter("select * from usertable where username='" + txtusername.Text + "' and password='" + txtpassword.Text + "'", obj.connection)
        adp.Fill(ds, "usertable")
        If (ds.Tables("usertable").Rows.Count > 0) Then
            Session("adminname") = txtusername.Text
            'Session("aid") = "1"
            Response.Redirect("~/Admin/procategory.aspx")
            lblerrormsg.Visible = False
            'lblerrormsg.Text = ""
            MsgBox("login")
        Else
            lblerrormsg.Visible = True
            lblerrormsg.Text = "username and password incorect!!"

        End If
        'Catch ex As Exception
        '    ''MsgBox(ex.Message)
        '    'MsgBox("login")
        'End Try
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblerrormsg.Visible = False
        'lblerrormsg.Text = "username and password incorect!!"
    End Sub
End Class
