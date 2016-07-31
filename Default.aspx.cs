using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{

    static string DEFAULT_MOVIE_POSTER = "resources/images/default-movie.png";

    protected void Page_Load(object sender, EventArgs e)
    {
        imageOne.ImageUrl = DEFAULT_MOVIE_POSTER;
        imageTwo.ImageUrl = DEFAULT_MOVIE_POSTER;
        imageThree.ImageUrl = DEFAULT_MOVIE_POSTER;
        imageFour.ImageUrl = DEFAULT_MOVIE_POSTER;
        imageFive.ImageUrl = DEFAULT_MOVIE_POSTER;
        imageSix.ImageUrl = DEFAULT_MOVIE_POSTER;

        if (!Page.IsPostBack)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = 
                "SELECT * FROM movies;";

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            // TODO

            try
            {
                con.Open();

                da.SelectCommand = com;
                da.Fill(ds);

                movieList.DataSource = ds;
                movieList.DataBind();


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }

        }
    }
}