using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal.User
{
    public partial class UserMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] !=null)
            {
                lbRegisterOrProfile.Text = "profile";
                lbLogin.Text = "Logout";
            }
            else
            {
                lbRegisterOrProfile.Text = "Register";
                lbLogin.Text = "login";
            }
        }

        protected void lbRegisterOrProfile_Click(object sender, EventArgs e)
        {
            if (lbRegisterOrProfile.Text =="profile" )
            {
                Response.Redirect("profile.aspx");
            }
            else
            {
                Response.Redirect("Register.aspx");
            }
        }

        protected void lbLogin_Click(object sender, EventArgs e)
        {
            if (lbLogin.Text == "Login")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
    }
}