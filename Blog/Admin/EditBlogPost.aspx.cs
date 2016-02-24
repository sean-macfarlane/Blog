using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1.Admin
{
    public partial class EditBlogPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id;
                Int32.TryParse(Request.QueryString["id"], out id);

                Assignment1Entities db = new Assignment1Entities();
                Post post = db.Posts.FirstOrDefault(p => p.PostId == id);
                txtAuthor.Text = post.Author;
                txtTitle.Text = post.Title;
                txtDescription.Text = post.Description;
                txtHTML.Text = post.HtmlText;
                checkBox.Checked = post.IsAvailable;
            }
        }
        protected void EditPost(object sender, EventArgs e)
        {
            try
            {
                int id;
                Int32.TryParse(Request.QueryString["id"], out id);

                Assignment1Entities db = new Assignment1Entities();
                Post post = db.Posts.FirstOrDefault(p => p.PostId == id);
                post.Title = txtTitle.Text;
                post.Author = txtAuthor.Text;
                post.Description = txtDescription.Text;
                post.HtmlText = txtHTML.Text;
                post.IsAvailable = checkBox.Checked;
                db.SaveChanges();
               
                Response.Redirect("/Admin/AdminHome.aspx");
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }
        }
    }
}