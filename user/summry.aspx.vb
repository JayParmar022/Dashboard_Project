Imports System.Data.SqlClient
Imports System.Data
Partial Class user_summry
    Inherits System.Web.UI.Page
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim obj As New class1
    Dim stradd As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("uid") = "" Then
            Response.Redirect("userlogin.aspx")
        Else
            If IsPostBack = False Then
                addcall()
                fillgrid()

            End If
            changeaddpanel.Visible = False
        End If
    End Sub
    Sub fillgrid()
        Try
            Dim vuid As String = Session("uid")
            da = New SqlDataAdapter("select * from tblcart where userid=" & vuid, obj.connection)
            dt = New DataTable
            da.Fill(dt)

            lblordertotalbill.Text = Session("ptotal")

            grvsummry.DataSource = dt
            grvsummry.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub btnchngadd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnchngadd.Click
        Try
            Dim vuid As String = Session("uid")
            stradd = txtaddnumber.Text + ", " + txtaddress.Text + ", " + txtlandmark.Text + ", " + txtpincode.Text + ", " + txtcity.Text + ", " + txtstate.Text
            da = New SqlDataAdapter("update usertable set address='" & stradd & "' where username='" & txtname.Text & "'", obj.connection)
            dt = New DataTable
            da.Fill(dt)
            addcall()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        existingaddpanel.Visible = True
    End Sub
    Sub addcall()
        Dim vuid As String = Session("uid")
        da = New SqlDataAdapter("select * from usertable where userid=" & vuid, obj.connection)
        dt = New DataTable
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            lblshowadd.Text = dt.Rows(0)("address").ToString()
        End If

    End Sub
    Protected Sub rbladdress_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbladdress.SelectedIndexChanged
        If rbladdress.SelectedIndex = 0 Then
            existingaddpanel.Visible = True
        End If
        If rbladdress.SelectedIndex = 1 Then
            changeaddpanel.Visible = True
            existingaddpanel.Visible = False
        End If
    End Sub

    Protected Sub btnplaceorder_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnplaceorder.Click

    End Sub
End Class
