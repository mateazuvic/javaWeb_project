<%-- 
    Document   : loginHistory
    Created on : 24.08.2022., 12:22:34
    Author     : Teodor
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dal.RepoFactory"%>
<%@page import="models.Login"%>
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
                            <h1>Login history</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
        <%
            List<Login> logins = new ArrayList<Login>();
            logins = RepoFactory.getRepository().getLogins();
            
            for (Login login : logins) {
                 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy / HH:mm");
                 String dateTime = login.getDateTime().format(formatter);
                                    
        %>
        
        <div class="row" style="display: inline-block;">
            <div class="col-lg-3 col-md-4 text-center" style="float: left; margin-top: 30px;">
                <div class="single-product-item" style="width: 570px; height: 200px; margin-left: 130px;">
                    
                    <p class="product-price">Login #<%=login.getId()%></p>
                    <div class="row d-flex justify-content-center" >
                        <div class="col-6" >
                            <h3  style=" font-weight: 600" >User:</h3>
                        </div> 
                        <div class="col-6">
                            <h4  style= "font-weight: 200;" ><%=login.getUser().getName() + " " + login.getUser().getSurname()%></h4>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-6">
                            <h3  style=" font-weight: 600" >Date / time:</h3>
                        </div> 
                        <div class="col-6">
                            <h4  style="font-weight: 200;" ><%=dateTime%></h4>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-6">
                            <h3  style=" font-weight: 600" >IP address:</h3>
                        </div> 
                        <div class="col-6">
                            <h4  style="font-weight: 200;" ><%=login.getIPAddress()%></h4>
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
