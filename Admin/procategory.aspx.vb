Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_procategory
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim strquery As String = ""
    Dim filename, filepath, imgname As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("adminname") = "" Then
            Response.Redirect("login.aspx")
        Else
            If IsPostBack = False Then
                fillgrid()
            End If
        End If
    End Sub
    Protected Sub btnsave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsave.Click
        Try
            If fuplcatagoryimg.HasFile = True And txtcatagoryname.Text <> "" Then
                fuplcatagoryimg.SaveAs(Server.MapPath("~/img/") + fuplcatagoryimg.FileName)
                filepath = "~/img/" + fuplcatagoryimg.FileName
                da = New SqlDataAdapter("insert into category_tbl values ('" & txtcatagoryname.Text & "','" & filepath & "')", obj.connection)
                dt = New DataTable
                da.Fill(dt)
                fillgrid()
                txtcatagoryname.Text = ""
                lblmsg.Visible = False
            Else
                If txtcatagoryname.Text = "" Then
                    If fuplcatagoryimg.HasFile = False Then
                        lblmsg.Text = "select Image"
                    Else
                        lblmsg.Text = "Category Name cannot be blank!!"
                    End If
                End If
                lblmsg.Text = "Enter Category Name & select Image"
               
            End If

        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try

    End Sub
    Protected Sub grvpcatagory_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvpcatagory.PageIndexChanging
        grvpcatagory.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub

    Sub fillgrid()
        Try
            da = New SqlDataAdapter("select * from category_tbl order by pcid", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            grvpcatagory.DataSource = dt
            grvpcatagory.DataBind()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub

    Sub clearcontrol()
        txtcatagoryname.Text = ""
    End Sub
    Protected Sub grvpcatagory_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvpcatagory.RowEditing
        grvpcatagory.EditIndex = e.NewEditIndex
        fillgrid()
    End Sub
    Protected Sub grvpcatagory_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvpcatagory.RowUpdating
        Try
            Dim vtxtpcname As New TextBox
            Dim vid As Integer = grvpcatagory.DataKeys(e.RowIndex).Value
            vtxtpcname = grvpcatagory.Rows(e.RowIndex).Cells(2).Controls(0)
            Dim imageupload As FileUpload = grvpcatagory.Rows(e.RowIndex).FindControl("FileUpload1")

            Dim imgpath As String = ""
            If imageupload.HasFile = True Then
                imgpath = "~/img/food.png"
                imageupload.SaveAs(Server.MapPath(imgpath))
            Else
                Dim img As Image = grvpcatagory.Rows(e.RowIndex).FindControl("imgedit")
                imgpath = img.ImageUrl
            End If
            da = New SqlDataAdapter("update category_tbl set pcname='" & vtxtpcname.Text & "',imageurl='" & imgpath & "' where pcid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
    End Sub
    Protected Sub grvpcatagory_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvpcatagory.RowCancelingEdit
        grvpcatagory.EditIndex = -1
        fillgrid()
    End Sub

    Protected Sub grvpcatagory_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvpcatagory.RowDeleting
        Try
            Dim vid As Integer = grvpcatagory.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from category_tbl where pcid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            lblmsg.Text = ex.Message
        End Try
        obj.cn.Close()
    End Sub
End Class
