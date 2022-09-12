<%-- 
    Document   : contact
    Created on : 04.08.2022., 14:08:51
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
                            <p>Get 24/7 Support</p>
                            <h1>Contact us</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- contact form -->
        <div class="contact-from-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4" style="margin-left: 100px; margin-top: 70px;">
                        <div class="contact-form-wrap">
                            <div class="contact-form-box">
                                <h4><i class="fas fa-map"></i> Shop Address</h4>
                                <p>Jadranska cesta 47, <br> Zadar <br> Hrvatska</p>
                            </div>
                            <div class="contact-form-box">
                                <h4><i class="far fa-clock"></i> Shop Hours</h4>
                                <p>MON - FRIDAY: 8 to 9 PM <br> SAT - SUN: 10 to 8 PM </p>
                            </div>
                            <div class="contact-form-box">
                                <h4><i class="fas fa-address-book"></i> Contact</h4>
                                <p>Phone: +00 111 222 3333 <br> Email: support@fruitkha.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                         <img src="./assets/img/shop.jpg" style="height: 600px; margin-left: 100px;" alt="">
                       </div>
                </div>
            </div>
        </div>
        <!-- end contact form -->

        <!-- find our location -->
        <div class="find-location blue-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p> <i class="fas fa-map-marker-alt"></i> Find Our Location</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- end find our location -->

        <!-- google map section -->
        <div class="embed-responsive embed-responsive-21by9">
            <iframe src="https://maps.google.com/maps?q=Jadranska%20cesta%2047%20Zadar&t=&z=17&ie=UTF8&iwloc=&output=embed" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" class="embed-responsive-item"></iframe>
        </div>
        <!-- end google map section -->


        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        
    </body>
</html>
