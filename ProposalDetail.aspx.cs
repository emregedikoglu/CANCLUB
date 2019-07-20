using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CANCLUB
{
    public partial class ProposalDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["currentuser"] != null)
                {
                    User loggeduser = (User)Session["currentuser"];
                    LabelWelcome.Text = loggeduser.Username;
                    LabelWelcome.Visible = true;

                    if (Request["detail"] != null)
                    {
                        int pId = Convert.ToInt32(Request["detail"]);

                        using (var myDB = new canclubEntities1())
                        {
                            var p = (from x in myDB.Proposal where (x.PropId == pId) select x).SingleOrDefault();
                            lblTitle.Text = p.AType;
                            lblProposal.Text = p.ADescription;
                            imgProposal.ImageUrl = "~/images/" + p.PropPhoto;

                            var c = (from x in myDB.Comment where (x.PropId == pId && x.IsActive == true) select x).ToList();
                            DataList1.DataSource = c;
                            DataList1.DataBind();

                            var v = (from x in myDB.Vote where (x.PropId == pId && x.UserId == loggeduser.UserId) select x).SingleOrDefault();

                            if (v != null)
                            {
                                btnConfirm.Visible = false;
                                btnDeny.Visible = false;
                                lblVote.Text = "You voted.";
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            using (var myDB = new canclubEntities1())
            {
                User loggeduser = (User)Session["currentuser"];
                int pId = Convert.ToInt32(Request["detail"]);

                var newvote = new Vote();
                newvote.PropId = pId;
                newvote.UserId = loggeduser.UserId;
                newvote.IsActive = true;

                var voteresult = (from x in myDB.VoteResult where (x.PropId == pId) select x).SingleOrDefault();

                if (voteresult != null)
                {
                    voteresult.Result += 1;
                    myDB.Vote.Add(newvote);
                    myDB.SaveChanges();
                }
                else
                {
                    var newvoteresult = new VoteResult();
                    newvoteresult.PropId = pId;
                    newvoteresult.Result = 1;
                    myDB.VoteResult.Add(newvoteresult);
                    myDB.Vote.Add(newvote);
                    myDB.SaveChanges();
                }           

                Response.Redirect("~/ProposalDetail.aspx?detail=" + pId);
            }
        }

        protected void btnDeny_Click(object sender, EventArgs e)
        {
            using (var myDB = new canclubEntities1())
            {
                User loggeduser = (User)Session["currentuser"];
                int pId = Convert.ToInt32(Request["detail"]);

                var newvote = new Vote();
                newvote.PropId = pId;
                newvote.UserId = loggeduser.UserId;
                newvote.IsActive = true;

                var voteresult = (from x in myDB.VoteResult where (x.PropId == pId) select x).SingleOrDefault();

                if (voteresult != null)
                {
                    voteresult.Result -= 1;
                    myDB.Vote.Add(newvote);
                    myDB.SaveChanges();
                }
                else
                {
                    var newvoteresult = new VoteResult();
                    newvoteresult.PropId = pId;
                    newvoteresult.Result = -1;
                    myDB.VoteResult.Add(newvoteresult);
                    myDB.Vote.Add(newvote);
                    myDB.SaveChanges();
                }

                Response.Redirect("~/ProposalDetail.aspx?detail=" + pId);
            }
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            using (var myDB = new canclubEntities1())
            {
                User loggeduser = (User)Session["currentuser"];
                int pId = Convert.ToInt32(Request["detail"]);

                var newcomment = new Comment();

                newcomment.PropId = pId;
                newcomment.UserId = loggeduser.UserId;
                newcomment.CommentText = txtComment.Text;
                newcomment.IsActive = true;

                myDB.Comment.Add(newcomment);
                myDB.SaveChanges();

                Response.Redirect("~/ProposalDetail.aspx?detail=" + pId);
            }
        }
    }
}