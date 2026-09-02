<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Contacts.aspx.cs"
    Inherits="admin_Contacts"
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
    }
    .page-title{
        text-align:center;
        font-size:26px;
        font-weight:700;
        margin-bottom:25px;
    }
    .grid{width:100%;border-collapse:collapse;}
    .grid th{
        background:linear-gradient(90deg,#00c6ff,#007bff);
        color:#fff;
        padding:14px;
        text-align:center;
    }
    .grid td{
        padding:14px;
        text-align:center;
        border-bottom:1px solid #eee;
    }
    .grid tr:nth-child(even){background:#f8fcff;}
    .delete-btn{
        background:#dc3545;color:#fff;border:none;
        padding:8px 16px;border-radius:8px;
    }

    .overlay{
        position:fixed;top:0;left:0;
        width:100%;height:100%;
        background:rgba(0,0,0,.45);
        display:none;
        align-items:center;
        justify-content:center;
        z-index:9999;
    }
    .popup-card{
        background:#fff;width:420px;
        padding:35px;border-radius:18px;
        text-align:center;
    }
</style>

<script>
    function showPopup(title, msg) {
        document.getElementById("popTitle").innerText = title;
        document.getElementById("popMsg").innerText = msg;
        document.getElementById("popup").style.display = "flex";
    }
    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }
</script>

<div class="admin-container">
    <div class="page-title">📩 Manage Contact Messages</div>

    <asp:GridView ID="gvContacts" runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        DataKeyNames="contact_id"
        OnRowCommand="gvContacts_RowCommand">

        <Columns>
            <asp:BoundField DataField="contact_id" HeaderText="ID" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="message" HeaderText="Message" />
            <asp:BoundField DataField="created_at" HeaderText="Date"
                DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Delete"
                        CssClass="delete-btn"
                        CommandName="deleteRow"
                        CommandArgument="<%# Container.DataItemIndex %>"
                        OnClientClick="return confirm('Delete this message?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
</div>

<div class="overlay" id="popup">
    <div class="popup-card">
        <h3 id="popTitle"></h3>
        <p id="popMsg"></p>
        <button onclick="closePopup()">OK</button>
    </div>
</div>

</asp:Content>
