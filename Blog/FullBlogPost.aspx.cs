using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class FullBlogPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id;
                Int32.TryParse(Request.QueryString["id"], out id);

                Assignment1Entities db = new Assignment1Entities();
                Post post = db.Posts.FirstOrDefault(p => p.PostId == id);
                Page.Title = post.Title;
                Title.Text = post.Title;
                Author.Text = post.Author;
                Content.Text = post.HtmlText;
                CreatedDate.Text = post.CreatedDate.ToString();

                comments.DataSource = db.Comments.Where(c => c.Posts_PostId == id).ToList();
                comments.DataBind();
            }
            if (this.Page.User.Identity.IsAuthenticated)
            {
                AddCommentPanel.Visible = true;
            }

        }

        protected void AddComment(object sender, EventArgs e)
        {
            try
            {
                
                int id;
                Int32.TryParse(Request.QueryString["id"], out id);

                Assignment1Entities db = new Assignment1Entities();
                Comment comment = new Comment();
                
                    comment.Posts_PostId = id;
                    comment.Users_UserId = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name)).UserId;
                    comment.Text = txtComment.Text;
                    comment.CreatedDate = DateTime.Now;

                
                db.Comments.Add(comment);
                db.SaveChanges();
                Response.Redirect("/FullBlogPost.aspx?id="+id);
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }
        }

        protected String BadWords(object sender)
        {
            String parsed = (String)sender;

            Assignment1Entities db = new Assignment1Entities();
            foreach(var b in db.BadWords.ToList() ){
                parsed = parsed.Replace(b.Text, "*****");
            }

            return parsed;
        }
    }
}