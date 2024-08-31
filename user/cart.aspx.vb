Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.DataRowView
Partial Class cart
    Inherits System.Web.UI.Page
    Dim da As SqlDataAdapter
    Dim ds As New DataSet
    Dim dt As New DataTable
    Dim obj As New class1
    Sub fillgrid()
        Try
            Dim vuid As String = Session("uid")
            da = New SqlDataAdapter("select * from tblcart where userid=" & vuid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            grvcart.DataSource = dt
            grvcart.DataBind()

            If grvcart.Rows.Count = 0 Then
                lbltext.Visible = False
                lblgtotal.Visible = False
                btnback.Visible = False
                btnpay.Visible = False
                lblempty.Visible = True
                btneback.Visible = True
            End If
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") = "" Then
            Response.Redirect("userlogin.aspx")
        Else
            If IsPostBack = False Then
                fillgrid()
            End If
        End If

    End Sub
    Protected Sub grvcart_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvcart.PageIndexChanging
        grvcart.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub
    Protected Sub grvcart_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvcart.RowDeleting
        Try
            Dim vid As Integer = grvcart.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from tblcart where cartid=" & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try

    End Sub
    Protected Sub grvcart_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvcart.RowUpdating
        Try
            Try
                Dim vtxtqty As New TextBox
                Dim vlblprice, vlbltotal As New Label
                Dim vid As Integer = grvcart.DataKeys(e.RowIndex).Value
                vlblprice = grvcart.Rows(e.RowIndex).FindControl("lblprice")
                vtxtqty = grvcart.Rows(e.RowIndex).Cells(4).Controls(0)
                vlbltotal = grvcart.Rows(e.RowIndex).FindControl("lbltotal")
                vlbltotal.Text = vlblprice.Text * vtxtqty.Text
                da = New SqlDataAdapter("update tblcart set qty='" & vtxtqty.Text & "',total='" & vlbltotal.Text & "' where cartid= " & vid, obj.connection)
                dt = New DataTable
                da.Fill(dt)
                fillgrid()
            Catch ex As Exception
                lblmsg.Text = ex.Message
            End Try
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub
    Protected Sub grvcart_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvcart.RowEditing
        grvcart.EditIndex = e.NewEditIndex
        fillgrid()
    End Sub
    Protected Sub grvcart_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvcart.RowCancelingEdit
        grvcart.EditIndex = -1
        fillgrid()
    End Sub
    Protected Sub grvcart_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grvcart.RowDataBound
        Try
            Dim vlbltotal As New Label
            Dim gtotal As Integer
            Dim i As Integer
            For i = 0 To grvcart.Rows.Count - 1
                vlbltotal = grvcart.Rows(i).FindControl("lbltotal")
                gtotal = gtotal + Int16.Parse(vlbltotal.Text)
            Next
            lblgtotal.Text = gtotal.ToString()

            Session("ptotal") = lblgtotal.Text

        Catch ex As Exception
            lblmsg.Visible = True
            lblmsg.Text = ex.Message
        End Try
    End Sub
    
End Class
