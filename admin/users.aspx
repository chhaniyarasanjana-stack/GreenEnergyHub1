<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Users.aspx.cs"
    Inherits="admin_Users"
    MasterPageFile="~/admin/AdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    body{background:#f4f6f9;font-family:Segoe UI;}

    .admin-container{
        width:95%;
        margin:30px auto;
        background:#fff;
        padding:25px;
        border-radius:16px;
        box-shadow:0 15px 35px rgba(0,0,0,.15);
        overflow-x:auto;
    }

    .page-title{
        text-align:center;
        font-size:26px;
        font-weight:700;
        margin-bottom:25px;
    }

    .grid{
        width:100%;
        border-collapse:collapse;
        min-width:1100px;
    }

    .grid th{
        background:linear-gradient(90deg,#00c6ff,#007bff);
        color:#fff;
        padding:12px;
        text-align:center;
    }

    .grid td{
        padding:12px;
        text-align:center;
        border-bottom:1px solid #eee;
        font-size:14px;
    }

    .grid tr:nth-child(even){background:#f8fcff;}

    .delete-btn{
        background:#dc3545;
        color:#fff;
        border:none;
        padding:6px 14px;
        border-radius:8px;
        cursor:pointer;
    }

    .delete-btn:hover{
        background:#b02a37;
    }
</style>

<div class="admin-container">

    <div class="page-title">👤 Manage Users</div>

    <asp:GridView ID="gvUsers" runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        DataKeyNames="user_id"
        OnRowCommand="gvUsers_RowCommand">

        <Columns>

            <asp:BoundField DataField="user_id" HeaderText="ID" />
            <asp:BoundField DataField="first_name" HeaderText="First Name" />
            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
            <asp:BoundField DataField="username" HeaderText="Username" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="password" HeaderText="Password" />
            <asp:BoundField DataField="confirm_password" HeaderText="Confirm Password" />
            <asp:BoundField DataField="mobile" HeaderText="Mobile" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server"
                        Text="Delete"
                        CssClass="delete-btn"
                        CommandName="deleteRow"
                        CommandArgument="<%# Container.DataItemIndex %>"
                        OnClientClick="return confirm('Delete this user?');" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</div>

</asp:Content>