<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Admin_category" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Manage Categories</title>

  
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body{ background:#f4f6f9; font-family:Segoe UI, Arial; }
        .container{
            width:95%; max-width:1200px; margin:40px auto;
            background:#fff; padding:25px; border-radius:14px;
            box-shadow:0 12px 30px rgba(0,0,0,.15);
        }
        h2{text-align:center;margin-bottom:25px}
        label{font-weight:600;margin-top:15px;display:block}
        input[type=text],input[type=file]{
            width:100%;padding:10px;border-radius:6px;border:1px solid #ccc
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
        td{text-align:center;padding:12px}
        img{width:55px;height:55px;border-radius:8px}
        
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
}

/* Edit */
.edit{
    background:#ffc107;
    color:#000;
}
.edit:hover{
    background:#e0a800;
}

/* Delete */
.delete{
    background:#dc3545;
    color:#fff;
}
.delete:hover{
    background:#c82333;
}

    </style>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this category?");
        }
    </script>
</head>

<body>
<form id="Form1" runat="server">
<div class="container">

<h2>📁 Manage Categories</h2>

<asp:HiddenField ID="hfCategoryId" runat="server" />

<label>Category Name</label>
<asp:TextBox ID="txtCategory" runat="server" />

<label>Category Image</label>
<asp:FileUpload ID="fuImage" runat="server" />

<asp:Button ID="btnSave" runat="server"
    Text="Add Category"
    CssClass="btn"
    OnClick="btnSave_Click" />

<hr />

<asp:GridView ID="gvCategory" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="category_id"
    OnRowCommand="gvCategory_RowCommand">

    <Columns>
        <asp:BoundField DataField="category_id" HeaderText="ID" />
        <asp:BoundField DataField="category_name" HeaderText="Category Name" />
        <asp:ImageField DataImageUrlField="image" HeaderText="Image" />
        <asp:BoundField DataField="created_at" HeaderText="Created At" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="Button1" Text="Edit" runat="server"
                    CommandName="editRow"
                    CommandArgument="<%# Container.DataItemIndex %>"
                    CssClass="edit" />

                <asp:Button ID="Button2" Text="Delete" runat="server"
                    CommandName="deleteRow"
                    CommandArgument="<%# Container.DataItemIndex %>"
                    CssClass="delete"
                    OnClientClick="return confirmDelete();" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

</asp:GridView>

</div>
</form>
</body>
</html>
