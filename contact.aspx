<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <title>Green Energy Marketplace</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3">Contact</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a class="text-white" href="home.aspx">Home</a></li>
                <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                <li class="breadcrumb-item text-white active">Contact</li>
            </ol>
        </div>
    </div>

    <!-- Contact Form -->
    <div class="container-fluid bg-light py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">

                    <h6 class="text-primary">Contact Us</h6>
                    <h1 class="mb-4">Feel Free To Contact Us</h1>
                    <p class="mb-4">For renewable energy queries, send us a message.</p>

                    <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>

                    <div class="row g-3">

                        <div class="col-md-6">
                            <asp:TextBox ID="txtName" runat="server"
                                CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtName"
                                ErrorMessage="Name required"
                                ForeColor="Red" />
                        </div>

                        <div class="col-md-6">
                            <asp:TextBox ID="txtEmail" runat="server"
                                CssClass="form-control" Placeholder="Your Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Email required"
                                ForeColor="Red" />
                        </div>

                        <div class="col-12">
                            <asp:TextBox ID="txtSubject" runat="server"
                                CssClass="form-control" Placeholder="Subject"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <asp:TextBox ID="txtMessage" runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine" Rows="4"
                                Placeholder="Message"></asp:TextBox>                                 
                        </div>

                        <div class="col-12">
                            <asp:Button ID="btnSend" runat="server"
                                Text="Send Message"
                                CssClass="btn btn-primary rounded-pill py-3 px-5"
                              OnClick="btnSend_Click"  />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
