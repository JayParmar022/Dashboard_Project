Imports System.Data.SqlClient
Imports System.Data
Partial Class user_help
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Protected Sub btnsend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsend.Click
        obj.exequery("insert into freedbacktbl values('" + txtname.Text + "','" + txtemail.Text + "','" + txtphone.Text + "','" + ddlquery.SelectedValue.ToString + "','" + txtorder.Text + "','" + txtmsg.Text + "')")
        lblmsg.Visible = True
        clearcontrol()
    End Sub
    Sub clearcontrol()
        txtemail.Text = ""
        txtname.Text = ""
        txtmsg.Text = ""
        txtorder.Text = ""
        txtphone.Text = ""
    End Sub
End Class
