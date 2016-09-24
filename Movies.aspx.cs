using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Movies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select movies.movie_id, movies.movie_name, screenings.day, screenings.hall, screenings.term FROM movies INNER JOIN screenings ON movies.movie_id = screenings.movie_id;";

        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter();

        try
        {
            con.Open();
            sda.SelectCommand = com;
            sda.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            ViewState["ds"] = ds;
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }


    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataSet ds = (DataSet)ViewState["ds"];
        GridView1.DataSource = ds;
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}