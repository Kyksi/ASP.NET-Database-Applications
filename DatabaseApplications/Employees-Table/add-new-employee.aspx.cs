using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseApplications.Employees_Table
{
    public partial class add_new_employee : System.Web.UI.Page
    {
        BuisnessLayerEmployee buisnessLayer = new BuisnessLayerEmployee();
        static String name, last_name, pesel, department, city, street, zip_code, phone1, phone2;
        static int id_department;

        protected void Page_Load(object sender, EventArgs e)
        {
            err_msg1.Visible = false;
            err_msg2.Visible = false;
            err_msg3.Visible = false;

            if (!IsPostBack)
                MultiView1.ActiveViewIndex = 0;

            invalid_phone1.Validate();
            if (invalid_phone1.IsValid && !txt_phone1.Text.Equals("")) txt_phone2.Enabled = true;
                else txt_phone2.Enabled = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("employee-table.aspx");
        }

        protected void btnGoNextToSecondView_Click(object sender, EventArgs e)
        {
            if (!txt_name.Text.Equals("") && !txt_last_name.Text.Equals("") && !txt_pesel.Text.Equals("")
                && !departmentDropDownList.SelectedIndex.Equals(0))
                    MultiView1.ActiveViewIndex = 1;
            else err_msg1.Visible = true;
        }

        protected void btnGoNextToThirdView_Click(object sender, EventArgs e)
        {
            if (!txt_city.Text.Equals("") && !txt_street.Text.Equals("") && !txt_zip.Text.Equals(""))
                MultiView1.ActiveViewIndex = 2;
            else err_msg2.Visible = true;
        }

        protected void btnGoBackToFirstView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnGoNextToFoursView_Click(object sender, EventArgs e)
        {
            if (!txt_phone1.Text.Equals("")) showSummary();
            else err_msg3.Visible = true;

        }

        protected void btnGoBackToSecondView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnGoBackToThirdView_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        private void showSummary()
        {
            MultiView1.ActiveViewIndex = 3;
            name = txt_name.Text;
            last_name = txt_last_name.Text;
            pesel = txt_pesel.Text;
            department = departmentDropDownList.Text;
            id_department = Convert.ToInt16(departmentDropDownList.SelectedIndex);
            city = txt_city.Text;
            street = txt_street.Text;
            zip_code = txt_zip.Text;
            phone1 = txt_phone1.Text;
            phone2 = txt_phone2.Text;

            label_name.Text = name; label_last_name.Text = last_name; label_pesel.Text = pesel;
            label_department.Text = department; label_address.Text = zip_code + ", " + city + ", " + street;
            label_phone1.Text = phone1;

            if (!phone2.Equals("")) label_phone2.Text = phone2;
            else label_phone2.Text = "Second phone nr. wasn't provided";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            buisnessLayer.name = txt_name.Text;
            buisnessLayer.last_name = last_name;
            buisnessLayer.pesel = pesel;
            buisnessLayer.id_department = id_department;
            buisnessLayer.phone1 = phone1;
            buisnessLayer.phone2 = phone2;
            buisnessLayer.city = city;
            buisnessLayer.zip_code = zip_code;
            buisnessLayer.street = street;

            try
            {
                buisnessLayer.insertEmployee();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                Server.Transfer("employee-table.aspx");
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong...')", true);
            }
        }
    }
}