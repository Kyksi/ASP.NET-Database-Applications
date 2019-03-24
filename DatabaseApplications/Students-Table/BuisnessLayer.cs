using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace DatabaseApplications.Students_Table
{
    public class BuisnessLayer
    {
        DataAccessLayer dal = new DataAccessLayer();

        public int id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public int index { get; set; }


        public DataSet selectStudents()
        {
            string sqlquery = "select * from Students";
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = sqlquery;

            return dal.displayData(sqlcmd);
        }
        
        public void insertStudents()
        {
            string sqlQuery = String.Format("insert into Students values('{0}','{1}', '{2}')", name, surname, index);

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = sqlQuery;

            dal.queryExecution(sqlcmd);
        }

        public void updateStudents()
        {
            string sqlQuery = string.Format("update Students set Name='{0}',Surname='{1}', StudentIndex='{2}' where ID={3}", name, surname, index, id);

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = sqlQuery;

            dal.queryExecution(sqlcmd);

        }
    }
}