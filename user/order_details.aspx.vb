Imports System.Data.SqlClient
Imports System.Data

Partial Class user_order_details
    Inherits System.Web.UI.Page
    Dim adp As SqlDataAdapter
    Dim ds As New Dataset
    Dim obj As New class1

    Public Sub displaydata()

        ds.Clear()
        adp = New SqlDataAdapter("select * from order_details where userid='" + Session("uid") + "'", obj.connection())
        adp.Fill(ds, "order_details")
        grvorder.DataSource = ds.Tables("order_details")
        grvorder.DataBind()

    End Sub
    Protected Sub grvorder_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grvorder.Load
        displaydata()

    End Sub


    'Protected Sub grvorder_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grvorder.SelectedIndexChanged
    '    Dim row As GridViewRow = grvorder.SelectedRow
    '    TextBox1.Text = TryCast(row.FindControl("label1"), Label).Text

    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") = "" Then
            Response.Redirect("userlogin.aspx")

        Else
            displaydata()
        End If
    End Sub

    Protected Sub grvorder_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvorder.PageIndexChanging
        grvorder.PageIndex = e.NewPageIndex
        displaydata()
    End Sub

    Protected Sub grvorder_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grvorder.SelectedIndexChanged

    End Sub


End Class
