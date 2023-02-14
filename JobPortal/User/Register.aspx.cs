using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace JobPortal.User
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into UserData(UserName,password,fullName,Address,Email,MobileNumber,Contery) values(@UserName,@password,@fullName,@Address,@Email,@MobileNumber,@Contery)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtconfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@fullName", txtFullname.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Contery", ddlCountry.SelectedValue);

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Registerd Sucessfully!";
                    lblMsg.CssClass = "alert alert-sucess";
                    Clear();

                    
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Not able to save record right now, Plz try after sometime..!!";
                    lblMsg.CssClass = "alert alert-danger";

                }
            }
            catch(SqlException ex) 
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text ="<b>"+ txtUsername.Text.Trim() + "Username Is Already Exist, Try New one";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else 
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            catch (Exception ex) 
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            finally { con.Close(); }
        }

        private void Clear()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtFullname.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtconfirmPassword.Text = string.Empty;
            ddlCountry.ClearSelection();

        }
    }
}