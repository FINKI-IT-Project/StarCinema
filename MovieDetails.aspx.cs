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
        
        int[] row = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };


        // Insert movie screening day, term, hall;
        // InsertData.insertData();

        // Insert movie seats;
        // InsertData.insertSeatings();

        SqlConnection con = new SqlConnection(connectionString);
        DataSet ds = new DataSet();
        SqlDataReader dr = null;

        try
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT day, term, hall FROM screenings WHERE movie_id=@MID;";
            com.Parameters.AddWithValue("@MID", Request.QueryString["id"]);

            con.Open();

            dr = com.ExecuteReader();
            movieScreenings.DataSource = dr;
            movieScreenings.DataBind();
        }
        catch (Exception ex)
        {
            Console.WriteLine("ERROR: ------ " + ex.Message);
        }
        finally
        {
            con.Close();
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