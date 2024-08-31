Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class class1
    Public cn As SqlConnection
    Public cmd As SqlCommand

    Public Function connection() As SqlConnection
        cn = New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=D:\MCA\MCA-sem2\project\CarAccShop\App_Data\CASDatabase.mdf;Integrated Security=True;User Instance=True")
        cn.Open()
        Return cn
    End Function
    Public Sub exequery(ByVal str As String)
        cmd = New SqlCommand(str, connection())
        cmd.ExecuteNonQuery()
        cn.Close()
    End Sub
End Class
