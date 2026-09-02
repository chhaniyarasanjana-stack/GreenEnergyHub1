<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Cart.aspx.cs"
    Inherits="Cart" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; }
        .cart-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #198754;
            font-weight: bold;
            margin-bottom: 25px;
        }
        .gridview th {
            background-color: #198754;
            color: #fff;
            text-align: center;
            padding: 12px;
        }
        .gridview td {
            text-align: center;
            padding: 12px;
            vertical-align: middle;
        }
        .btn-action {
            border: none;
            padding: 6px 12px;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 3px;
        }
        .btn-plus { background-color: #28a745; color: #fff; }
        .btn-minus { background-color: #dc3545; color: #fff; }
        .btn-remove { background-color: #6c757d; color: #fff; }
        .total-label {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
            display: block;
            text-align: right;
        }
        .btn-checkout {
            margin-top: 20px;
            font-size: 1.1rem;
            font-weight: bold;
            padding: 12px;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <div class="cart-container">
            <h2>🛒 My Shopping Cart</h2>

            <!-- Success Message -->
            <asp:Label ID="lblMessage" runat="server"
    CssClass="alert alert-success d-block mb-3"
    Visible="false"></asp:Label>

            <asp:GridView ID="gvCart"
                runat="server"
                AutoGenerateColumns="false"
                CssClass="table table-bordered gridview"
                OnRowCommand="gvCart_RowCommand">

                <Columns>
                    <asp:BoundField DataField="product_name" HeaderText="Product" />
                    <asp:BoundField DataField="price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="quantity" HeaderText="Qty" />
                    <asp:BoundField DataField="total" HeaderText="Subtotal (₹)" DataFormatString="{0:N2}" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnIncrease" runat="server" Text="+"
                                CssClass="btn-action btn-plus"
                                CommandName="Increase"
                                CommandArgument='<%# Container.DataItemIndex %>' />

                            <asp:Button ID="btnDecrease" runat="server" Text="-"
                                CssClass="btn-action btn-minus"
                                CommandName="Decrease"
                                CommandArgument='<%# Container.DataItemIndex %>' />

                            <asp:Button ID="btnRemove" runat="server" Text="Remove"
                                CssClass="btn-action btn-remove"
                                CommandName="Remove"
                                CommandArgument='<%# Container.DataItemIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblTotal" runat="server" CssClass="total-label"></asp:Label>

            <asp:Button ID="btnCheckout"
                runat="server"
                Text="Proceed to Checkout"
                CssClass="btn btn-primary w-100 btn-checkout"
                OnClick="btnCheckout_Click" />
        </div>
    </form>
</body>
</html>
