<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Admin_AddProduct" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Manage Products</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body{
            background:#f4f6f9;
            font-family:'Segoe UI', Arial;
        }
        .container{
            width:95%;
            max-width:1200px;
            margin:40px auto;
            background:#fff;
            padding:25px;
            border-radius:14px;
            box-shadow:0 12px 30px rgba(0,0,0,.15);
        }
        h2{text-align:center;margin-bottom:25px;font-weight:700}
        label{font-weight:600;margin-top:15px;display:block}
        input,textarea,select{
            width:100%;
            padding:10px;
            border-radius:6px;
            border:1px solid #ccc;
            margin-top:5px;
        }
         .btn{
            margin-top:20px;width:100%;padding:12px;
            background:#007bff;color:#fff;border:none;border-radius:6px
        }
        table{width:100%;margin-top:25px;border-collapse:collapse} 
        th{
    background: linear-gradient(45deg, #00c6ff, #0072ff);
    color: #ffffff;
    padding: 14px;
    font-weight: 600;
    text-align: center;
    border: none;
}
        td{
            text-align:center;
            padding:12px;
            border-bottom:1px solid #eee;
        }

        .img-list{
            width:50px;
            height:50px;
            border-radius:8px;
            object-fit:cover;
        }

        .desc-text{
            max-width:280px;
            display:inline-block;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }

        /* 🔥 SAME BUTTON STYLE AS CATEGORY */
.action-btn,
.edit,
.delete{
    padding:6px 14px;
    border-radius:20px;
    border:none;
    font-weight:600;
    font-size:14px;
    cursor:pointer;
    display:inline-flex;
    align-items:center;
    gap:6px;
    text-decoration:none !important;

}

/* Edit */
.edit{
    background:#ffc107;
    color:#000;
}
.edit:hover{
    background:#e0a800;
     text-decoration:none;

}

/* Delete */
.delete{
    background:#dc3545;
    color:#fff;
}
.delete:hover{
    background:#c82333;
    text-decoration:none;

}
    </style>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this product?");
        }
    </script>
</head>

<body>
<form id="form1" runat="server">
<div class="container">

<h2>📦 Manage Products</h2>

<asp:HiddenField ID="hfProductId" runat="server" />
<asp:HiddenField ID="hfOldImage" runat="server" />

<label>Product Name</label>
<asp:TextBox ID="txtName" runat="server" />

<label>Description</label>
<asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" />

<label>Price</label>
<asp:TextBox ID="txtPrice" runat="server" />

<label>Category</label>
<asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"
    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" />

<label>SubCategory</label>
<asp:DropDownList ID="ddlSubCategory" runat="server" />

<label>Image</label>
<asp:FileUpload ID="fuImage" runat="server" />

<asp:Button ID="btnSave" runat="server"
    Text="Add Product"
    CssClass="btn"
    OnClick="btnSave_Click" />

<hr />

<asp:GridView ID="gvProduct" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="product_id"
    OnRowCommand="gvProduct_RowCommand">

<Columns>
    <asp:BoundField DataField="product_id" HeaderText="ID" />
    <asp:BoundField DataField="product_name" HeaderText="Product" />
    <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="₹{0}" />

    <asp:TemplateField HeaderText="Description">
        <ItemTemplate>
            <span class="desc-text" title='<%# Eval("description") %>'>
                <%# Eval("description") %>
            </span>
        </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Image">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' CssClass="img-list" />
        </ItemTemplate>
    </asp:TemplateField>

   <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:LinkButton ID="LinkButton1" runat="server"
            CommandName="editRow"
            CommandArgument="<%# Container.DataItemIndex %>"
            CssClass="action-btn edit">
            Edit
        </asp:LinkButton>

        <asp:LinkButton ID="LinkButton2" runat="server"
            CommandName="deleteRow"
            CommandArgument="<%# Container.DataItemIndex %>"
            CssClass="action-btn delete"
            OnClientClick="return confirmDelete();">
            Delete
        </asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

</Columns>
</asp:GridView>

</div>
</form>
</body>
</html>
