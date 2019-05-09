using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseApplications.Employees_Table
{
    public partial class employee_table : System.Web.UI.Page
    {
        BuisnessLayerEmployee ble = new BuisnessLayerEmployee();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = ble.selectEmployee();
                GridView1.DataBind();
            }
        }

        protected void AddNewEmployee_Click(object sender, EventArgs e)
        {
            Server.Transfer("add-new-employee.aspx");
        }
    }
}