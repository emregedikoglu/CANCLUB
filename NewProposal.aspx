<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewProposal.aspx.cs" Inherits="CANCLUB.NewProposal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="/President.aspx">Home</a></li>
                        <li><a runat="server" href="/UserInformation.aspx">Information</a></li>
                        <li><a runat="server" href="/NewProposal.aspx">Propose New Activity</a></li>
                        <li><a runat="server" href="/TopProposals.aspx">Top 5 Proposals</a></li>
                        <li><asp:Label style="color:white;font-size:30px;" ID="LabelWelcome" runat="server" Text="" Visible="false"></asp:Label></li>
                    </ul>
                </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register">
            <h1>Add New Activity Proposal</h1>
            <asp:Label ID="Label1" runat="server" Width="100" Text="Picture"></asp:Label>
            <asp:FileUpload ID="fuPicture" runat="server" /><br />
            <asp:Label ID="Label2" runat="server" Text="Type of activity:"></asp:Label><br />
            <asp:TextBox ID="propTypeTxt" runat="server" Width="196px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="propTypeTxt" ErrorMessage="Please enter proposal type" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator><br />
            <asp:Label ID="Label3" runat="server" Text="Description of activity:"></asp:Label><br />
            <asp:TextBox ID="propDescTxt" runat="server" Height="63px" Width="196px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="propDescTxt" ErrorMessage="Please enter proposal description" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator><br />    

            <asp:Button ID="addBtn" runat="server" ValidationGroup="Add" OnClick="ButtonAdd_Click" Text="Add Activity Proposal"/><br />
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
