using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MovieDetails : System.Web.UI.Page
{

    static string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            setMovieName(Request.QueryString["id"].ToString());
        }
        catch (Exception ex)
        {
            Response.Redirect("Default.aspx");
        }
    }


    protected void setMovieName(string id)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT movie_name FROM movies WHERE movie_id=@MID;";
        com.Parameters.AddWithValue("@MID", id);
        SqlDataReader sdr;

        try
        {
            con.Open();
            sdr = com.ExecuteReader();

            if (sdr.Read())
            {

                movieTitle.Text = sdr[0].ToString();

            }
            else
            {
                Response.Redirect("Default.aspx");
            }

            sdr.Close();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }


    }

}