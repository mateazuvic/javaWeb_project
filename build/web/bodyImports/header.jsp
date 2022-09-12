<%-- 
    Document   : header
    Created on : 04.08.2022., 11:56:38
    Author     : Teodor
--%>

<%@page import="models.User"%>
<%@page import="dal.RepoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">

                            <!-- logo -->
                            <div class="site-logo">
                                <a href="/JavaWebProjekt/index.jsp">
                                    <img src="/JavaWebProjekt/assets/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <nav class="main-menu">
                                <ul>
                                    <li class="current-list-item"><a href="/JavaWebProjekt/index.jsp">Home</a>
                                    </li>
                                    <li><a href="/JavaWebProjekt/about.jsp">About</a></li>
                                    <li><a href="/JavaWebProjekt/contact.jsp">Contact</a></li>
                                    <li><a href="/JavaWebProjekt/shop.jsp">Shop</a></li>
                                        <%
                                            boolean isAdmin = false;
                                            if (request.getSession().getAttribute("loggedUserEmail") != null) {
                                                String email = (String) request.getSession().getAttribute("loggedUserEmail");
                                                for (User u : RepoFactory.getRepository().getUsers()) {
                                                    if (u.getEmail().equals(email) && u.isIsAdmin() == true) {
                                                        isAdmin = true;
                                                    }
                                                }
                                            }
                                            if (request.getSession().getAttribute("loggedUserEmail") == null) {
                                        %>
                                    <li><a href="/JavaWebProjekt/register.jsp" style="margin-left: 90px;">Register</a></li>
                                    <li><a href="/JavaWebProjekt/login.jsp">Login</a></li>
                                        <%
                                        } else if (isAdmin == false) {
                                        %>
                                    <li><a href="#" style="margin-left: 150px; color: white; font-weight: 400;"><%=request.getSession().getAttribute("loggedUserEmail")%></a>
                                        <ul class="sub-menu" style="margin-left: 130px;">
                                            <li><a href="/JavaWebProjekt/user/orderHistory.jsp">Order history</a></li>
                                        </ul>
                                    </li>


                                    <li style="margin-left: 15px;">
                                        <form action="/JavaWebProjekt/logOut" method="GET">
                                            <input type="submit" style="width: 100px; height: 50px; font-size: 12px;" value="logOut"/>
                                        </form>
                                    </li>

                                    <%
                                    } else if (isAdmin == true) {
                                    %>
                                    <li><a href="#" style="margin-left: 150px; color: white; font-weight: 400;"><%=request.getSession().getAttribute("loggedUserEmail")%></a>
                                        <ul class="sub-menu" style="margin-left: 130px;">
                                            <li><a href="/JavaWebProjekt/admin/categories.jsp">Categories</a></li>
                                            <li><a href="/JavaWebProjekt/admin/products.jsp">Products</a></li>
                                            <li><a href="/JavaWebProjekt/admin/loginHistory.jsp">Login history</a></li>
                                            <li><a href="/JavaWebProjekt/admin/orderHistoryAdmin.jsp">Order history</a></li>
                                        </ul>
                                    </li>


                                    <li style="margin-left: 15px;">
                                        <form action="/JavaWebProjekt/logOut" method="GET">
                                            <input type="submit" style="width: 100px; height: 50px; font-size: 12px;" value="logOut"/>
                                        </form>
                                    </li>

                                    <%
                                        }
                                    %>
                                    <li>
                                        <div class="header-icons">
                                            <a class="shopping-cart" href="/JavaWebProjekt/cart.jsp"><i class="fas fa-shopping-cart"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->

                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
