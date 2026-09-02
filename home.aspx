<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Carousel Start -->
    <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative" data-dot="<img src='img/carousel-1.jpg'>">
                <img class="img-fluid" src="img/carousel-1.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-2 text-white animated slideInDown">Welcome to Green Anergy MarketPlace</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">Buy vendors promote sustainability with easy purchase.</p>
                                <a href="ProductList.aspx" class="btn btn-primary rounded-pill py-3 px-5 animated slideInLeft">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative" data-dot="<img src='img/carousel-2.jpg'>">
                <img class="img-fluid" src="img/carousel-2.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-2 text-white animated slideInDown">Welcome to Green Anergy MarketPlace</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">Buy vendors promote sustainability with easy purchase.</p>
                                <a href="" class="btn btn-primary rounded-pill py-3 px-5 animated slideInLeft">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative" data-dot="<img src='img/carousel-3.jpg'>">
                <img class="img-fluid" src="img/carousel-3.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-2 text-white animated slideInDown">Welcome to Green Anergy MarketPlace</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">Buy vendors promote sustainability with easy purchase.</p>
                                <a href="" class="btn btn-primary rounded-pill py-3 px-5 animated slideInLeft">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- About Start -->
    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container about px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0 wow fadeIn" data-wow-delay="0.1s" style="min-height: 80px;">
                    <div class="position-relative h-80">
                        <img class="position-absolute img-fluid w-100 h-400" src="img/about.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 about-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <h6 class="text-primary">About Us</h6>
                        <h1 class="mb-4">Green Energy Marketplace for Renewable Products</h1>
                        <p>Our marketplace offers a wide variety of renewable energy products such as
                        solar panels, wind turbines, hydro power units and more.We aim to provide a
                        simple and reliable platform where customers can explore products, compare
                        features, and choose what is best for their needs.</p>

                        <p><i class="fa fa-check-circle text-primary me-3"></i>Wide range of renewable energy products </p>
                        <p><i class="fa fa-check-circle text-primary me-3"></i>Easy to browse and compare  </p>
                        <p><i class="fa fa-check-circle text-primary me-3"></i>Trusted and reliable marketplace</p>
                        <a href="service.aspx" class="btn btn-primary rounded-pill py-3 px-5 mt-3">Explore Products</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- ===================== FEATURES START ===================== -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5">

            <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-light p-4 text-center h-100">
                    <i class="fa fa-solar-panel fa-3x text-primary mb-3"></i>
                    <h5>Renewable Products</h5>
                    <p>
                        Browse renewable energy products like
                        solar panels, wind-powered pumbs, hydro turbines.
                    </p>
                </div>
            </div>

            <div class="col-md-4 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-light p-4 text-center h-100">
                    <i class="fa fa-database fa-3x text-primary mb-3"></i>
                    <h5>Database Driven</h5>
                    <p>
                        Products and categories are managed
                        using SQL Server database.
                    </p>
                </div>
            </div>

            <div class="col-md-4 wow fadeInUp" data-wow-delay="0.5s">
                <div class="service-item bg-light p-4 text-center h-100">
                    <i class="fa fa-user-shield fa-3x text-primary mb-3"></i>
                    <h5>Admin Panel</h5>
                    <p>
                        Secure admin panel to manage products,
                        categories and marketplace data.
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- ===================== FEATURES END ===================== -->


<!-- ===================== SERVICES PREVIEW START ===================== -->
 <!-- Service Start -->
    <div class="row g-4">

    <!-- Solar -->
    <div class="col-md-6 col-lg-4">
        <a href="solar.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/img-600x400-1.jpg">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-solar-panel fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">Solar Panels</h4>
                    <p class="text-dark">
                        Solar energy is the most used renewable source.
                        We offer high-efficiency panels, rooftop systems, inverters, and accessories 
                        for homes, offices, and industries.
.</p>
                </div>
            </div>
        </a>
    </div>

    <!-- Wind -->
    <div class="col-md-6 col-lg-4">
        <a href="wind.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/img-600x400-2.jpg">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-wind fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">Wind Turbines</h4>
                    <p class="text-dark">
                        Wind energy provides clean, sustainable power through wind turbines.
                        Explore small-scale home wind turbines and large commercial systems
                        available through our marketplace
                    </p>
                </div>
            </div>
        </a>
    </div>

    <!-- Hydro -->
    <div class="col-md-6 col-lg-4">
        <a href="hydro.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/img-600x400-3.jpg">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-lightbulb fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">Hydropower Plants</h4>
                    <p class="text-dark">
                        Hydropower is a reliable and continuous source of renewable energy.
                        Our marketplace offers micro-hydro generators and efficient hydropower
                        systems suitable for rural and remote locations..
                    </p>
                </div>
            </div>
        </a>
    </div>

<!-- ===================== SERVICES PREVIEW END ===================== -->




    <div class="container-fluid bg-light py-5">
  <div class="container text-center">
    <h6 class="text-primary">Get In Touch</h6>
    <h1 class="mb-4">Have Questions?</h1>
    <p>
      For renewable energy product inquiries or project details,
      feel free to contact us.
    </p>
    <a href="contact.aspx"
       class="btn btn-primary rounded-pill py-3 px-5">
       Contact Us
    </a>
  </div>
</div>

</asp:Content>

