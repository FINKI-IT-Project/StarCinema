using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for InsertData
/// </summary>
public class InsertData
{
    public static void insertData()
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;
        int[] movie_id = { 6, 7, 8, 9, 10, 11, 12, 13, 14 };
        string[] day = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };

        for (int i = 0; i < day.Length; ++i)
        {
            Random rnd = new Random();
            movie_id = movie_id.OrderBy(x => rnd.Next()).ToArray();
            for (int j = 0; j < 9; ++j)
            {
                SqlConnection con = new SqlConnection(connectionString);
                try
                {
                    SqlCommand com = new SqlCommand();
                    com.Connection = con;
                    com.CommandText = "INSERT INTO screenings (movie_id, hall, term, day) VALUES(@MID, @HALL, @TERM, @DAY);";
                    com.Parameters.AddWithValue("@DAY", day[i]);
                    con.Open();
                    com.Parameters.AddWithValue("@MID", movie_id[j]);
                    com.Parameters.AddWithValue("@HALL", (j / 3) + 1);
                    com.Parameters.AddWithValue("@TERM", (j % 3) + 1);
                    com.ExecuteNonQuery();
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

    public static void insertSeatings()
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

        for (int i = 64; i < 118; ++i)
        {
            for (int j = 1; j <= 10; ++j)
            {
                for (int k = 1; k <= 10; ++k)
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    try
                    {
                        SqlCommand com = new SqlCommand();
                        com.Connection = con;
                        com.CommandText = "INSERT INTO seats (screen_id, row, number) VALUES(@SCR, @ROW, @NUM);";
                        com.Parameters.AddWithValue("@SCR", i);
                        com.Parameters.AddWithValue("@ROW", j);
                        com.Parameters.AddWithValue("@NUM", k);
                        con.Open();
                        com.ExecuteNonQuery();
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
    }
}