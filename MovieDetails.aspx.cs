using System;
using System.Collections;
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
        Page.MaintainScrollPositionOnPostBack = true;

        if (Page.IsPostBack == false)
        {

            messageSuccess.Visible = false;

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
                com.CommandText = "SELECT screen_id, day, term, hall FROM screenings WHERE movie_id=@MID;";
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

        // Check if user is logged in;
        bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;

        if (val1)
        {
            movieScreenings.Enabled = true;
        }
        else
        {
            movieScreenings.Enabled = false;
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

    protected void seatRow_SelectedIndexChanged(object sender, EventArgs e)
    {

        messageSuccess.Visible = false;
        DropDownList changedDropDownList = sender as DropDownList;
        var noSeats = new List<string> { "No free seats!" };
        var noRow = new List<string> { "No row selected!" };

        GridViewRow row = changedDropDownList.Parent.Parent as GridViewRow;

        DropDownList seatNumber = row.FindControl("seatNumber") as DropDownList;
        DropDownList seatRow = row.FindControl("seatRow") as DropDownList;
        if (seatNumber != null)
        {
            if (seatRow.Text == "-- Select row --")
            {
                seatNumber.DataSource = noRow;
                seatNumber.DataTextField = null;
                seatNumber.DataBind();
                seatNumber.Enabled = false;
                return;
            }


            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT number FROM seats WHERE screen_id = @SID AND row = @ROW;";
            com.Parameters.AddWithValue("@SID", row.Cells[0].Text.ToString());
            com.Parameters.AddWithValue("@ROW", seatRow.Text.ToString());

            SqlDataReader sdr;
            try
            {
                con.Open();
                sdr = com.ExecuteReader();
                if (sdr.HasRows)
                {
                    seatNumber.DataSource = sdr;
                    seatNumber.DataTextField = "number";
                    seatNumber.DataBind();
                    seatNumber.Enabled = true;
                }
                else
                {
                    seatNumber.DataSource = noSeats;
                    seatNumber.DataTextField = null;
                    seatNumber.DataBind();
                    seatNumber.Enabled = false;
                }
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



    protected void reserveMovie_Click(object sender, EventArgs e)
    {

        var noSeats = new List<string> { "No free seats!" };
        Control a = sender as Control;
        GridViewRow row = a.Parent.Parent as GridViewRow;

        string screen_id = row.Cells[0].Text;
        DropDownList seatRow = row.FindControl("seatRow") as DropDownList;
        DropDownList seatNumber = row.FindControl("seatNumber") as DropDownList;

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM seats WHERE screen_id = @SID AND row = @ROW AND number = @NUM;";
        com.Parameters.AddWithValue("@SID", screen_id);
        com.Parameters.AddWithValue("@ROW", seatRow.Text.ToString());
        com.Parameters.AddWithValue("@NUM", seatNumber.Text.ToString());
        string number = seatNumber.Text;


        try
        {
            con.Open();
            int rows = com.ExecuteNonQuery();

            lbl1.Text = rows + " rows affected.";

            if (rows > 0)
            {
                seatNumber.Items.Remove(seatNumber.Text);
                messageSuccess.Visible = true;
                messageSuccess.Text = "<span class='glyphicon glyphicon-ok'></span> <b>Success!</b> You have successfully reserved your seat - Row: <b>" + seatRow.Text + "</b> Number: <b>" + number + "</b>";
            }

            if (seatNumber.Items.Count == 0)
            {
                seatNumber.DataSource = noSeats;
                seatNumber.DataTextField = null;
                seatNumber.DataBind();
                seatNumber.Enabled = false;
            }



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