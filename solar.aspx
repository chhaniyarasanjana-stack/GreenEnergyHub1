<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="solar.aspx.vb" Inherits="solar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Solar Panel Solutions</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container mt-4">
        <h2 class="mb-3">Solar Panels</h2>
        <div class="text-center mb-3">
        <img src="img/img-600x400-1.jpg" class="img-fluid rounded mb-3" alt="Solar Panels">
        </div>

        <p>
            Solar energy is the most widely used renewable energy source.
            Our marketplace offers high-efficiency solar panels, rooftop installations,
            solar inverters, and accessories suitable for homes, offices, and industries.
        </p>

        <div class="text-center mt-3">
            <a href="service.aspx" class="btn btn-primary">Back to Services</a>
        </div>
    </div>

</asp:Content>
