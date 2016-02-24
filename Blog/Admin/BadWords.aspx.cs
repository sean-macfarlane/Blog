using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1.Admin
{
    public partial class BadWords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Assignment1Entities db = new Assignment1Entities();
                badwords.DataSource = db.BadWords.ToList();
                badwords.DataBind();
            }
        }

        protected void AddBadWord(object sender, EventArgs e)
        {
            try
            {
                Assignment1Entities db = new Assignment1Entities();
                BadWord word = new BadWord();

                word.Users_UserId = db.Users.FirstOrDefault(u => u.Email == (HttpContext.Current.User.Identity.Name)).UserId;
                word.Text = txtBad.Text;
                word.CreatedDate = DateTime.Now;

                db.BadWords.Add(word);
                db.SaveChanges();
                Response.Redirect("/Admin/BadWords.aspx");
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
            }
        }

        protected void delete_OnClick(object sender, EventArgs e)
        {
            Assignment1Entities db = new Assignment1Entities();
            int id = Int32.Parse(((Button)sender).CommandArgument);
            db.BadWords.Remove(db.BadWords.Where(b => b.BadWordId == id).First());
            db.SaveChanges();
            badwords.DataSource = db.BadWords.ToList();
            badwords.DataBind();
        }
    }
}