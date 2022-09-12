<%-- 
    Document   : categories
    Created on : 23.08.2022., 11:13:15
    Author     : Teodor
--%>

<%@page import="dal.RepoFactory"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
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
                            <h1>Categories</h1>
                            <div class="hero-btns">
                                <a href="/JavaWebProjekt/admin/newCategory.jsp" class="bordered-btn">New</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <%
            List<Category> categories = new ArrayList<Category>();
            categories = RepoFactory.getRepository().getCategories();

            for (Category c : categories) {
        %>

        <div class="row" style="display: inline-block;">
            <div class="col-lg-3 col-md-4 text-center" style="float: left; margin-top: 30px;">
                <div class="single-product-item hero-text" style="width: 400px; height: 120px; margin-left: 75px;">
                    <p class="subtitle" style="margin-top: 20px;">Category #<%=c.getId()%></p>
                    <p class="product-price"><%=c.getName()%></p>
                    <div class="hero-btns">
                        <a href="/JavaWebProjekt/admin/editCategory.jsp?id=<%=c.getId()%>" class="boxed-btn">Edit</a>
                        <a href="/JavaWebProjekt/admin/deleteCategory.jsp?id=<%=c.getId()%>" class="boxed-btn" style="margin-left: 15px;">Delete</a>
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
