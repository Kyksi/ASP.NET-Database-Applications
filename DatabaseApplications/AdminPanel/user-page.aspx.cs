﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseApplications.AdminPanel
{
    public partial class user_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                userInfoLabel.Text = "  Username: " + Session["user"].ToString();
            }
            else Response.Redirect("Login/Login.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["role"] = null;
            Response.Redirect("Login/Login.aspx");
        }
    }
}