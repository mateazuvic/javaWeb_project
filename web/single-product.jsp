<%-- 
    Document   : single-product
    Created on : 10.08.2022., 15:31:00
    Author     : Teodor
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@page import="dal.RepoFactory"%>
<%@page import="models.Product"%>
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
                            <p>See more Details</p>
                            <h1>Single Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        <%
            
            String selectedProductName = request.getParameter("name");
            
            Product selectedProduct = null;
            
            List<Product> products = RepoFactory.getRepository().getProducts();
            for (Product p : products) {
                    if (p.getName().equals(selectedProductName)) {
                            selectedProduct = p;
                        }
                }
            
//            Optional<Product> foundProduct = RepoFactory.getRepository().getProducts()
//                        .stream()
//                        .filter(p -> p.getName().equals(selectedProductName))
//                        .findFirst();

//            if (foundProduct.isPresent()) {
               //Product selectedProduct = foundProduct.get();
            
        
            
         %>

        <!-- single product -->
        <form action="/JavaWebProjekt/AddToCart?name=<%= selectedProduct.getName()%>">
        <div class="single-product mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="single-product-img">
                            <img src="<%= selectedProduct.getPicturePath()%>" alt="">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="single-product-content">
                            <h3><%= selectedProduct.getName()%></h3>
                            <p class="single-product-pricing"><span>Per Kg</span><%= selectedProduct.getPrice()%> kn</p>
                            <p>Fruits are important sources of vitamins and carbohydrates like fiber and sugar. They are low in calories and naturally sweet. Fruits and their juices are good sources of water, too. Eating fruit provides health benefits — people who eat more fruits and vegetables as part of an overall healthy diet are likely to have a reduced risk of some chronic diseases. Fruits provide nutrients vital for health and maintenance of your body.</p>
                            <div class="single-product-form">
                                <input type="hidden" name="name" value="<%=selectedProduct.getName()%>">
                                    <input type="number" placeholder="1" name="quantity" min="1">
                                    <input type="submit" name="submit" class="cart-btn" value="Add to Cart">
                                
                                <p><strong>Categories: </strong>Fruits, Organic</p>
                            </div>
                            <h4>Share:</h4>
                            <ul class="product-share">
                                <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href=""><i class="fab fa-twitter"></i></a></li>
                                <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                                <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <!-- end single product -->
        
        <%
            //}
         %>

<!--         more products 
        <div class="more-products mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">	
                            <h3><span class="orange-text">Related</span> Products</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae optio.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a href="single-product.jsp"><img src="assets/img/products/product-img-1.jpg" alt=""></a>
                            </div>
                            <h3>Strawberry</h3>
                            <p class="product-price"><span>Per Kg</span> 85$ </p>
                            <a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a href="single-product.jsp"><img src="assets/img/products/product-img-2.jpg" alt=""></a>
                            </div>
                            <h3>Berry</h3>
                            <p class="product-price"><span>Per Kg</span> 70$ </p>
                            <a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 offset-lg-0 offset-md-3 text-center">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a href="single-product.jsp"><img src="assets/img/products/product-img-3.jpg" alt=""></a>
                            </div>
                            <h3>Lemon</h3>
                            <p class="product-price"><span>Per Kg</span> 35$ </p>
                            <a href="cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         end more products -->


        <!-- logo carousel -->
        <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <!-- footer -->
        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        <!-- end footer -->




    </body>
</html>
