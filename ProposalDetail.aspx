<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProposalDetail.aspx.cs" Inherits="CANCLUB.ProposalDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li><a runat="server" href="/Home.aspx">Home</a></li>
            <li><a runat="server" href="/UserInformation.aspx">Information</a></li>
            <li><a runat="server" href="/NewProposal.aspx">Propose New Activity</a></li>
            <li><a runat="server" href="/TopProposals.aspx">Top 5 Proposals</a></li>
            <li>
                <asp:Label Style="color: white; font-size: 30px;" ID="LabelWelcome" runat="server" Text="" Visible="false"></asp:Label></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Activity Proposal:</h2><br />
        <h3>Title:</h3>
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label><br />
        <h3>Description:</h3>
        <asp:Label ID="lblProposal" runat="server" Text=""></asp:Label><br />
        <asp:Image ID="imgProposal" CssClass="img-bordered img-responsive" Width="300px" Height="200px" runat="server" />   
        <br />
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
        <asp:Button ID="btnDeny" runat="server" Text="Deny" OnClick="btnDeny_Click"/><br />
        <asp:Label ID="lblVote" runat="server" Text=""></asp:Label><br />
        <h3>Comments:</h3>
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <h4>User:</h4>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("User.Username") %>'></asp:Label>
                <br />
                <h4>Comment:</h4>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("CommentText") %>'></asp:Label>
                <br />                
            </ItemTemplate>
        </asp:DataList>
        <h3>Add comment:</h3>
        <asp:TextBox ID="txtComment" runat="server" Height="52px" Width="236px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtComment" ErrorMessage="Please enter comment" ForeColor="Red" ValidationGroup="Comment"></asp:RequiredFieldValidator><br />
        <asp:Button ID="btnComment" runat="server" ValidationGroup="Comment" Text="Share" OnClick="btnComment_Click" />
    </div>
</asp:Content>