using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Assignment1Entities db = new Assignment1Entities();
                var admin = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name)).Admin;
                sessionFullNameLabel.Text = Session["FullName"].ToString();
                LoginMenu.Visible = false;
                UserMenu.Visible = true;
                if((bool)admin){
                   sessionFullNameLabel2.Text = Session["FullName"].ToString();
                    UserMenu.Visible = false;
                    Admin.Visible = true;
               }
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}