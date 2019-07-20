using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class TopProposals : System.Web.UI.Page
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
                LabelWelcome.Text = loggeduser.Username;
                LabelWelcome.Visible = true;

                using (var myDB = new canclubEntities1())
                {
                    var props = (from p in myDB.Proposal
                                 select p).ToList();

                    TimeSpan ts = new TimeSpan(15, 0, 0, 0);
                    DateTime date = DateTime.Now;

                    foreach (Proposal pr in props)
                    {
                        TimeSpan value = date.Subtract(pr.TimeStamp);
                        if (value >= ts)
                        {
                            pr.IsActive = false;
                            myDB.SaveChanges();
                        }
                    }

                    var votes = (from v in myDB.VoteResult
                                 orderby v.Result descending
                                 select v).Take(5).ToList();

                    List<Proposal> proplist = new List<Proposal>();

                    foreach (VoteResult v in votes)
                    {
                        var prop = (from p in myDB.Proposal
                                    where (p.PropId == v.PropId && p.IsActive == true)
                                    select p).SingleOrDefault();
                        if (prop != null)
                            proplist.Add(prop);
                    }

                    DataList1.DataSource = proplist;
                    DataList1.DataBind();
                }
            }
        }
    }
}