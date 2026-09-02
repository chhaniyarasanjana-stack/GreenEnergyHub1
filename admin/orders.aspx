<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Orders.aspx.cs"
    Inherits="admin_Orders"
    MasterPageFile="~/admin/AdminMasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    body{background:#f4f6f9;font-family:Segoe UI;}

    .admin-container{
        width:95%;
        margin:30px auto;
        background:#fff;
        padding:20px;
        border-radius:12px;
        box-shadow:0 10px 25px rgba(0,0,0,.1);
        overflow-x:auto;
    }

    .page-title{
        text-align:center;
        font-size:22px;
        font-weight:700;
        margin-bottom:20px;
    }

    .grid{
        width:100%;
        border-collapse:collapse;
        min-width:1000px; /* reduced for compact view */
        font-size:13px;
    }

    .grid th{
        background:linear-gradient(90deg,#00c6ff,#007bff);
        color:#fff;
        padding:10px;
        text-align:center;
    }

    .grid td{
        padding:8px;
        text-align:center;
        border-bottom:1px solid #eee;
    }

    .grid tr:nth-child(even){background:#f8fcff;}

    .delete-btn{
        background:#dc3545;
        color:#fff;
        border:none;
        padding:5px 12px;
        border-radius:6px;
        cursor:pointer;
        font-size:12px;
    }

    .delete-btn:hover{
        background:#b02a37;
    }
</style>

<div class="admin-container">

    <div class="page-title">📦 Manage Orders</div>

    <asp:GridView ID="gvOrders" runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        DataKeyNames="order_id"
        OnRowCommand="gvOrders_RowCommand">

        <Columns>
            <asp:BoundField DataField="order_id" HeaderText="Order ID" />
            <asp:BoundField DataField="user_id" HeaderText="User ID" />
            <asp:BoundField DataField="name" HeaderText="Customer Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="address" HeaderText="Address" />
            <asp:BoundField DataField="city" HeaderText="City" />
            <asp:BoundField DataField="zip" HeaderText="Zip Code" />
            <asp:BoundField DataField="payment_method" HeaderText="Payment" />
            <asp:BoundField DataField="total_amount" HeaderText="Total Amount" DataFormatString="{0:C}" />
            <asp:BoundField DataField="order_status" HeaderText="Status" />
            <asp:BoundField DataField="order_date" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server"
                        Text="Delete"
                        CssClass="delete-btn"
                        CommandName="deleteRow"
                        CommandArgument="<%# Container.DataItemIndex %>"
                        OnClientClick="return confirm('Delete this order?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</div>

</asp:Content>
