<%-- 
    Document   : checkout
    Created on : 10.08.2022., 15:42:12
    Author     : Teodor
--%>

<%@page import="models.Address"%>
<%@page import="javafx.animation.Animation"%>
<%@page import="javafx.util.Duration"%>
<%@page import="javafx.animation.KeyFrame"%>
<%@page import="javafx.animation.Timeline"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.CartItem"%>
<%@page import="models.Cart"%>
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
                            <h1>Checkout Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <%
            Boolean cashMethod = false;
            Boolean paypalMethod = false;

            if (request.getParameter("method") != null && request.getParameter("method").equals("cash")) {
                cashMethod = true;
            } else if (request.getParameter("method") != null && request.getParameter("method").equals("paypal")) {
                paypalMethod = true;
            }


        %>



        <!-- check out section -->
        <form id="placeOrder" action="/JavaWebProjekt/PlaceOrder">
            <div class="checkout-section mt-150 mb-150">
                <%                
                    if (request.getParameter("validation") != null && request.getParameter("validation").equals("false")) {
                %>
                <h4 style="margin-left: 220px; color: darkorange;">Please, choose payment method!</h4>
                <%
                    }
                %>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="checkout-accordion-wrap">
                                <div class="accordion" id="accordionExample">

                                    <div class="card-header" >
                                        <h6 class="mb-0">
                                            1. Choose your payment method
                                        </h6>
                                    </div>
                                    <div class="card-header" style="margin-bottom: 50px;">
                                        <% if (cashMethod) {
                                        %>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=cash" class="boxed-btn" style="background-color: black; color: orange;" >Cash</a>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=paypal" class="boxed-btn" style="margin-left: 30px;" >PayPal</a>
                                        <%
                                        } else if (paypalMethod) {
                                        %>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=cash" class="boxed-btn" >Cash</a>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=paypal" class="boxed-btn" style="margin-left: 30px; color: orange; background-color: black;" >PayPal</a>
                                        <%
                                        } else {
                                        %>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=cash" class="boxed-btn" >Cash</a>
                                        <a href="/JavaWebProjekt/user/checkout.jsp?method=paypal" class="boxed-btn" style="margin-left: 30px;" >PayPal</a>
                                        <%
                                            }
                                        %>

                                    </div>



                                    <div class="card single-accordion">                                
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    2. Fill in your shipping address
                                                </button>
                                            </h5>
                                        </div>

                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="billing-address-form">
                                                    <%
                                                        if (request.getParameter("validation") != null && request.getParameter("validation").equals("false")) {
                                                    %>
                                                    <h4 style="color: darkorange;">Please, fill in all required fields! </h4>
                                                    <%
                                                        }
                                                        if (request.getParameter("validation") == null || request.getParameter("validation").equals("false")) {                                                           
                                                    %>
                                                    <form>
                                                        <p><input type="text"  placeholder="Name*" name="name" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" required ></p>
                                                        <p><input type="email" placeholder="Email*" name="email" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" required></p>
                                                        <p><input type="text" placeholder="Address*" name="address" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" required></p>
                                                        <p><input type="tel" placeholder="Phone*" name="phone" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" required></p>
                                                        <p><textarea name="comment" id="bill" cols="30" rows="10" placeholder="Say Something" style="width: 100%; border-radius: 3px; border: 1px solid #ddd; padding: 15px; height: 120px; resize: none;"></textarea></p>
                                                        <p><input type="submit" class="btn-block" value="Confirm"></p>
                                                    </form>
                                                        <%
                                                        }
                                                        else if (request.getParameter("validation") != null && request.getParameter("validation").equals("true")) {                                                           
                                                    %>
                                                    
                                                    <form>
                                                        <p><input type="text"  name="name" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" value="<%=request.getParameter("name")%>" ></p>
                                                        <p><input type="email"  name="email" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" value="<%=request.getParameter("email")%>"></p>
                                                        <p><input type="text"  name="address" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" value="<%=request.getParameter("address")%>"></p>
                                                        <p><input type="tel"  name="phone" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" value="<%=request.getParameter("phone")%>"></p>
                                                        <p><textarea name="comment" id="bill" cols="30" rows="10"  style="width: 100%; border-radius: 3px; border: 1px solid #ddd; padding: 15px; height: 120px; resize: none;" readonly="readonly"><%=request.getParameter("comment")%></textarea></p>
                                                    </form>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="order-details-wrap">
                                <table class="order-details">
                                    <thead>
                                        <tr>
                                            <th>Your order details</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>

                                    <tr>
                                        <td>Product</td>
                                        <td>Total</td>
                                    </tr>
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
                                    <tr>
                                        <td><%=item.getProduct().getName()%></td>
                                        <td><%=item.getProduct().getPrice()%> kn</td>
                                    </tr>

                                    <input id="paid" type="hidden" name="paid" value="">

                                    <%
                                        }
                                    %>


                                    <script src="https://www.paypal.com/sdk/js?client-id=ATsafOlXkiV6mw1y9SVRBgbuFP4rp2YkvRErw7sqBVboiB7shs3C8yURiJqUhSnYLOYKQ9zIO-NLrqMh&currency=EUR&disable-funding=credit,card"></script>

                                    <script>
                                        paypal.Buttons({
                                            // Sets up the transaction when a payment button is clicked
                                            createOrder: (data, actions) => {
                                                return actions.order.create({
                                                    purchase_units: [{
                                                            amount: {
                                                                value: '<%=Math.round(((sum + 25) / 7.536267) * 100.0) / 100.0%>' // Can also reference a variable or function
                                                            }
                                                        }]
                                                });
                                            },
                                            // Finalize the transaction after payer approval
                                            onApprove: (data, actions) => {
                                                return actions.order.capture().then(function (orderData) {
                                                    // Successful capture! For dev/demo purposes:
                                                    console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                                                    const transaction = orderData.purchase_units[0].payments.captures[0];
                                                    alert(`Transaction ${transaction.status}: ${transaction.id}\n\nYour payment is successfully completed!`);
                                                    // When ready to go live, remove the alert and show a success message within this page. For example:
                                                    document.getElementById("paid").value = "true";
                                                    setTimeout(function () {                                                      
                                                        document.getElementById("placeOrder").submit();
                                                    }, 3000);                                                  
                                                    // const element = document.getElementById('paypal-button-container');
                                                    // element.innerHTML = '<h3>Thank you for your payment!</h3>';
                                                    // Or go to another URL:  actions.redirect('thank_you.html');
                                                });
                                            }
                                        }).render('#paypal-button-container');
                                    </script>


                                    <tr><td></td></tr>
                                    <tbody class="checkout-details">
                                        <tr>
                                            <td>Subtotal</td>
                                            <td><%=Math.round(sum * 100.0) / 100.0%> kn</td>
                                        </tr>
                                        <tr>
                                            <td>Shipping</td>
                                            <td>25.0 kn</td>
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td><%=Math.round((sum + 25) * 100.0) / 100.0%> kn</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="price" value="<%=Math.round((sum + 25) * 100.0) / 100.0%>">
                                <%
                                    if (paypalMethod) {
                                %>   
                                <input type="hidden" name="method" value="paypal">
                                <%                                  
                                    boolean validAddress = false;                                   
                                    if (request.getParameter("validation") != null && request.getParameter("validation").equals("true")) {
                                        validAddress = true;
                                    }
                                    
                                    if (validAddress) {                                       
                                %>                             
                                <div id="paypal-button-container" style="margin-top: 25px; width: 250px;"></div>
                                <%
                                    }
                                } else if (cashMethod) {
                                %>
                                <input type="hidden" name="method" value="cash">
<!--                                <input type="hidden" name="paidCash" value="true">-->

                                <%
                                    if (request.getParameter("validation") != null && request.getParameter("validation").equals("true")) {
                                %>
                                <input type="hidden" name="paidCash" value="true">
                                <%
                                    }
                                %>
                                <input type="submit" value="Place Order" class="boxed-btn" style="margin-top: 25px;">   
                                <%
                                    }
                                %>                                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- end check out section -->



        <!-- logo carousel -->
        <jsp:include page="<%="../bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="../bodyImports/footer.jsp"%>"/>


    </body>
</html>
