
Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_reports


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

   

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Calendar1.SelectionChanged
        ' Convert the selected date to the format used in the database
        Dim selectedDate As Date = Calendar1.SelectedDate
        Dim formattedDate As String = selectedDate.ToString("dd-MM-yyyy") ' Format to dd-MM-yyyy

        ' Use parameterized query to prevent SQL injection and handle date formatting
        Dim query As String = "SELECT * FROM order_details WHERE CONVERT(VARCHAR(10), orderdate, 105) = @OrderDate ORDER BY orderid"
        Dim query1 As String = "SELECT SUM(price) FROM order_details WHERE CONVERT(VARCHAR(10), orderdate, 105) = @OrderDate"

        Using conn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=D:\BCA\Project Sem-6\25260088-25260089\CarAccShop\App_Data\CASDatabase.mdf;Integrated Security=True;User Instance=True")
            conn.Open()

            ' Execute first query to get order details
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@OrderDate", formattedDate)
                Using da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)
                    grvorder.DataSource = dt
                    grvorder.DataBind()
                    Dim rec_count As Integer = dt.Rows.Count

                    lblcount.Text = "Total Records: " & rec_count
                End Using
            End Using

            ' Execute second query to get the sum of prices
            Using cmd1 As New SqlCommand(query1, conn)
                cmd1.Parameters.AddWithValue("@OrderDate", formattedDate)
                Dim totalSum As Object = cmd1.ExecuteScalar()
                lblTotalSum.Text = "Total Sum of Prices: " & If(totalSum IsNot DBNull.Value, Convert.ToDecimal(totalSum).ToString("F2"), "0.00")
            End Using
        End Using
    End Sub
    
End Class
