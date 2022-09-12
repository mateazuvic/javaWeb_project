<%-- 
    Document   : cart
    Created on : 10.08.2022., 15:23:54
    Author     : Teodor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.CartItem"%>
<%@page import="models.Cart"%>
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
                            <h1>Cart</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
        
        <!-- cart -->
        <div class="cart-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="cart-table-wrap">
                            <table class="cart-table">
                                <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove"></th>
                                        <th class="product-image">Product Image</th>
                                        <th class="product-name">Name</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Cart cart = null;
                                        double sum = 0;

                                        if (request.getSession() != null && (Cart) request.getSession().getAttribute("cart") != null) {
                                            cart = (Cart) request.getSession().getAttribute("cart");
                                        } else {
                                            cart = new Cart(new ArrayList<CartItem>());
                                        }
                                        
                                        for (CartItem item : cart.getItems()) { 
                                        sum += item.getProduct().getPrice() * item.getQuantity();

                                    %>
                                     <form action="/JavaWebProjekt/UpdateCart">
                                    <tr class="table-body-row">
                                        <td class="product-remove"><a href="/JavaWebProjekt/RemoveFromCart?name=<%= item.getProduct().getName()%>"><i class="far fa-window-close"></i></a></td>
                                        <td class="product-image"><img src="<%=item.getProduct().getPicturePath()%>" alt=""></td>
                                        <td class="product-name"><%=item.getProduct().getName()%></td>
                                        <td class="product-price"><%=item.getProduct().getPrice()%> kn</td>
                                        <td class="product-quantity"><input type="number" name="quantity<%=item.getProduct().getName()%>" value="<%=item.getQuantity()%>" min="1" placeholder="<%=item.getQuantity()%>"></td>
                                        <td class="product-total"><%=item.getQuantity()%></td>
                                    </tr>
                                    

                                    <%
                                     }                                     
                                    %>
                                                           
                                </tbody>
                            </table>
                            <%
                                if (cart.getItems().isEmpty()) {
                            %>
                            <h3 style="margin-top: 20px; margin-left: 199px;">Your cart is empty!</h3>
                            <%
                                }
                            %>       
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="total-section">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data">
                                        <td><strong>Subtotal: </strong></td>
                                        <td><%=Math.round(sum * 100.0) / 100.0%> kn</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>Shipping: </strong></td>
                                        <td>25.0 kn</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>Total: </strong></td>
                                        <td><%=Math.round((sum + 25) * 100.0) / 100.0%> kn</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="cart-buttons">
                                <input type="submit" value="Update" style="margin-left: 40px;">
                                    </form>
                                   
<!--                                    <form action="checkout.jsp" style="margin-left: 160px; margin-top: -56px;">
                                        <input type="submit" value="Checkout" >
                                    </form>-->
                                     <%
                                        if (cart.getItems().isEmpty()) {
                                     %>
                                     <div style="margin-left: 170px; margin-top: -52px;">
                                    <a href="/JavaWebProjekt/cart.jsp" class="bordered-btn" style="text-transform: uppercase; color: black; font-size: 15px; font-weight: 700;">Checkout</a>
                                    </div>
                                     <%
                                         } else {
                                     %>
                                    <div style="margin-left: 170px; margin-top: -52px;">
                                    <a href="/JavaWebProjekt/user/checkout.jsp" class="bordered-btn" style="text-transform: uppercase; color: black; font-size: 15px; font-weight: 700;">Checkout</a>
                                    </div>
                                    <%
                                         } 
                                     %>
                            </div>
                        </div>

                        
                    </div>
                </div>
            </div>
        </div>
        <!-- end cart -->

        <!-- logo carousel -->
        <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <!-- footer -->
        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        <!-- end footer -->



    </body>
</html>
