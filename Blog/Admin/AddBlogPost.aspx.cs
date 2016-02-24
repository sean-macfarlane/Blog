using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1.Admin
{
    public partial class AddBlogPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assignment1Entities db = new Assignment1Entities();
                User user = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name));
                txtAuthor.Text = user.FirstName + ' ' + user.LastName;
            }
        }
        protected void CreatePost(object sender, EventArgs e)
        {
            try
            {
                Assignment1Entities db = new Assignment1Entities();
                Post post = new Post
                {
                    Users_UserId = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name)).UserId,
                    Title = txtTitle.Text,
                    Author = txtAuthor.Text,
                    Description = txtDescription.Text,
                    HtmlText = txtHTML.Text,
                    IsAvailable = checkBox.Checked,
                    CreatedDate = DateTime.Now
                 
                };
                db.Posts.Add(post);
                db.SaveChanges();  
                Response.Redirect("/Admin/AdminHome.aspx");
            }
            catch {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }
        }
    }
}