using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DatabaseApplications.AdminPanel
{
    public class AdministrationLayer
    {
        DataAccessLayer_Admin dal = new DataAccessLayer_Admin();

        public int id_user { get; set; }
        public int id_role { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public string role { get; set; }

        public DataTable selectUser()
        {
            string sqlquery =
                "SELECT Users.login, Roles.role_name FROM Users " +
                "INNER JOIN Roles ON Users.role_id = Roles.id_role " +
                "WHERE (Users.login = @login) AND (Users.password = @password)";


            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = sqlquery;

            sqlcmd.Parameters.Add("@login", SqlDbType.VarChar, 50).Value = login;
            sqlcmd.Parameters.Add("@password", SqlDbType.VarChar, 100).Value = password;

            return dal.displayData2(sqlcmd);
        }

        public DataTable selectAllUsers()
        {
            SqlCommand sqlcmd = new SqlCommand();
            string sqlquery = "SELECT Users.id_user, Users.login, Roles.role_name, Roles.role_description " +
                              "FROM Users INNER JOIN Roles ON Users.role_id = Roles.id_role";
            sqlcmd.CommandText = sqlquery;
            return dal.displayData2(sqlcmd);
        }

        public DataTable selectOneUser()
        {
            SqlCommand sqlcmd = new SqlCommand();
            string sqlquery = "SELECT Users.login, Users.password, Roles.id_role " +
                              "FROM Users INNER JOIN Roles ON Users.role_id = Roles.id_role WHERE (Users.id_user = @id_user)";
            sqlcmd.CommandText = sqlquery;

            sqlcmd.Parameters.Add("@id_user", SqlDbType.Int).Value = id_user;

            return dal.displayData2(sqlcmd);
        }

        public void AddNewUser()
        {
            SqlCommand sqlcmd = new SqlCommand();
            string sqlquery = string.Format ("INSERT INTO Users(login, password, role_id) VALUES ('{0}', '{1}', {2})", login, password, id_role);
            sqlcmd.CommandText = sqlquery;
            dal.queryExecution(sqlcmd);
        }

        public void deleteUser()
        {
            SqlCommand sqlcmd = new SqlCommand();
            string sqlquery = string.Format("DELETE FROM Users WHERE id_user = {0}", id_user);
            sqlcmd.CommandText = sqlquery;
            dal.queryExecution(sqlcmd);
        }

        public void editUser()
        {
            SqlCommand sqlcmd = new SqlCommand();
            string sqlquery = string.Format("UPDATE Users SET login = '{0}', password = '{1}', role_id = '{2}' WHERE id_user = {3}", login, password, id_role, id_user);
            sqlcmd.CommandText = sqlquery;
            dal.queryExecution(sqlcmd);
        }

    }
}