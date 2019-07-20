<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="President.aspx.cs" Inherits="CANCLUB.President" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="/President.aspx">Home</a></li>
                        <li><a runat="server" href="/UserInformation.aspx">Information</a></li>
                        <li><a runat="server" href="/NewProposal.aspx">Propose New Activity</a></li>
                        <li><a runat="server" href="/TopProposals.aspx">Top 5 Proposals</a></li>
                        <li><a runat="server" href="/ListAllUsers.aspx">List All Users</a></li>
                        <li><asp:Label style="color:white;font-size:30px;" ID="LabelWelcome" runat="server" Text="" Visible="false"></asp:Label></li>
                    </ul>
                </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
       <h3>All Activity Proposals</h3>
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProposalDetail.aspx?detail="+Eval("PropId") %>' Text='<%# Eval("AType") %>'></asp:HyperLink>
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ADescription") %>'></asp:Label>
                <br />
                <asp:Image ID="Image1" CssClass="img-bordered img-responsive" Width="300px" Height="200px" runat="server" ImageUrl='<%# "~/images/"+Eval("PropPhoto") %>' />                
                <br />
            </ItemTemplate>
        </asp:DataList>
       
    </div>
</asp:Content>