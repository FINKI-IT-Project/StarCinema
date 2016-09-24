using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public int reserveSeat(string screen_id, string seatRow, string seatNumber)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "DELETE FROM seats WHERE screen_id = @SID AND row = @ROW AND number = @NUM;";
        com.Parameters.AddWithValue("@SID", screen_id);
        com.Parameters.AddWithValue("@ROW", seatRow);
        com.Parameters.AddWithValue("@NUM", seatNumber);
        string number = seatNumber;
        int rowsAffected = 0;

        try
        {

            con.Open();
            rowsAffected = com.ExecuteNonQuery();
            
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }


        return rowsAffected;
          
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

}
