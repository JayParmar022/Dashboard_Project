Imports System.Data.SqlClient
Partial Class adminmst
    Inherits System.Web.UI.MasterPage

    Protected Sub btnlogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogout.Click
        Session.Abandon()
        Server.Transfer("login.aspx")
        'Response.Redirect("wfrmalogin.aspx")
    End Sub
End Class

