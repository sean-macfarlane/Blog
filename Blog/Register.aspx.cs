using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace Assignment1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void RegisterUser(object sender, EventArgs e)
        {
                      
            User user = new User
            {
                Email = txtEmail.Text,
                Password = txtPassword.Text,
                FirstName = txtFirst.Text,
                LastName = txtLast.Text,
                Phone = txtPhone.Text,
                Birth =  DateTime.Parse(txtBirth.Text),
                Country = txtCountry.Text,
                CreatedDate = DateTime.Now,
                Admin = false
                
            };

            try
            {
                using (Assignment1Entities db = new Assignment1Entities())
                {

                    if (!db.Users.Any(u => u.Email == user.Email))
                    {
                        db.Users.Add(user);
                        db.SaveChanges();
                        Session["FullName"] = user.FirstName + ' ' + user.LastName;
                        FormsAuthentication.SetAuthCookie(user.Email, false);
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An account with the email address: " + txtEmail + "already exists.\\nPlease enter a different email address');", true);
                    }
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }   
        }
    }
}