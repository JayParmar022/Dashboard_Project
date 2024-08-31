Imports System.Data.SqlClient
Imports System.Data

Partial Class order
    Inherits System.Web.UI.Page
    Dim adp As SqlDataAdapter
    Dim ds As New DataSet
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim obj As New class1

    Public Sub displaydata()
        
        ds.Clear()
        adp = New SqlDataAdapter("select * from order_details where userid='" + Session("uid") + "'", obj.connection())
        adp.Fill(ds, "order_details")
        grvorder.DataSource = ds.Tables("order_details")
        grvorder.DataBind()

        If grvorder.Rows.Count = 0 Then
            lblempty.Visible = True
            btneback.Visible = True
        End If

       
    End Sub
    Protected Sub grvorder_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles grvorder.Load
        displaydata()
        
    End Sub

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

    Protected Sub grvorder_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvorder.RowDeleting
        Try
            Dim vid As Integer = grvorder.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from order_details where orderid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            displaydata()
            MsgBox("Order Cancel Successfully")
        Catch ex As Exception
            lblmsg.Text = ex.Message

        End Try
        obj.cn.Close()
    End Sub
End Class
