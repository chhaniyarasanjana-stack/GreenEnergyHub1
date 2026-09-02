<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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
        .text-danger { font-size:14px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container auth-container">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="auth-card">
                <h3>Register Here</h3>

                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control mb-2" Placeholder="First Name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="Enter First Name" CssClass="text-danger" Display="Dynamic" />

                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control mb-2" Placeholder="Last Name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="Enter Last Name" CssClass="text-danger" Display="Dynamic" />

                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control mb-2" Placeholder="Username" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="Enter Username" CssClass="text-danger" Display="Dynamic" />

                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control mb-2" Placeholder="Email" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"
                    ErrorMessage="Enter Email" CssClass="text-danger" Display="Dynamic" />

                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control mb-2"
                    TextMode="Password" Placeholder="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6"
                    ErrorMessage="Enter Password" CssClass="text-danger" Display="Dynamic" />

                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control mb-2"
                    TextMode="Password" Placeholder="Confirm Password" />
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToValidate="TextBox7"
                    ControlToCompare="TextBox6"
                    ErrorMessage="Password does not match"
                    CssClass="text-danger"
                    Display="Dynamic" />

                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control mb-3"
                    Placeholder="Phone Number" />

                <asp:Button ID="Button1" runat="server"
                    Text="Register"
                    CssClass="btn btn-primary w-100"
                    OnClick="Button1_Click" />

                <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>

                <a href="login.aspx">Already have an account? Login</a>
            </div>

        </div>
    </div>
</div>
</asp:Content>
