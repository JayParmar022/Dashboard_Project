Imports System.Data.SqlClient
Imports System.Data
Partial Class home
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection
    Dim adp As SqlDataAdapter
    Dim ds As New Dataset
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable

    Public Sub displaydata()

        ds.Clear()
        adp = New SqlDataAdapter("select * from category_tbl order by Pcid", obj.connection())
        adp.Fill(ds, "category_tbl")
        dlpcatagory.DataSource = ds.Tables("category_tbl")
        dlpcatagory.DataBind()

    End Sub

    Protected Sub dlpcatagory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlpcatagory.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        displaydata()
    End Sub
End Class
