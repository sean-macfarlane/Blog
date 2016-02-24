using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ValidateUser(object sender, EventArgs e)
        {
            using (Assignment1Entities db = new Assignment1Entities())
            {
                User user = db.Users.FirstOrDefault(u => u.Email == txtEmail.Text && u.Password == txtPassword.Text);
                if (user == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Wrong Email and Password.\\nOr Account does not exist.');", true);
                }
                else
                {
                    user.LastLoginDate = DateTime.Now;
                    db.SaveChanges();
                    Session["FullName"] = user.FirstName + ' ' + user.LastName;
                    FormsAuthentication.SetAuthCookie(user.Email, false);
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
    }
}