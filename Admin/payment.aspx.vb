Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_payment
    Inherits System.Web.UI.Page
    Dim obj As New class1
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Sub fillgrid()
        da = New SqlDataAdapter("select * from tblpayment", obj.connection)
        dt = New DataTable
        da.Fill(dt)
        grvpayment.DataSource = dt
        grvpayment.DataBind()
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
    Protected Sub grvpayment_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvpayment.RowDeleting
        Try
            Dim vid As Integer = grvpayment.DataKeys(e.RowIndex).Value
            da = New SqlDataAdapter("delete from tblpayment where paymentid= " & vid, obj.connection)
            dt = New DataTable
            da.Fill(dt)
            fillgrid()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        obj.cn.Close()
    End Sub

    Protected Sub grvpayment_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grvpayment.PageIndexChanging
        grvpayment.PageIndex = e.NewPageIndex
        fillgrid()
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Calendar1.SelectionChanged
        ' Update data based on the new date selection
        UpdateData()
    End Sub

    Protected Sub radiobuttonlist_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radiobuttonlist.SelectedIndexChanged
        ' Update data based on the new radio button selection
        UpdateData()
    End Sub

   

    Private Sub UpdateData()
        ' Get selected date and format it
        Dim selectedDate As Date = Calendar1.SelectedDate
        Dim formattedDate As String = selectedDate.ToString("dd-MM-yyyy") ' Format to dd-MM-yyyy

        ' Get selected radio button value
        Dim selectedrbt As String = radiobuttonlist.SelectedValue

        ' Use parameterized query to prevent SQL injection and handle date formatting
        Dim query As String = "SELECT * FROM tblpayment WHERE CONVERT(VARCHAR(10), date, 105) = @date AND paymenttype = @paymenttype ORDER BY paymentid"
        Dim query1 As String = "SELECT SUM(total) FROM tblpayment WHERE CONVERT(VARCHAR(10), date, 105) = @date AND paymenttype = @paymenttype"

        Using conn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=D:\BCA\Project Sem-6\25260088-25260089\CarAccShop\App_Data\CASDatabase.mdf;Integrated Security=True;User Instance=True")
            conn.Open()

            ' Execute first query to get order details
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@date", formattedDate)
                cmd.Parameters.AddWithValue("@paymenttype", selectedrbt)

                Using da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)
                    grvpayment.DataSource = dt
                    grvpayment.DataBind()
                    Dim rec_count As Integer = dt.Rows.Count

                    lblcount.Text = "Total Records: " & rec_count
                End Using
            End Using

            ' Execute second query to get the sum of prices
            Using cmd1 As New SqlCommand(query1, conn)
                cmd1.Parameters.AddWithValue("@date", formattedDate)
                cmd1.Parameters.AddWithValue("@paymenttype", selectedrbt)
                Dim totalSum As Object = cmd1.ExecuteScalar()
                lblTotalSum.Text = "Total Sum of Income: " & If(totalSum IsNot DBNull.Value, Convert.ToDecimal(totalSum).ToString("F2"), "0.00")
            End Using
        End Using
    End Sub


End Class
