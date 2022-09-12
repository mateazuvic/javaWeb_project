<%-- 
    Document   : about
    Created on : 04.08.2022., 13:43:57
    Author     : Teodor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fruitkha</title>
        <jsp:include page="<%="/headImports/headImports.jsp"%>"/>
    </head>
    <body>

        <jsp:include page="<%="/bodyImports/header.jsp"%>"/>

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>We sale fresh fruits</p>
                            <h1>About Us</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- featured section -->
        <div class="feature-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="featured-text">
                            <h2 class="pb-3">Why <span class="orange-text">Fruitkha</span></h2>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 mb-4 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-shipping-fast"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Home Delivery</h3>
                                            <p>Now we have home delivery at your doors!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 mb-5 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-money-bill-alt"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Best Price</h3>
                                            <p>We offer the best prices in the area!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 mb-5 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-briefcase"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Custom Box</h3>
                                            <p>We can make custom boxes for gift or surprise!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-sync-alt"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Quick Refund</h3>
                                            <p>We guarantee a refund in case of our mistake!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end featured section -->

        <!-- shop banner -->
       <jsp:include page="<%="/bodyImports/shopBanner.jsp"%>"/>
        <!-- end shop banner -->

        <!-- team section -->
        <div class="mt-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3>Our <span class="orange-text">Team</span></h3>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-1"></div>
                            <h4>Jimmy Doe <span>Farmer</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-2"></div>
                            <h4>Marry Doe <span>Farmer</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-3"></div>
                            <h4>Simon Joe <span>Farmer</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end team section -->

        <jsp:include page="<%="/bodyImports/testimonials.jsp"%>"/>

        <!-- logo carousel -->
         <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>

    </body>
</html>
