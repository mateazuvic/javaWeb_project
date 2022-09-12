<%-- 
    Document   : login
    Created on : 10.08.2022., 17:26:51
    Author     : Teodor
--%>

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
                            <h1>Login</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
        
        <section class="vh-1" style="background-color: #eee;">
            <div class="container" >
                <div class="row d-flex justify-content-center align-items-center h-1">
                    <div class="col-lg-10 col-xl-10">
                        <div class="card text-black" style="background-color: #eee; border: none;">
                            <div class="card-body p-md-5">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-5 col-xl-5 order-2 order-lg-1">

                                        <form class="mx-1 mx-md-4" method="POST" action="login">

                                          
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example3c">Email</label>
                                                    <input type="email" name="email" id="form3Example3c" class="form-control" required="true"  />
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example4c">Password</label>
                                                    <input type="password" name="password" id="form3Example4c" class="form-control" required="true"  />
                                                </div>
                                            </div>


                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <input type="submit" class="btn btn-primary" value="login"/>
                                            </div>
                                            
                                       </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
         <!-- logo carousel -->
         <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        
        
    </body>
</html>
