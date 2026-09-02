<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Checkout</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
    background-color: #ffffff;   /* Pure white */
    font-family: 'Segoe UI', sans-serif;
}

.checkout-container {
    max-width: 650px;
    margin: 40px auto;
    background: #ffffff;
    padding: 17px 22px;
    border-radius: 10px;
    border: 1px solid #e5e5e5;   /* Soft border instead of heavy shadow */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);  /* Very light shadow */
}
        .page-title {
            text-align: center;
            font-weight: 600;
            color: #198754;
            margin-bottom: 15px;
        }

        .order-summary {
            background: #f1fbf5;
            padding: 15px 18px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .order-summary h5 {
            font-weight: 500;
            color: #198754;
            margin-bottom: 12px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 2px 0;
            font-size: 12px;
            border-bottom: 1px solid #e9ecef;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .grand-total {
            margin-top: 10px;
            padding-top: 8px;
            border-top: 2px solid #198754;
            font-weight: 600;
            font-size: 16px;
            color: #198754;
            text-align: right;
        }

        .form-label {
            font-weight: 500;
            font-size: 14px;
        }

        .form-control,
        .form-select {
            font-size: 14px;
            padding: 8px 10px;
        }

        .btn-placeorder {
            margin-top: 15px;
            padding: 8px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 6px;
        }

        .message {
            text-align: center;
            margin-top: 12px;
            font-weight: 600;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="checkout-container">

            <h3 class="page-title">Checkout</h3>

            <!-- Order Summary -->
            <div class="order-summary">
                <h5>Order Summary</h5>

                <asp:Repeater ID="rptSummary" runat="server">
                    <ItemTemplate>
                        <div class="cart-item">
                            <span><%# Eval("product_name") %> (x<%# Eval("quantity") %>)</span>
                            <span>₹ <%# Eval("total", "{0:N2}") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="grand-total">
                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total: ₹ 0.00"></asp:Label>
                </div>
            </div>

            <!-- Billing Information -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">City</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">ZIP Code</label>
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Payment -->
            <div class="mb-3">
                <label class="form-label">Payment Method</label>
                <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Cash on Delivery (COD)" Value="COD" />
                    <asp:ListItem Text="UPI Payment" Value="UPI" />
                </asp:DropDownList>
            </div>

            <!-- Button -->
            <div class="d-grid">
                <asp:Button ID="btnPlaceOrder" runat="server"
                    Text="Place Order"
                    CssClass="btn btn-success btn-placeorder"
                    OnClick="btnPlaceOrder_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        </div>
    </form>
</body>
</html>