Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_order
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable


    Sub fillgrid()
        da = New SqlDataAdapter("select * from order_details order by orderid ", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        grvorder.DataSource = dt
        grvorder.DataBind()
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
    Protected Sub grvorder_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvorder.PageIndexChanging
        grvorder.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub

    Protected Sub grvorder_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvorder.RowCancelingEdit
        grvorder.EditIndex = -1
        fillgrid()
    End Sub
    Protected Sub grvorder_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvorder.RowDeleting
        Try
            Dim vid As Integer = grvorder.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from order_details where orderid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
        obj.cn.Close()
    End Sub

    Protected Sub grvorder_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvorder.RowEditing
        grvorder.EditIndex = e.NewEditIndex
        fillgrid()
    End Sub
    Protected Sub grvorder_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvorder.RowUpdating
        Try
            Dim vtxtorderstatus As New TextBox
            Dim vorderid As Integer = grvorder.DataKeys(e.RowIndex).Value
            vtxtorderstatus = grvorder.Rows(e.RowIndex).Cells(9).Controls(0)
            da = New SqlDataAdapter("update order_details set orderstatus='" & vtxtorderstatus.Text & "' where orderid= " & vorderid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()

        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try

    End Sub
End Class
