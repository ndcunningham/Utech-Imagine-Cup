Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.SqlClient

<DataObject(True)> _
Public Class ProductDB

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetAllCategories() As IEnumerable
        Dim sel As String = "SELECT CategoryID, LongName " _
            & "FROM Categories ORDER BY LongName"
        Dim cmd As SqlCommand = _
            New SqlCommand(sel, New SqlConnection(GetConnectionString))
        cmd.Connection.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return dr
    End Function

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetProductsByCategory(ByVal CategoryID As String) _
            As IEnumerable
        Dim sel As String = "SELECT ProductID, Name, " _
            & "UnitPrice, OnHand " _
            & "FROM Products " _
            & "WHERE CategoryID = @CategoryID " _
            & "ORDER BY ProductID"
        Dim cmd As SqlCommand = _
            New SqlCommand(sel, New SqlConnection(GetConnectionString))
        cmd.Parameters.AddWithValue("CategoryID", CategoryID)
        cmd.Connection.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return dr
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings _
            ("HalloweenConnection").ConnectionString
    End Function

End Class
