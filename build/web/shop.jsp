<%-- 
    Document   : shop
    Created on : 10.08.2022., 15:08:30
    Author     : Teodor
--%>


<%@page import="java.util.TreeSet"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.Repository"%>
<%@page import="models.Category"%>
<%@page import="dal.RepoFactory"%>
<%@page import="java.util.List"%>
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
                            <p>Fresh and Organic</p>
                            <h1>Shop</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->


        <!-- products -->
        <div class="product-section mt-150 mb-150">
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-filters">
                            <ul>
                                <li class="active" data-filter="*">All</li>
                                <%
                                    List<Category> categories = RepoFactory.getRepository().getCategories();
                                    for (Category cat : categories) {
                                %>                               
                                <li data-filter=".<%=cat.getName()%>"><%=cat.getName()%></li>
                                <%
                                      }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                               
                <div class="row product-lists">
                    
                <%
                        //List<Product> products = new ArrayList<Product>();
                        if (request.getSession().getAttribute("products") == null) {
                            response.sendRedirect("/JavaWebProjekt/Products");
                            return;
                        }
                        List<Product> products = (List<Product>) request.getSession().getAttribute("products");
                        List<Object> distinct = products.stream()
                                        .distinct()
                                        .collect(Collectors.toList());
                       
                        
                        for (Product product :  (List<Product>)(Object)distinct) {
                %>

                
                    <div class="col-lg-4 col-md-6 text-center <%=product.getCategory().getName()%>">
                        <div class="single-product-item">
                            <div class="product-image">
                                <a href="single-product.jsp?name=<%= product.getName()%>"><img src="<%= product.getPicturePath()%>" alt=""></a>
                            </div>
                                <h3><%=product.getName()%></h3>
                            <p class="product-price"><span>Per Kg</span> <%=product.getPrice()%> kn </p>
                           
                                <a href="/JavaWebProjekt/AddToCart?name=<%= product.getName()%>" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                            
                        </div>
                    </div>

                        <%
                             }
                        %>

                </div>

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="pagination-wrap">
                            <ul>
                                <li><a href="#">Prev</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end products -->

        
        <!-- logo carousel -->
        <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <!-- footer -->
        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        <!-- end footer -->


        
        
        

    </body>
</html>
