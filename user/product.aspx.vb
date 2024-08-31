Imports System.Data.SqlClient
Imports System.Data
Partial Class product
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim strquery As String = ""
    Dim pcids As Integer
    Sub filldata()
        Try
            da = New SqlDataAdapter("select * from product where pcid=" & pcids, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            DataList1.DataSource = dt
            DataList1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            pcids = CInt(Request.QueryString("catnm"))
            filldata()
        End If

    End Sub

    Protected Sub btnaddtocart_Command1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Try
            If Session("uid") = "" Then
                Response.Redirect("userlogin.aspx")

            Else
                If (e.CommandName = "atc") Then
                    Dim pids As String = e.CommandArgument.ToString
                    Dim strquery1 As String = ""
                    da = New SqlDataAdapter("select * from product where pid=" & pids, obj.connection)
                    dt = New DataTable
                    da.Fill(dt)

                    Dim vpid As String = dt.Rows(0).Item("pid").ToString()
                    Dim vuid As String = Session("uid")
                    Dim vpname As String = dt.Rows(0).Item("pname").ToString()
                    Dim vprice As String = dt.Rows(0).Item("price").ToString()
                    Dim vqty As String = "1"
                    Dim vimageurl As String = dt.Rows(0).Item("imageurl").ToString()
                    Dim qt As Integer = 1
                    Dim pr As Integer = dt.Rows(0).Item("price")
                    Dim vtotal As Integer = qt * pr

                    da = New SqlDataAdapter("insert into tblcart (pid, userid, pname, price, qty, total, imageurl) values('" & vpid & "','" & vuid & "','" & vpname & "', '" & vprice & "', '" & vqty & "', " & vtotal & ", '" & vimageurl & "')", obj.connection)
                    dt = New DataTable
                    da.Fill(dt)
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub


End Class
