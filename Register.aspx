<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CANCLUB.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register">
        <h1>Register</h1>
        <asp:Label ID="Label1" runat="server" Width="100" Text="Picture"></asp:Label>
        <asp:FileUpload ID="fuPicture" runat="server" /><br />
        <asp:TextBox ID="usernameTxt" runat="server" placeholder="Username"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTxt" ErrorMessage="Please enter username" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="firstnameTxt" runat="server" placeholder="First Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="firstnameTxt" ErrorMessage="Please enter first name" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="lastnameTxt" runat="server" placeholder="Last Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lastnameTxt" ErrorMessage="Please enter last name" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="emailTxt" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ValidationGroup="Register" ControlToValidate="emailTxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTxt" ErrorMessage="Please enter email" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTxt" ErrorMessage="Please enter password" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="birthdateTxt" runat="server" TextMode="Date" placeholder="Birth Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="birthdateTxt" ErrorMessage="Please enter birth date" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="departmentTxt" runat="server" placeholder="Department"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="departmentTxt" ErrorMessage="Please enter department" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator><br />

        <asp:Button ID="registerBtn" runat="server" ValidationGroup="Register" OnClick="ButtonRegister_Click" Text="Register" /><br />
        Do you have an account? <a runat="server" href="/Login.aspx">Login</a>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label> 
    </div>
</asp:Content>
