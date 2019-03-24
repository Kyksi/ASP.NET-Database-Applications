using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DatabaseApplications.Students_Table
{
    public class DataAccessLayer
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentsConnect"].ConnectionString);

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