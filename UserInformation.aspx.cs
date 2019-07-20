using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class UserInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User loggeduser = (User)Session["currentuser"];

                if (loggeduser == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LabelWelcome.Text = loggeduser.Username;
                    LabelWelcome.Visible = true;

                    using (var myDB = new canclubEntities1())
                    {
                        var user = (from u in myDB.User
                                    where (loggeduser.UserId == u.UserId)
                                    select u).SingleOrDefault();

                        imgUser.ImageUrl = "~/images/" + user.UserPhoto;
                        usernameTxt.Text = user.Username;
                        firstnameTxt.Text = user.FirstName;
                        lastnameTxt.Text = user.LastName;
                        passwordTxt.Text = user.Password;
                        string bDate = Convert.ToString(user.BirthDate);
                        birthdateTxt.Text = bDate;
                        departmentTxt.Text = user.Department;
                    }

                }
            }
        }

        protected void ButtonChangePicture_Click(object sender, EventArgs e)
        {
            User loggeduser = (User)Session["currentuser"];

            using (var myDb = new canclubEntities1())
            {
                var user = (from u in myDb.User
                            where (loggeduser.UserId == u.UserId)
                            select u).SingleOrDefault();

                if (fuUser.HasFile)
                {
                    fuUser.SaveAs(Server.MapPath("~/images/" + fuUser.FileName));
                    user.UserPhoto = fuUser.FileName;
                }
                else
                {
                    user.UserPhoto = "profil_resmi_yok.jpg";
                }

                myDb.SaveChanges();
                Label1.Text = "Picture Update Successful";
                //Response.Redirect("UserInformation.aspx");
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            User loggeduser = (User)Session["currentuser"];

            using (var myDb = new canclubEntities1())
            {
                var user = (from u in myDb.User
                            where (loggeduser.UserId == u.UserId)
                            select u).SingleOrDefault();

                user.Username = usernameTxt.Text;
                user.FirstName = firstnameTxt.Text;
                user.LastName = lastnameTxt.Text;
                user.Password = HashPassword(passwordTxt.Text);
                user.BirthDate = Convert.ToDateTime(birthdateTxt.Text);
                user.Department = departmentTxt.Text;

                myDb.SaveChanges();
                Label1.Text = "Update Successful";
                //Response.Redirect("UserInformation.aspx");
            }
        }

        public static string HashPassword(string password) //Takes a string and creates hash of the string
        {
            //STEP 1 Create the salt value with a cryptographic PRNG:

            byte[] salt;
            new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);

            //STEP 2 Create the Rfc2898DeriveBytes and get the hash value:

            var pbkdf2 = new System.Security.Cryptography.Rfc2898DeriveBytes(password, salt, 10000);
            //Note: Depending on the performance requirements of your specific application, the value '10000' can be reduced. 
            //      A minimum value should be around 1000.
            byte[] hash = pbkdf2.GetBytes(20);

            //STEP 3 Combine the salt and password bytes for later use:

            byte[] hashBytes = new byte[36];
            System.Array.Copy(salt, 0, hashBytes, 0, 16);
            System.Array.Copy(hash, 0, hashBytes, 16, 20);

            //STEP 4 Turn the combined salt+hash into a string for storage

            string savedPasswordHash = System.Convert.ToBase64String(hashBytes);

            //STEP 5 Return hashed password (It will be 48 characters long)
            return savedPasswordHash;

        }
    }
}