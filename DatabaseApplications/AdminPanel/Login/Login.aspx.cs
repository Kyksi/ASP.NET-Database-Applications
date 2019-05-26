using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseApplications.Login
{
    public partial class Login : System.Web.UI.Page
    {
        AdminPanel.AdministrationLayer al = new AdminPanel.AdministrationLayer();

        public void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            al.login = login.Text;
            al.password = password.Text;

            DataTable dt = new DataTable();
            dt = al.selectUser();

            if (dt.Rows.Count == 1)
            {
                Session["user"] = dt.Rows[0].ItemArray[0].ToString();
                Session["role"] = dt.Rows[0].ItemArray[1].ToString();

                switch (Session["role"])
                {
                    case "User":
                        Response.Redirect("../user-page.aspx");
                        break;
                    case "Admin":
                        Response.Redirect("../admin-page.aspx");
                        break;
                    case "AdvancedUser":
                        Response.Redirect("../adv-user-page.aspx");
                        break;
                }
            }
            else
            {
                LoginResult.Text = "Login or password are not correct!";
            }
        }
    }
}