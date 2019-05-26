using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DatabaseApplications.AdminPanel
{
    public class DataAccessLayer_Admin
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SomeeDatabaseConnectionString"].ConnectionString);

        public DataSet displayData(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = conn;
            SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
            DataSet ds = new DataSet();

            sda.Fill(ds);

            return ds;
        }

        public DataTable displayData2(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = conn;
            SqlDataAdapter sda = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();

            sda.Fill(dt);

            return dt;
        }

        public SqlDataReader returnReader(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = conn;
            conn.Open();
            SqlDataReader reader = sqlcmd.ExecuteReader();
            conn.Close();

            return reader;
        }

        public void queryExecution(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = conn;
            conn.Open();
            sqlcmd.ExecuteNonQuery();
            conn.Close();
        }

    }
}