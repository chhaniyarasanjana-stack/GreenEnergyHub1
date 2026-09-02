<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #eefaf3 }
        .auth-container { padding:120px 0; }
        .auth-card {
            background:#ffffff;
            padding:30px;
            border-radius:8px;
            box-shadow:0 4px 12px rgba(0,0,0,0.1);
        }
        .auth-card h3 {
            text-align:center;
            margin-bottom:25px;
            font-weight:bold;
        }
        .auth-card a {
            display:block;
            text-align:center;
            margin-top:10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container auth-container">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="auth-card">
                <h3>Login Here</h3>

                <!-- Username -->
                <asp:TextBox ID="txtUser" runat="server"
                    CssClass="form-control mb-2"></asp:TextBox>
                <asp:Label ID="lblUserPlaceholder" runat="server" Text="Username" CssClass="text-muted"></asp:Label>

                <!-- Password -->
                <asp:TextBox ID="txtPass" runat="server"
                    CssClass="form-control mb-3"
                    TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPassPlaceholder" runat="server" Text="Password" CssClass="text-muted"></asp:Label>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server"
                    Text="Login"
                    CssClass="btn btn-primary w-100"
                    OnClick="btnLogin_Click" />

                <asp:Label ID="lblError" runat="server" CssClass="d-block mt-2"></asp:Label>

                <a href="reset_password.aspx">Forgot Password?</a>
                <a href="register.aspx">New Register?</a>
            </div>

        </div>
    </div>
</div>
</asp:Content>
