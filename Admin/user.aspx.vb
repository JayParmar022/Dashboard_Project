Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_user
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Sub fillgrid()
        Try
            da = New SqlDataAdapter("select * from usertable", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            grvuser.DataSource = dt
            grvuser.DataBind()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try

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

    Protected Sub grvuser_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvuser.PageIndexChanging
        grvuser.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub

    Protected Sub grvuser_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvuser.RowDeleting
        Try
            Dim vid As Integer = grvuser.DataKeys(e.RowIndex).Value
            ' strquery = "delete from tbluser where userid= " & vid
            da = New SqlDataAdapter("delete from usertable where userid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
        obj.cn.Close()
    End Sub
End Class
