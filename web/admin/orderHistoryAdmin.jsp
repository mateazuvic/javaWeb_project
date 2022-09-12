<%-- 
    Document   : orderHistoryAdmin
    Created on : 25.08.2022., 11:09:37
    Author     : Teodor
--%>

<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.time.LocalDate"%>
<%@page import="models.User"%>
<%@page import="models.CartItem"%>
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
            String cus = "";
            String date = "";
            LocalDate ld = LocalDate.now();
            if (request.getParameter("cus") != null) {
                cus = request.getParameter("cus");
            }
            if (request.getParameter("date") != null && request.getParameter("date") != "") {
                date = request.getParameter("date");
                ld = LocalDate.parse(date);
            }
            

        %>



        <form action="/JavaWebProjekt/SortOrders">
            <div class="row" >
                <div class=" card-body col-2" style="margin-top: 20px; margin-left: 550px;">
                    <label class="form-label" style="font-size: 18px;">Customer:  </label>
                    <select class="form-control-lg"  name="customer" >
                        <option value="-1">All customers</option>
                        <%                           
                            for (User user : RepoFactory.getRepository().getUsers()) {
                        %>
                        <option
                            value="<%=user.getId()%>" <%if (String.valueOf(user.getId()).equals(cus)) {%>selected<%}%>>
                            <%=user.getName() + " " + user.getSurname()%>
                        </option>
                        <%
                            } 
                        %>
                    </select>
                </div>
                    
                <div class=" card-body col-1" style="margin-top: 20px;  ">
                    <label class="form-label" style="font-size: 18px;">Date:  </label>
                    <% if (ld.equals(LocalDate.now())) {%>
                    <input  class="form-control-lg" name="date" type="date" min="2022-08-15" max="<%=LocalDate.now()%>" 
                            value="<%= LocalDate.now()%> ">     
                    <%} else {%>
                    <input  class="form-control-lg" name="date" type="date" min="2022-08-15" max="<%=LocalDate.now()%>" 
                            value="<%= ld%> ">     
                    <%}%>
                </div>
                <div class=" card-body col-2" style="margin-top: 46px; margin-left: 80px; ">
                    <input  class="boxed-btn" name="submit" type="submit" value="Sort">
                </div>
            </div>
        </form>

        <%
//            List<Order> orders = new ArrayList<Order>();
//            orders = RepoFactory.getRepository().getOrders();

            List<User> users = new ArrayList<User>();
            users = RepoFactory.getRepository().getUsers();

            List<Order> orders = null;
            if (request.getSession().getAttribute("ordersToShow") == null) {
                orders = RepoFactory.getRepository().getOrders();
            } else {
                orders = (List<Order>) request.getSession().getAttribute("ordersToShow");
            }

            for (Order o : orders) {

                User user = null;
                for (User u : users) {
                    if (o.getUserId() == u.getId()) {
                        user = u;
                        break;
                    }
                }

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
                        <div class="col-5">
                            <h4  style="font-weight: 200;" ><%=o.getAddress()%></h4>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-4">
                            <h3  style=" font-weight: 600" >Customer:</h3>
                        </div> 
                        <div class="col-4">
                            <h4  style="font-weight: 200;" ><%=user.getName() + " " + user.getSurname()%></h4>
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
        %>

        <!-- logo carousel -->
        <jsp:include page="<%="../bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="../bodyImports/footer.jsp"%>"/>

    </body>
</html>
