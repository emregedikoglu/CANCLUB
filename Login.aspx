<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CANCLUB.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Login to the CANCLUB</h1>
    <p><asp:TextBox ID="TextBoxEmail" placeholder="email" runat="server" TextMode="Email"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ValidationGroup="Login" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="Login" ErrorMessage="Please enter email" ControlToValidate="TextBoxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
    </p>   
    <p><asp:TextBox ID="TextBoxPass"  TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Please enter password" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
    </p>
    <p> <asp:Button ID="ButtonSubmit" runat="server" Text="Login" ValidationGroup="Login" OnClick="ButtonSubmit_Click" /></p>
    <p> You don't have an account yet? <a runat="server" href="/Register.aspx">Register</a></p>
    <p><asp:Label ID="LabelResult" runat="server" Text="" Visible="false"></asp:Label></p>
</asp:Content>
