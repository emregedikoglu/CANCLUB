<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllUsers.aspx.cs" Inherits="CANCLUB.ListAllUsers" %>

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
            <h3>List All Users</h3>
            <asp:GridView ID="ListAllUsersGridView"
                AutoGenerateColumns="False"
                runat="server"
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="444px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxUserId" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" Text='<%#Eval("UserId")%>' runat="server"></asp:Label>
                        </ItemTemplate>
                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" Text='<%#Eval("Username")%>' runat="server"></asp:Label>
                        </ItemTemplate>
                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" Text='<%#Eval("FirstName")%>' runat="server"></asp:Label>
                        </ItemTemplate>
                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" Text='<%#Eval("LastName")%>' runat="server"></asp:Label>
                        </ItemTemplate>
                            
                    </asp:TemplateField>
               
                    
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        <asp:Label ID="Label5" runat="server" Text="Enter user id to delete:"></asp:Label>
        <asp:TextBox ID="TextBoxDelete" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonDelete" runat="server" ValidationGroup="Delete" OnClick="ButtonDelete_Click" Text="Delete" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxDelete" ErrorMessage="Please enter user id" ForeColor="Red" ValidationGroup="Delete"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
