using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string username, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLogintype.SelectedValue =="Admin")
                {
                    username = ConfigurationManager.AppSettings["username"];
                    password = ConfigurationManager.AppSettings["password"];
                    if (username == txtUsername.Text.Trim() && password == txtPassword.Text.Trim())
                    {
                        Session["admin"] = username;
                        Response.Redirect("../Admin/Dashboard.aspx",false);
                    }
                    else
                    {
                        showErrorMsg("Admin");
                    }
                }
                else
                {
                    con = new SqlConnection(str);
                    string query = @"select* from UserData where UserName=@UserName and password=@password";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    con.Open();
                    sdr  = cmd.ExecuteReader();
                    if (sdr.Read()) 
                    {
                        Session["user"] = sdr["username"].ToString();
                        Session["userId"] = sdr["userId"].ToString();
                        Response.Redirect("Default.aspx", false);
                    }
                    else
                    {
                        showErrorMsg("User");
                    }
                    con.Close();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                con.Close();
            }
            
        }

        private void showErrorMsg(string userType)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "<b>" + userType + "Credentials are Incorrect ..!";
            lblMsg.CssClass = "alert alert-danger";
        }
    }
}