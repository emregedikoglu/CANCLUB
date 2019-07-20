using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class ListAllUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User loggeduser = (User)Session["currentuser"];

            if (loggeduser == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (loggeduser.UserType == "user")
            {
                Response.Redirect("Home.aspx");
            }
            else if (loggeduser != null)
            {
                using (var myDB = new canclubEntities1())
                {
                    LabelWelcome.Text = loggeduser.Username;
                    LabelWelcome.Visible = true;

                    var allusers = (from u in myDB.User
                                    where (u.IsActive == true)
                                    select u).ToList();

                    ListAllUsersGridView.DataSource = allusers;
                    ListAllUsersGridView.DataBind();
                }
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            using (var myDb = new canclubEntities1())
            {
                int id = Int32.Parse(TextBoxDelete.Text);
                var user = (from u in myDb.User
                            where (id == u.UserId)
                            select u).SingleOrDefault();

                user.IsActive = false;

                myDb.SaveChanges();

                Label6.Text = "User deleted successfully";
            }
        }
    }
}