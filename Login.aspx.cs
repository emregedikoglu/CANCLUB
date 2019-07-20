using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            using (var myDB = new canclubEntities1())
            {
                /*User loggeduser = (from u in myDB.User
                                    where u.Email == TextBoxEmail.Text && u.Password == TextBoxPass.Text
                                    select u).SingleOrDefault();*/
                User loggeduser = (from u in myDB.User
                                   where u.Email == TextBoxEmail.Text && u.IsActive == true
                                   select u).SingleOrDefault();

                if (loggeduser != null)
                {
                    if (VerifyPassword(TextBoxPass.Text, loggeduser.Password) == true)
                    {
                        Session["currentuser"] = loggeduser;

                        if (loggeduser.UserType == "president")
                            Response.Redirect("President.aspx");
                        else
                            Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        LabelResult.Visible = true;
                        LabelResult.Text = "Wrong password!";
                    }
                }
                else
                {
                    LabelResult.Visible = true;
                    LabelResult.Text = "User not found!!";
                }
                /*if (loggeduser != null)
                {
                    Session["currentuser"] = loggeduser;

                    if (loggeduser.UserType == "president")
                        Response.Redirect("President.aspx");
                    else
                        Response.Redirect("Home.aspx");
                }*/
            }

        }

        public static bool VerifyPassword(string password, string savedPasswordHash)
        {
            //STEP 6 Verify the user-entered password against a stored password

            /* Extract the bytes */
            byte[] hashBytes = System.Convert.FromBase64String(savedPasswordHash);
            /* Get the salt */
            byte[] salt = new byte[16];
            System.Array.Copy(hashBytes, 0, salt, 0, 16);
            /* Compute the hash on the password the user entered */
            var pbkdf2 = new System.Security.Cryptography.Rfc2898DeriveBytes(password, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);
            /* Compare the results */
            for (int i = 0; i < 20; i++)
                if (hashBytes[i + 16] != hash[i])
                    return false;
            return true;
        }
    }
}