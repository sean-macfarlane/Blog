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
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assignment1Entities db = new Assignment1Entities();
                User user = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name));
                txtFirst.Text = user.FirstName;
                txtLast.Text = user.LastName;
                txtPhone.Text = user.Phone;
                txtBirth.Text = user.Birth.ToString("yyyy-MM-dd");
                txtCountry.Text = user.Country;
            }
           
        }

        protected void UpdateUser(object sender, EventArgs e)
        {
            try
            {
                        Assignment1Entities db = new Assignment1Entities();
                        User user = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name));
                        user.Email = txtEmail.Text;
                        user.Password = txtPassword.Text;
                        user.FirstName = txtFirst.Text;
                        user.LastName = txtLast.Text;
                        user.Phone = txtPhone.Text;
                        user.Birth = DateTime.Parse(txtBirth.Text);
                        user.Country = txtCountry.Text;      
                        db.SaveChanges();
                        FormsAuthentication.SetAuthCookie(user.Email, false);
                        Response.Redirect("~/Default.aspx");                       
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }
        }
    }
}