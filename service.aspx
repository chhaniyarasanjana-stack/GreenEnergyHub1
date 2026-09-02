<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="service.aspx.vb" Inherits="service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
    <meta charset="utf-8">
    <title>Green anergy marketplace</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

    <!-- Bio -->
    <div class="col-md-6 col-lg-4">
        <a href="bio.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/bio1.png">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-solar-panel fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">Bio Energy System</h4>
                    <p class="text-dark">
                        Bio energy is produced from organic materials and is eco-friendly.
                        Explore biogas plants, biomass stoves, and waste-to-energy equipment
                        available on our platform..
                    </p>
                </div>
            </div>
        </a>
    </div>

    <!-- EV -->
    <div class="col-md-6 col-lg-4">
        <a href="ev.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/ev1.png">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-wind fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">EV Charging Solution</h4>
                    <p class="text-dark">
                        Electric vehicles are the future of clean transportation.
                        Our marketplace offers EV home chargers, commercial charging stations,
                        and smart charging accessories..
                    </p>
                </div>
            </div>
        </a>
    </div>

    <!-- Battery -->
    <div class="col-md-6 col-lg-4">
        <a href="battery.aspx" class="text-decoration-none">
            <div class="service-item rounded overflow-hidden">
                <img class="img-fluid" src="img/green1.png">
                <div class="position-relative p-4 pt-0">
                    <div class="service-icon">
                        <i class="fa fa-lightbulb fa-3x"></i>
                    </div>
                    <h4 class="mb-3 text-dark">Green Battery Storage</h4>
                    <p class="text-dark">
                       Battery storage systems allow renewable energy to be stored and used later.
                       Explore lithium batteries, solar battery packs, and hybrid storage solutions
                       for homes and industries..
                    </p>
                </div>
            </div>
        </a>
    </div>

</div>

    <!-- Service End -->


</asp:Content>

