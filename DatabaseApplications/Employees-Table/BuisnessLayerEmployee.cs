using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DatabaseApplications.Employees_Table
{
    public class BuisnessLayerEmployee
    {
        public int id { get; set; }
        public String name { get; set; }
        public String last_name { get; set; }
        public String pesel { get; set; }
        public String department { get; set; }
        public int id_department { get; set; }
        public String city { get; set; }
        public String street { get; set; }
        public String zip_code { get; set; }
        public String phone1 { get; set; }
        public String phone2 { get; set; }


        DataAccesslayerEmployee dale = new DataAccesslayerEmployee();

        public DataSet selectEmployee()
        {
            string sqlquery = "SELECT Employees.id_employee, Employees.name, Employees.last_name, " +
                "Employees.pesel, Adresses.city, Adresses.zip_code, Adresses.street, " +
                "Departments.department_name, Phones.phone_number " +
                "FROM Adresses INNER JOIN Employees ON Adresses.id_emoloyee = Employees.id_employee " +
                "INNER JOIN Departments ON Employees.id_department = Departments.id_department " +
                "INNER JOIN Phones ON Employees.id_employee = Phones.id_employee";
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandText = sqlquery;

            return dale.displayData(sqlcmd);
        }

        public void insertEmployee()
        {
            SqlCommand sqlcmd = new SqlCommand("NewEmployee_v2");
            sqlcmd.CommandType = CommandType.StoredProcedure;

            sqlcmd.Parameters.Add("@name", SqlDbType.VarChar, 20).Value = name;
            sqlcmd.Parameters.Add("@last_name", SqlDbType.VarChar, 30).Value = last_name;
            sqlcmd.Parameters.Add("@pesel", SqlDbType.VarChar, 11).Value = pesel;
            sqlcmd.Parameters.Add("@id_department", SqlDbType.Int).Value = id_department;
            sqlcmd.Parameters.Add("@phone1", SqlDbType.VarChar, 11).Value = phone1;
            sqlcmd.Parameters.Add("@phone2", SqlDbType.VarChar, 11).Value = phone2;
            sqlcmd.Parameters.Add("@city", SqlDbType.VarChar, 50).Value = city;
            sqlcmd.Parameters.Add("@zip_code", SqlDbType.VarChar, 6).Value = zip_code;
            sqlcmd.Parameters.Add("@street", SqlDbType.VarChar, 50).Value = street;

            dale.queryExecution(sqlcmd);
        }

    }
}