<%-- 
    Document   : orderHistory
    Created on : 22.08.2022., 17:06:59
    Author     : Teodor
--%>

<%@page import="models.CartItem"%>
<%@page import="models.User"%>
<%@page import="java.util.Optional"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dal.RepoFactory"%>
<%@page import="models.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fruitkha</title>
        <jsp:include page="<%="../headImports/headImports.jsp"%>"/>
    </head>
    <body>
        <jsp:include page="<%="../bodyImports/header.jsp"%>"/>


        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Fresh and Organic</p>
                            <h1>Order history</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <%
            List<Order> orders = new ArrayList<Order>();
            orders = RepoFactory.getRepository().getOrders();
            String userEmail = (String) request.getSession().getAttribute("loggedUserEmail");

            int userId = 0;
            for (User u : RepoFactory.getRepository().getUsers()) {
                if (u.getEmail().equals(userEmail)) {
                    userId = u.getId();
                }
            }

            for (Order o : orders) {
                if (o.getUserId() == userId) {

                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy / HH:mm");
                    String dateTime = o.getDate().format(formatter);
        %>
        
        <div class="row" style="display: inline-block;">
            <div class="col-lg-3 col-md-4 text-center" style="float: left; margin-top: 30px;">
                <div class="single-product-item" style="width: 670px; height: 450px; margin-left: 55px;">
                    <p class="product-price">Order #<%=o.getId()%></p>
                    <div class="row d-flex justify-content-center" >
                        <div class="col-4" >
                            <h3  style=" font-weight: 600" >Date/time:</h3>
                        </div> 
                        <div class="col-4">
                            <h4  style= "font-weight: 200;" ><%=dateTime%></h4>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-4">
                            <h3  style=" font-weight: 600" >Payment method:</h3>
                        </div> 
                        <div class="col-4">
                            <h4  style="font-weight: 200;" ><%=o.getPaymentMethod()%></h4>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-4">
                            <h3  style=" font-weight: 600" >Shipping address:</h3>
                        </div> 
                        <div class="col-4">
                            <h4  style="font-weight: 200;" ><%=o.getAddress()%></h4>
                        </div>
                    </div>


                    <div class="row d-flex justify-content-center" style="margin-top: 20px;" >
                        <div class="col-4" >
                            <h3  style=" font-weight: 600" >Name:</h3>
                        </div> 
                        <div class="col-4">
                            <h3  style=" font-weight: 600" >Quantity:</h3>
                        </div> 
                        <div class="col-4">
                            <h3  style=" font-weight: 600" >Price:</h3>
                        </div> 
                    </div>

                    <%
                        for (CartItem item : o.getCart().getItems()) {
                    %>
                    <div class="row d-flex justify-content-center" >
                        <div class="col-4" >
                            <h3  style=" font-weight: 200" ><%=item.getProduct().getName()%></h3>
                        </div> 
                        <div class="col-4">
                            <h3  style=" font-weight: 200" ><%=item.getQuantity()%></h3>
                        </div> 
                        <div class="col-4">
                            <h3  style=" font-weight: 200" ><%=item.getProduct().getPrice()%> kn </h3>
                        </div> 
                    </div>
                    <%
                        }
                    %>
                    <hr>
                    <div class="row d-flex justify-content-center" style="margin-top: 20px;" >
                        <div class="col-5" >
                            <h3  style=" font-weight: 600" >Total:</h3>
                        </div> 
                        <div class="col-5">
                            <h3  style=" font-weight: 200" ><%=o.getPrice()%> kn</h3>
                        </div> 

                    </div>


                </div>
            </div>
        </div>

        <%
                }
            }
        %>

        <!-- logo carousel -->
        <jsp:include page="<%="../bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="../bodyImports/footer.jsp"%>"/>

    </body>
</html>
