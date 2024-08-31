Imports System.Data.SqlClient
Imports System.Data
Partial Class user_userlogin
    Inherits System.Web.UI.Page
    Dim da As New SqlDataAdapter
    Dim dt As New DataTable
    Dim dr As SqlDataReader
    Dim ds As New Data.DataSet
    Dim adp As SqlDataAdapter
    Dim obj As New class1
    Dim uid As String
    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        ds.Clear()
        adp = New SqlDataAdapter("select * from usertable where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "'", obj.connection)
        adp.Fill(ds, "usertable")
        If (ds.Tables("usertable").Rows.Count > 0) Then
            Session("name") = txtusername.Text

            da = New SqlDataAdapter("select * from usertable where username ='" + Session("name") + "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            Session("uid") = dt.Rows(0)("userid").ToString

            Response.Redirect("~/user/home.aspx")

        Else

            lblerrormsg.Text = "Username or Password are incorrect"
            lblerrormsg.ForeColor = Drawing.Color.Red
        End If
    End Sub

End Class
