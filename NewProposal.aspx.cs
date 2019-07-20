using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class NewProposal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User loggeduser = (User)Session["currentuser"];

            if (loggeduser == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                using (var myDB = new canclubEntities1())
                {
                    LabelWelcome.Text = loggeduser.Username;
                    LabelWelcome.Visible = true;
                }
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            User loggeduser = (User)Session["currentuser"];

            using (var myDB = new canclubEntities1())
            {
                var newprop = new Proposal();

                if (fuPicture.HasFile)
                {
                    fuPicture.SaveAs(Server.MapPath("~/images/" + fuPicture.FileName));
                    newprop.PropPhoto = fuPicture.FileName;
                }
                else
                {
                    newprop.PropPhoto = "resim_yok.jpg";
                }

                newprop.AType = propTypeTxt.Text;
                newprop.ADescription = propDescTxt.Text;
                newprop.OwnerId = loggeduser.UserId;
                newprop.IsActive = true;
                DateTime currenTime = DateTime.Now;
                newprop.TimeStamp = currenTime;

                myDB.Proposal.Add(newprop);
                myDB.SaveChanges();

                Label4.Text = "Proposal Added Successfully";
                //Response.Redirect("NewProposal.aspx");
            }
        }

    }
}