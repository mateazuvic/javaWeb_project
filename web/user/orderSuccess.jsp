<%-- 
    Document   : cashOrder
    Created on : 21.08.2022., 11:14:15
    Author     : Teodor
--%>

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
                            <h1>Order completed!</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
       
        
        
        <div class="find-location blue-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p> <i class="fas"></i> Thanks for your order, <%=request.getParameter("name")%> !</p>
                    </div>
                </div>
            </div>
        </div>
        
        
         <!-- logo carousel -->
        <jsp:include page="<%="../bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="../bodyImports/footer.jsp"%>"/>
        
        
    </body>
</html>
