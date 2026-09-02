<%@ Page Title="Sub Categories" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<style>
    .category-card { 
        transition: all 0.3s ease; 
        border-radius: 15px; 
        min-height: 480px; /* Card ni total height vadhari */
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .category-img { 
        height: 280px; /* Image ni height vadhari */
        width: 100%; 
        object-fit: cover; 
        border-radius: 10px;
    }
    .category-title {
        font-size: 1.4rem; /* Text motu karyu */
        font-weight: bold;
    }
</style>

<div class="container py-5">
    <h2 class="text-center text-success mb-5 fw-bold">Sub Categories</h2>
    <div class="row">
        <asp:Repeater ID="rptSub" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-5"> <div class="card category-card shadow-lg border-0 text-center p-4">
                        <img src='<%# ResolveUrl(Eval("image").ToString()) %>' 
                             class="category-img mb-3 shadow-sm" />

                        <div class="card-body p-0">
                            <h4 class="text-danger category-title"><%# Eval("subcategory_name") %></h4>
                            <a href='ProductList.aspx?subcatid=<%# Eval("subcategory_id") %>' 
                               class="btn btn-success btn-lg mt-4 w-100 py-3 fw-bold">
                                View Products
                            </a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</asp:Content>