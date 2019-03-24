using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DatabaseApplications.Students_Table
{
    public partial class students_table : System.Web.UI.Page
    {
        BuisnessLayer bs = new BuisnessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                display();
            else
                addToFooter();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bs.id = Int32.Parse(GridView1.DataKeys[e.RowIndex]["Id"].ToString());
            bs.deleteStudent();
            display();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            display();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            display();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            bs.id = Int32.Parse(GridView1.DataKeys[e.RowIndex]["Id"].ToString());
            bs.name = e.NewValues["Name"].ToString();
            bs.surname = e.NewValues["Surname"].ToString();
            bs.index = Int32.Parse(e.NewValues["StudentIndex"].ToString());

            GridView1.EditIndex = -1;

            bs.updateStudents();
            display();
        }

        public void AddNew(object sender, EventArgs e)
        {
            bs.name = ((TextBox)GridView1.FooterRow.Cells[1].Controls[0]).Text;
            bs.surname = ((TextBox)GridView1.FooterRow.Cells[2].Controls[0]).Text;
            bs.index = Int32.Parse(((TextBox)GridView1.FooterRow.Cells[3].Controls[0]).Text);

            bs.insertStudents();
            Response.Redirect("students-table.aspx");
        }

        public void display()
        {
            GridView1.DataSource = bs.selectStudents();
            GridView1.DataBind();

            addToFooter();
        }

        public void addToFooter()
        {
            TextBox txt = new TextBox();
            TextBox txt2 = new TextBox();
            TextBox txt3 = new TextBox();
            Button btn = new Button();
            btn.ID = new Guid().ToString();
            btn.CssClass = "btn btn-success";
            btn.Text = "Add +";
            btn.Click += new EventHandler(AddNew);
            GridView1.FooterRow.Cells[1].Controls.Add(txt);
            GridView1.FooterRow.Cells[2].Controls.Add(txt2);
            GridView1.FooterRow.Cells[3].Controls.Add(txt3);
            GridView1.FooterRow.Cells[5].Controls.Add(btn);
        }
    }
}