Imports System.Data.SqlClient
Partial Class usermast
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") = "" Then
            btnlogout.Visible = False
        Else
            btnsignup.Visible = False
            btnlogin.Visible = False
            LinkButton1.Text = Session("name")

        End If
    End Sub
    Protected Sub btnlogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogout.Click
        Session.Abandon()
        Response.Redirect("userlogin.aspx")
    End Sub

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        Response.Redirect("userlogin.aspx")
    End Sub


    Protected Sub btnsignup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsignup.Click
        Response.Redirect("signup.aspx")
    End Sub
End Class

