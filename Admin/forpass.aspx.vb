Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_forpass
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim ds As New Data.DataSet
    Dim adp As SqlDataAdapter
    Dim mycmd As SqlCommand
    Dim res As Object

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        ds.Clear()
        adp = New SqlDataAdapter("select * from admin_tbl where Adminname='" + txtusername.Text + "'", obj.connection)
        adp.Fill(ds, "admin_tbl")
        If (ds.Tables("admin_tbl").Rows.Count > 0) Then
            mycmd = New SqlCommand("select password from admin_tbl where Adminname='" + txtusername.Text + "'", obj.connection)
            res = mycmd.ExecuteScalar()
            Label1.Visible = True
            Label1.Text = "Your Password : " + res.ToString
            Label1.ForeColor = Drawing.Color.White
            lblerrormsg.Visible = False

            txtnewpass.Visible = True
            newpass.Visible = True
            change.Visible = True
            btnlogin.Visible = False
        Else
            lblerrormsg.Visible = True
            lblerrormsg.Text = "Username incorrect."
            lblerrormsg.ForeColor = Drawing.Color.Red
            Label1.Visible = False

        End If
    End Sub

    

    Protected Sub change_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles change.Click
        obj.exequery("update admin_tbl set password='" + txtnewpass.Text + "' where Adminname='" + txtusername.Text + "'")
        Label2.Visible = True
        Label2.Text = "Password Updated!!!"
        Label2.ForeColor = Drawing.Color.White
    End Sub
End Class
