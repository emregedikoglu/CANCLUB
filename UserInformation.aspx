<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="CANCLUB.UserInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="/Home.aspx">Home</a></li>
                        <li><a runat="server" href="/UserInformation.aspx">Information</a></li>
                        <li><a runat="server" href="/NewProposal.aspx">Propose New Activity</a></li>
                        <li><a runat="server" href="/TopProposals.aspx">Top 5 Proposals</a></li>
                        <li><asp:Label style="color:white;font-size:30px;" ID="LabelWelcome" runat="server" Text="" Visible="false"></asp:Label></li>
                    </ul>
                </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="updateinfo">
            <h1>Update Information</h1>
            <asp:Image ID="imgUser" CssClass="img-bordered img-responsive" Width="200px" Height="200px" runat="server" /><br />
            <asp:Label ID="lblPicture" ForeColor="Red" runat="server" Text="Change your profile picture"></asp:Label>
            <asp:FileUpload ID="fuUser" runat="server" />
            <asp:Button ID="btnChangePicture" runat="server" Text="Change Picture" OnClick="ButtonChangePicture_Click" /><br />
            <asp:TextBox ID="usernameTxt" runat="server" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTxt" ErrorMessage="Please enter username" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="firstnameTxt" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="firstnameTxt" ErrorMessage="Please enter first name" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="lastnameTxt" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastnameTxt" ErrorMessage="Please enter last name" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passwordTxt" ErrorMessage="Please enter password" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="birthdateTxt" runat="server" TextMode="Date" placeholder="Birth Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="birthdateTxt" ErrorMessage="Please enter birth date" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="departmentTxt" runat="server" placeholder="Department"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="departmentTxt" ErrorMessage="Please enter department" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator><br />
            
            <asp:Button ID="updateBtn" runat="server" ValidationGroup="Update" OnClick="ButtonUpdate_Click" Text="Update"/><br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
