using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assignment1Entities db = new Assignment1Entities();
                posts.DataSource = db.Posts.ToList();
                posts.DataBind();
            }
        }
        protected void delete_OnClick(object sender, EventArgs e)
        {
            Assignment1Entities db = new Assignment1Entities();
            int id = Int32.Parse(((Button)sender).CommandArgument);
            db.Comments.RemoveRange(db.Comments.Where(c => c.Posts_PostId == id).ToList());
            db.SaveChanges();

            db.Posts.Remove(db.Posts.Where(p => p.PostId == id).First());
            db.SaveChanges();
            posts.DataSource = db.Posts.ToList();
            posts.DataBind();
        }
        protected void edit_OnClick(object sender, EventArgs e)
        {          
            int id = Int32.Parse(((Button)sender).CommandArgument);
            Response.Redirect("/Admin/EditBlogPost.aspx?id="+id);
        }
        protected void clickAddBlogPost(object sender, EventArgs e)
        {      
            Response.Redirect("/Admin/AddBlogPost.aspx");
        }
    }
}