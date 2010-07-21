Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

<DataObject(True)> _
Public Class CategoryDB

    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetCategories() As IEnumerable
        Dim sel As String = "SELECT CategoryID, ShortName, LongName " _
            & "FROM Categories ORDER BY ShortName"
        Dim cmd As SqlCommand = _
            New SqlCommand(sel, New SqlConnection(GetConnectionString))
        cmd.Connection.Open()
        Return cmd.ExecuteReader(CommandBehavior.CloseConnection)
    End Function

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings _
            ("HalloweenConnection").ConnectionString
    End Function

    <DataObjectMethod(DataObjectMethodType.Insert)> _
    Public Shared Sub InsertCategory(ByVal CategoryID As String, _
            ByVal ShortName As String, ByVal LongName As String)
        Dim ins As String = "INSERT INTO Categories " _
            & "(CategoryID, ShortName, LongName) " _
            & "VALUES(@CategoryID, @ShortName, @LongName)"
        Dim cmd As SqlCommand = _
            New SqlCommand(ins, New SqlConnection(GetConnectionString))
        cmd.Parameters.AddWithValue("CategoryID", CategoryID)
        cmd.Parameters.AddWithValue("ShortName", ShortName)
        cmd.Parameters.AddWithValue("LongName", LongName)
        cmd.Connection.Open()
        cmd.ExecuteNonQuery()
    End Sub

    <DataObjectMethod(DataObjectMethodType.Delete)> _
    Public Shared Function DeleteCategory( _
            ByVal original_CategoryID As String, _
            ByVal original_ShortName As String, _
            ByVal original_LongName As String) _
            As Integer
        Dim del As String = "DELETE FROM Categories " _
            & "WHERE CategoryID = @original_CategoryID " _
            & "AND ShortName = @original_ShortName " _
            & "AND LongName = @original_LongName "
        Dim cmd As SqlCommand = _
            New SqlCommand(del, New SqlConnection(GetConnectionString))
        cmd.Parameters.AddWithValue("original_CategoryID", original_CategoryID)
        cmd.Parameters.AddWithValue("original_ShortName", original_ShortName)
        cmd.Parameters.AddWithValue("original_LongName", original_LongName)
        cmd.Connection.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        cmd.Connection.Close()
        Return i
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)> _
    Public Shared Function UpdateCategory(ByVal ShortName As String, _
            ByVal LongName As String, ByVal original_CategoryID As String, _
            ByVal original_ShortName As String, _
            ByVal original_LongName As String) As Integer
        Dim up As String = "UPDATE Categories " _
            & "SET ShortName = @ShortName, " _
            & "LongName = @LongName " _
            & "WHERE CategoryID = @original_CategoryID " _
            & "AND ShortName = @original_ShortName " _
            & "AND LongName = @original_LongName"
        Dim cmd As SqlCommand = _
            New SqlCommand(up, New SqlConnection(GetConnectionString))
        cmd.Parameters.AddWithValue("ShortName", ShortName)
        cmd.Parameters.AddWithValue("LongName", LongName)
        cmd.Parameters.AddWithValue("original_CategoryID", original_CategoryID)
        cmd.Parameters.AddWithValue("original_ShortName", original_ShortName)
        cmd.Parameters.AddWithValue("Original_LongName", original_LongName)
        cmd.Connection.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        cmd.Connection.Close()
        Return i
    End Function

End Class
