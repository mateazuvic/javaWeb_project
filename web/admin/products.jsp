<%-- 
    Document   : products
    Created on : 24.08.2022., 09:35:59
    Author     : Teodor
--%>

<%@page import="dal.RepoFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
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
                            <h1>Products</h1>
                            <div class="hero-btns">
                                <a href="/JavaWebProjekt/admin/newProduct.jsp" class="bordered-btn">New</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
        <%
            List<Product> products = new ArrayList<Product>();
            products = RepoFactory.getRepository().getProducts();

            for (Product p : products) {
        %>

        <div class="row" style="display: inline-block;">
            <div class="col-lg-3 col-md-4 text-center" style="float: left; margin-top: 30px;">
                <div class="single-product-item hero-text" style="width: 400px; height: 120px; margin-left: 75px;">
                    <p class="subtitle" style="margin-top: 20px;">Product #<%=p.getId()%></p>
                    <p class="product-price"><%=p.getName()%></p>
                    <div class="hero-btns">
                        <a href="/JavaWebProjekt/admin/editProduct.jsp?id=<%=p.getId()%>" class="boxed-btn">Edit</a>
                        <a href="/JavaWebProjekt/admin/deleteProduct.jsp?id=<%=p.getId()%>" class="boxed-btn" style="margin-left: 15px;">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <%
            }
        %>


        <!-- logo carousel -->
        <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <!-- footer -->
        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        <!-- end footer -->



    </body>
</html>
