using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;

[DataObject(true)]
public static class ProductDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllCategories()
    {
        string sel = "SELECT CategoryID, LongName "
                   + "FROM Categories ORDER BY LongName";

        SqlCommand cmd = new SqlCommand(sel, new SqlConnection(GetConnectionString()));

        cmd.Connection.Open();

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetProductsByCategory(string CategoryID)
    {
        string sel = "SELECT ProductID, Name, "
                   + "       UnitPrice, OnHand "
                   + "FROM Products "
                   + "WHERE CategoryID = @CategoryID "
                   + "ORDER BY ProductID";

        SqlCommand cmd = new SqlCommand(sel, new SqlConnection(GetConnectionString()));

        cmd.Parameters.AddWithValue("CategoryID", CategoryID);

        cmd.Connection.Open();

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["HalloweenConnectionString"].ConnectionString;
    }
}
