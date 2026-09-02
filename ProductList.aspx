<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true"
    CodeFile="ProductList.aspx.cs"
    Inherits="ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    .product-card { 
        transition: all 0.3s ease; 
        border-radius: 20px; 
        min-height: 520px;
    }
    .product-img { 
        height: 300px;
        width: 100%; 
        object-fit: cover; 
        border-radius: 15px;
    }
    .product-title { font-size: 1.35rem; color: #dc3545; font-weight: bold; }
    .product-price { font-size: 1.25rem; font-weight: 800; color: #333; }
</style>

<div class="container py-5">
    <h2 class="text-center text-success mb-5 fw-bold">Our Products</h2>

    <div class="row">
        <asp:Repeater ID="rptProducts" runat="server"
            OnItemCommand="rptProducts_ItemCommand">

            <ItemTemplate>
                <div class="col-md-4 mb-5">
                    <div class="card product-card shadow-lg border-0 p-4">

                        <!-- IMAGE SAME LOGIC -->
                        <img src='<%# Eval("image").ToString().StartsWith("~") 
                        ? ResolveUrl(Eval("image").ToString()) 
                        : ResolveUrl("~/img/" + Eval("image").ToString()) %>' 
                        class="product-img mb-3" />

                        <div class="card-body text-center p-0 d-flex flex-column">
                            <h5 class="product-title mb-2">
                                <%# Eval("product_name") %>
                            </h5>

                            <h6 class="product-price mb-4">
                                ₹ <%# Eval("price", "{0:N2}") %>
                            </h6>

                            <div class="mt-auto d-flex gap-2">

                                <!-- ADD TO CART -->
                                <asp:Button ID="btnAdd"
                                    runat="server"
                                    Text="Add To Cart"
                                    CssClass="btn btn-warning flex-fill fw-bold py-3"
                                    CommandName="addtocart"
                                    CommandArgument='<%# Eval("product_id") %>' />


                               <asp:Button ID="btnBuyNow"
    runat="server"
    Text="Buy Now"
    CssClass="btn btn-success flex-fill fw-bold py-3"
    CommandName="buynow"
    CommandArgument='<%# Eval("product_id") %>' />


                                
                            </div>
                        </div>

                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>
</div>

</asp:Content>
