Imports System.Data.SqlClient
Imports System.Data
Partial Class user_modal
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim ds As New Data.DataSet
    Dim adp As SqlDataAdapter
    Dim mycmd As SqlCommand
    Dim res As Object
    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
        ds.Clear()
        adp = New SqlDataAdapter("select * from usertable where Username='" + username.Text + "'and email='" + floatingInput.Text + "'", obj.connection)
        adp.Fill(ds, "usertable")
        If (ds.Tables("usertable").Rows.Count > 0) Then
            mycmd = New SqlCommand("select password from usertable where Username='" + username.Text + "'", obj.connection)
            res = mycmd.ExecuteScalar()
            showpass.Text = res.ToString
            Label1.Visible = False
            HyperLink1.Visible = True
        Else
            Label1.Visible = True
            Label1.Text = "Username or Email is incorrect."
            Label1.ForeColor = Drawing.Color.Red
            showpass.Text = ""
            HyperLink1.Visible = False
        End If
    End Sub

   
End Class
