using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseApplications.AdminPanel
{
    public partial class admin_page : System.Web.UI.Page
    {
        AdministrationLayer al = new AdministrationLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null) { 
                if (Session["role"].ToString() != "Admin") Response.Redirect("Login/Login.aspx");
                else userInfoLabel.Text = "   username: " + Session["user"].ToString();

                if (!IsPostBack) displayData();
            } else Response.Redirect("Login/Login.aspx");

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            al.id_user = Int32.Parse(GridView1.DataKeys[e.RowIndex]["id_user"].ToString());
            al.deleteUser();
            Response.Redirect("admin-page.aspx");
        }

        public void displayData()
        {
            LabelError.Text = "";
            GridView1.DataSource = al.selectAllUsers();
            GridView1.DataBind();
        }

        protected void DropID_user_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            if (DropID_user.SelectedIndex != 0)
            {
                al.id_user = Convert.ToInt32(DropID_user.SelectedValue);
                dt = al.selectOneUser();
                TextBoxUsername.Text = dt.Rows[0].ItemArray[0].ToString();
                TextBoxPassword.Text = dt.Rows[0].ItemArray[1].ToString();
                DropRole.SelectedIndex = Convert.ToInt16(dt.Rows[0].ItemArray[2]) - 1;
            }
            else
            {
                TextBoxUsername.Text = "";
                TextBoxPassword.Text = "";
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            if(!TextBoxUsername.Text.Equals("") && TextBoxPassword.Text.Length >= 4 && DropID_user.SelectedIndex != 0)
            { 
                al.id_user = Convert.ToInt16(DropID_user.SelectedValue);
                al.login = TextBoxUsername.Text;
                al.password = TextBoxPassword.Text;
                al.id_role = DropRole.SelectedIndex + 1;

                al.editUser();
                displayData();
            }
            else
            {
                LabelError.Text = "Please don't leave empty fields while updating or adding users";
            }
        }

        protected void Add_new_Click(object sender, EventArgs e)
        {
            if (!TextBoxUsername.Text.Equals("") && TextBoxPassword.Text.Length >= 4)
            {
                al.login = TextBoxUsername.Text;
                al.password = TextBoxPassword.Text;
                al.id_role = DropRole.SelectedIndex + 1;

                al.AddNewUser();

                Response.Redirect("admin-page.aspx");
            }
            else
            {
                LabelError.Text = "Please don't leave empty fields while updating or adding users";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["role"] = null;
            Response.Redirect("Login/Login.aspx");
        }
    }
}