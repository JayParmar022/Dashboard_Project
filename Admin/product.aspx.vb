Imports System.Data
Imports System.Data.SqlClient
Partial Class Admin_product
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim strquery As String = ""
    Dim filename, filepath, imgname As String

    Protected Sub btnadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnadd.Click
        Try
            If fuplproductimg.HasFile = True And txtpname.Text <> "" And txtprice.Text <> "" And ddlpcid.SelectedValue <> "" Then

                fuplproductimg.SaveAs(Server.MapPath("~/img/pimg/") + fuplproductimg.FileName)
                filepath = "~/img/pimg/" + fuplproductimg.FileName
                da = New SqlDataAdapter("insert into product values ('" & ddlpcid.SelectedValue & "','" & txtpname.Text & "','" & txtprice.Text & "','" & filepath & "')", obj.connection)
                dt = New DataTable
                da.Fill(dt)
                fillgrid()
                lblmsg.Visible = False
            Else
                lblmsg.Visible = True
                lblmsg.Text = "Make sure Data be Fulfill.."

            End If
            
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
        clearcontrol()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("adminname") = "" Then
            Response.Redirect("login.aspx")
        Else
            If IsPostBack = False Then
                fillgrid()
                da = New SqlDataAdapter("select * from category_tbl", obj.connection)
                dt = New DataTable
                da.Fill(dt)
                ddlpcid.DataSource = dt
                ddlpcid.DataBind()
                ddlpcid.DataTextField = "pcname"
                ddlpcid.DataValueField = "pcid"
                ddlpcid.DataBind()
            End If
        End If
       
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvproduct.PageIndexChanging
        grvproduct.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvproduct.RowEditing
        grvproduct.EditIndex = e.NewEditIndex
        fillgrid()
    End Sub
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvproduct.RowUpdating
        Try
            Dim vtxtpcid, vtxtpname, vtxtprice, vtxtimgurl As New TextBox
            Dim vid As Integer = grvproduct.DataKeys(e.RowIndex).Value
            vtxtpcid = grvproduct.Rows(e.RowIndex).Cells(2).Controls(0)
            vtxtpname = grvproduct.Rows(e.RowIndex).Cells(3).Controls(0)
            vtxtprice = grvproduct.Rows(e.RowIndex).Cells(4).Controls(0)
            Dim imageupload As FileUpload = grvproduct.Rows(e.RowIndex).FindControl("FileUpload1")

            Dim imgpath As String = ""
            If imageupload.HasFile = True Then

                imageupload.SaveAs(Server.MapPath("~/img/pimg/") + imageupload.FileName)
                imgpath = "~/img/pimg/" + imageupload.FileName
                da = New SqlDataAdapter("update product set pcid='" & vtxtpcid.Text & "',pname='" & vtxtpname.Text & "',price='" & vtxtprice.Text & "',imageurl='" & imgpath & "' where pid= " & vid, obj.connection)
                dt = New DataTable
                da.Fill(dt)
                fillgrid()
            Else
                Dim img As Image = grvproduct.Rows(e.RowIndex).FindControl("imgedit")
                imgpath = img.ImageUrl
            End If

            
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub
    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvproduct.RowCancelingEdit
        grvproduct.EditIndex = -1
        fillgrid()
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvproduct.RowDeleting
        Try
            Dim vid As Integer = grvproduct.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from product where pid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
        obj.cn.Close()
    End Sub
    Sub fillgrid()
        Try
            da = New SqlDataAdapter("select * from product order by pid", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            grvproduct.DataSource = dt
            grvproduct.DataBind()
            lblcount.Text = "Total Records: " & dt.Rows.Count
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub

    Sub clearcontrol()
        txtpname.Text = ""
        txtprice.Text = ""
    End Sub

    Protected Sub ddlpcid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlpcid.SelectedIndexChanged
        Try
            Dim selectedValue As String = ddlpcid.SelectedValue

            ' Query to fetch products based on selected category
            Dim query As String = "SELECT * FROM product WHERE pcid = @pcid ORDER BY pid"
            ' Query to fetch the sum of prices based on selected category
            Dim sumQuery As String = "SELECT SUM(price) FROM product WHERE pcid = @pcid"

            ' Fetch the products
            da = New SqlDataAdapter(query, obj.connection)
            da.SelectCommand.Parameters.AddWithValue("@pcid", selectedValue)
            dt = New DataTable
            da.Fill(dt)
            grvproduct.DataSource = dt
            grvproduct.DataBind()
            lblcount.Text = "Total Records: " & dt.Rows.Count

            ' Fetch the sum of prices
            
            Using cmd As New SqlCommand(sumQuery, obj.connection)
                cmd.Parameters.AddWithValue("@pcid", selectedValue)
                Dim totalSum As Object = cmd.ExecuteScalar()
                lblTotalSum.Text = "Total Sum of Cost: " & If(totalSum IsNot DBNull.Value, Convert.ToDecimal(totalSum).ToString("F2"), "0.00")
            End Using


            lblmsg.Text = "" ' Clear any previous error messages
        Catch ex As Exception
            lblmsg.Text = "Error: " & ex.Message
        End Try
    End Sub



End Class
