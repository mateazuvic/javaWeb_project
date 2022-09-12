<%-- 
    Document   : index
    Created on : 04.08.2022., 12:03:51
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
        
        
         <!-- home page slider -->
        <div class="homepage-slider">
                <!-- single home slider -->
                <div class="single-homepage-slider homepage-bg-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
                                <div class="hero-text">
                                    <div class="hero-text-tablecell">
                                        <p class="subtitle">Fresh & Organic</p>
                                        <h1>Delicious Seasonal Fruits</h1>
                                        <div class="hero-btns">
                                            <a href="shop.jsp" class="boxed-btn">Fruit Collection</a>
                                            <a href="contact.jsp" class="bordered-btn">Contact Us</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single home slider -->
                <div class="single-homepage-slider homepage-bg-2">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1 text-center">
                                <div class="hero-text">
                                    <div class="hero-text-tablecell">
                                        <p class="subtitle">Fresh Everyday</p>
                                        <h1>100% Organic Collection</h1>
                                        <div class="hero-btns">
                                            <a href="shop.jsp" class="boxed-btn">Visit Shop</a>
                                            <a href="contact.jsp" class="bordered-btn">Contact Us</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single home slider -->
                <div class="single-homepage-slider homepage-bg-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1 text-right">
                                <div class="hero-text">
                                    <div class="hero-text-tablecell">
                                        <p class="subtitle">Mega Sale Going On!</p>
                                        <h1>Get September Discount</h1>
                                        <div class="hero-btns">
                                            <a href="shop.jsp" class="boxed-btn">Visit Shop</a>
                                            <a href="contact.jsp" class="bordered-btn">Contact Us</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end home page slider -->
            
              <!-- features list section -->
            <div class="list-section pt-80 pb-80">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                            <div class="list-box d-flex align-items-center">
                                <div class="list-icon">
                                    <i class="fas fa-shipping-fast"></i>
                                </div>
                                <div class="content">
                                    <h3>Free Shipping</h3>
                                    <p>When order over $75</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                            <div class="list-box d-flex align-items-center">
                                <div class="list-icon">
                                    <i class="fas fa-phone-volume"></i>
                                </div>
                                <div class="content">
                                    <h3>24/7 Support</h3>
                                    <p>Get support all day</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="list-box d-flex justify-content-start align-items-center">
                                <div class="list-icon">
                                    <i class="fas fa-sync"></i>
                                </div>
                                <div class="content">
                                    <h3>Refund</h3>
                                    <p>Get refund within 3 days!</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- end features list section -->
            
             <!-- product section -->
            <div class="product-section mt-150 mb-150">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2 text-center">
                            <div class="section-title">	
                                <h3><span class="orange-text">Our</span> Products</h3>
                                <p style="width: 800px;">While fresh fruits should be a part of your everyday meals, some 
                                    fruits are hard to find even in the huge supermarkets in your area. 
                                    However, the luxury of online shopping offers customers the comfort of 
                                    relishing these by ordering them from the comfort of their home. 
                                    While strawberries, bananas, lemons and oranges can easily be found in the market, 
                                    Fruitkha makes grocery shopping easier for you with our fresh produce delivered 
                                    in top class packages right at your doorstep. With our wide delivery network,
                                    geographical barriers are easily overcome in more than 25 major cities, thereby 
                                    giving you the benefit of fresh fruits every time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6 text-center">
                            <div class="single-product-item">
                                <div class="product-image">
                                   <img src="assets/img/products/product-img-1.jpg" alt="">
                                </div>
                                <h3>Strawberry</h3>
                                <p class="product-price"><span>Per Kg</span> 50.0 kn </p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 text-center">
                            <div class="single-product-item">
                                <div class="product-image">
                                    <img src="assets/img/products/product-img-2.jpg" alt="">
                                </div>
                                <h3>Berry</h3>
                                <p class="product-price"><span>Per Kg</span> 70.0 kn </p>
                                
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                            <div class="single-product-item">
                                <div class="product-image">
                                    <img src="assets/img/products/product-img-3.jpg" alt="">
                                </div>
                                <h3>Lemon</h3>
                                <p class="product-price"><span>Per Kg</span> 20.0 kn </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end product section -->
            
            <!-- cart banner section -->
            <section class="cart-banner pt-100 pb-100">
                <div class="container">
                    <div class="row clearfix">
                        <!--Image Column-->
                        <div class="image-column col-lg-6">
                            <div class="image">
                                <div class="price-box">
                                    <div class="inner-price">
                                        <span class="price">
                                            <strong>30%</strong> <br> off per kg
                                        </span>
                                    </div>
                                </div>
                                <img src="assets/img/a.jpg" alt="">
                            </div>
                        </div>
                        <!--Content Column-->
                        <div class="content-column col-lg-6">
                            <h3><span class="orange-text">Deal</span> of the month</h3>
                            <h4>Japanese Strawberry</h4>
                            <div class="text">This Japanese strawberry is rich in fruit and has a round appearance. It also has a high sugar content with moderate acidity and a strong strawberry taste. In supermarkets, a packet can cost about 400-600 yen.</div>
                            <!--Countdown Timer-->
                            <div class="time-counter"><div class="time-countdown clearfix" data-countdown="2020/2/01"><div class="counter-column"><div class="inner"><span class="count">00</span>Days</div></div> <div class="counter-column"><div class="inner"><span class="count">00</span>Hours</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Mins</div></div>  <div class="counter-column"><div class="inner"><span class="count">00</span>Secs</div></div></div></div>
                            <a href="cart.jsp" class="cart-btn mt-3"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end cart banner section -->

            <!-- testimonail-section -->
           <jsp:include page="<%="/bodyImports/testimonials.jsp"%>"/>
            <!-- end testimonail-section -->

            <!-- advertisement section -->
            <div class="abt-section mb-150">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="abt-bg">
                                <a href="https://www.youtube.com/watch?v=DBLlFWYcIGQ" class="video-play-btn popup-youtube"><i class="fas fa-play"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="abt-text">
                                <p class="top-sub">Since Year 1999</p>
                                <h2>We are <span class="orange-text">Fruitkha</span></h2>
                                <p>Officially established in 1999, Fruitkha has a long history that dates back to the 1920s. 
                                    Our experience and heritage within the fruit industry in Croatia is second to none. Keeping our roots intact,
                                    we represent the same passion for quality, service and values that we were built on. </p>
                                <p>Today, Fruitkha imports 
                                    fresh, wholesome and high quality fruits straight from the orchards of the farthest corners of the world.
                                    We have a vast distribution network comprising of highly dedicated professionals coupled with strong logistics support, 
                                    establishing a nationwide reach. Our scale of operation ensures that the fruits we supply ends up in 
                                    millions of fruit bowls across the country.</p>
                                <a href="about.jsp" class="boxed-btn mt-4">Know more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end advertisement section -->

            <!-- shop banner -->
           <jsp:include page="<%="/bodyImports/shopBanner.jsp"%>"/>
            <!-- end shop banner -->


            <!-- logo carousel -->
             <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
            <!-- end logo carousel -->

            <!-- footer -->
            <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
            <!-- end footer -->

           
        
    </body>
</html>
