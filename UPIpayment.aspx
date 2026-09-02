<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="UPIPayment.aspx.cs"
    Inherits="UPIPayment" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>UPI Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background:#f4f6f9;">

<form id="form1" runat="server">

<div class="container mt-5">
<div class="card p-4 shadow">

<h3 class="text-primary">💳 UPI Payment</h3>
<hr />

<p><b>Order ID:</b>
    <asp:Label ID="lblOrderId" runat="server"></asp:Label>
</p>

<p><b>Total Amount:</b>
    ₹ <asp:Label ID="lblAmount" runat="server"></asp:Label>
</p>

<div class="mb-3">
    <label>Enter UPI ID</label>
    <asp:TextBox ID="txtUPI"
        runat="server"
        CssClass="form-control"
        placeholder="example@upi"></asp:TextBox>
</div>

<asp:Button ID="btnPayNow"
    runat="server"
    Text="Pay Now"
    CssClass="btn btn-success"
    OnClick="btnPayNow_Click" />

<!-- IMPORTANT LABEL -->
<asp:Label ID="lblMsg"
    runat="server"
    CssClass="text-danger d-block mt-3">
</asp:Label>

</div>
</div>

</form>
</body>
</html>