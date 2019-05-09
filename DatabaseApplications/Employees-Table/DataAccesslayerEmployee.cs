using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DatabaseApplications.Employees_Table
{
    public class DataAccesslayerEmployee
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

        public void queryExecution(SqlCommand sqlcmd)
        {
            sqlcmd.Connection = conn;
            conn.Open();
            sqlcmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}