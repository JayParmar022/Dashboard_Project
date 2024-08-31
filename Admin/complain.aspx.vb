Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_complain
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Sub fillgrid()

        da = New SqlDataAdapter("select * from freedbacktbl", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        grvcom.DataSource = dt
        grvcom.DataBind()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("adminname") = "" Then
            Response.Redirect("login.aspx")
        Else
            If IsPostBack = False Then
                fillgrid()
            End If
        End If
    End Sub


    Protected Sub grvcom_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvcom.PageIndexChanging
        grvcom.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub
End Class
