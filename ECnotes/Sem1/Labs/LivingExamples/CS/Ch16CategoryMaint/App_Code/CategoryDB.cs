using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;

[DataObject(true)]
public static class CategoryDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetCategories()
    {
        string sel = "SELECT CategoryID, ShortName, LongName "
                   + "FROM Categories ORDER BY ShortName";

        SqlCommand cmd = new SqlCommand(sel, new SqlConnection(GetConnectionString()));

        cmd.Connection.Open();

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["HalloweenConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertCategory(string CategoryID, string ShortName, string LongName)
    {
        string ins = "INSERT INTO Categories "
                    + " (CategoryID, ShortName, LongName) "
                    + " VALUES(@CategoryID, @ShortName, @LongName)";

        SqlCommand cmd = new SqlCommand(ins, new SqlConnection(GetConnectionString()));

        cmd.Parameters.AddWithValue("CategoryID", CategoryID);
        cmd.Parameters.AddWithValue("ShortName", ShortName);
        cmd.Parameters.AddWithValue("LongName", LongName);

        cmd.Connection.Open();

        int i = cmd.ExecuteNonQuery();

        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteCategory(string original_CategoryID,
        string original_ShortName, string original_LongName)
    {
        string del = "DELETE FROM Categories "
                   + "WHERE CategoryID = @original_CategoryID "
                   + "  AND ShortName = @original_ShortName "
                   + "  AND LongName = @original_LongName ";

        SqlCommand cmd = new SqlCommand(del, new SqlConnection(GetConnectionString()));

        cmd.Parameters.AddWithValue("original_CategoryID", original_CategoryID);
        cmd.Parameters.AddWithValue("original_ShortName", original_ShortName);
        cmd.Parameters.AddWithValue("original_LongName", original_LongName);
        cmd.Connection.Open();

        int i = cmd.ExecuteNonQuery();

        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateCategory(string ShortName, 
        string LongName, string original_CategoryID, 
        string original_ShortName, string original_LongName)
    {
        string up = "UPDATE Categories "
                  + "SET ShortName = @ShortName, "
                  + "LongName = @LongName "
                  + "WHERE CategoryID = @original_CategoryID "
                  + "  AND ShortName = @original_ShortName "
                  + "  AND LongName = @original_LongName";

        SqlCommand cmd = new SqlCommand(up, new SqlConnection(GetConnectionString()));

        cmd.Parameters.AddWithValue("ShortName", ShortName);
        cmd.Parameters.AddWithValue("LongName", LongName);
        cmd.Parameters.AddWithValue("original_CategoryID", original_CategoryID);
        cmd.Parameters.AddWithValue("original_ShortName", original_ShortName);
        cmd.Parameters.AddWithValue("original_LongName", original_LongName);

        cmd.Connection.Open();

        int i = cmd.ExecuteNonQuery();

        return i;
    }
}
