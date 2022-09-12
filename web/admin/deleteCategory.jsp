<%-- 
    Document   : deleteCategory
    Created on : 23.08.2022., 13:31:11
    Author     : Teodor
--%>

<%@page import="dal.RepoFactory"%>
<%@page import="models.Category"%>
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
                            <h1>Delete category</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        
        <%
            int id = 0;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }

            Category c = new Category();
            for (Category cat : RepoFactory.getRepository().getCategories()) {
                if (cat.getId() == id) {
                    c = cat;
                }
            }

        %>
        
        
        <div class="container">
            <div class="row" style="margin: 50px; margin-left: 340px;">
                <div class="col-lg-7">
                    <div class="checkout-accordion-wrap">
                        <div class="accordion" id="accordionExample">
                            <div class="card single-accordion" >                                
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Delete category
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="billing-address-form">                       
                                            <form action="/JavaWebProjekt/DeleteCategory">
                                                <p><input type="text"  placeholder="Id" name="id" value="<%=c.getId()%>" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" ></p>
                                                <p><input type="text"  placeholder="Name" name="name" value="<%=c.getName()%>" style="border: 1px solid #ddd; padding: 15px; width: 100%; border-radius: 3px;" readonly="readonly" ></p>

                                                <p><input type="submit" class="btn-block" value="Confirm deletion"></p>
                                            </form>                     
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        
        
         <!-- logo carousel -->
        <jsp:include page="<%="/bodyImports/logos.jsp"%>"/>
        <!-- end logo carousel -->

        <!-- footer -->
        <jsp:include page="<%="/bodyImports/footer.jsp"%>"/>
        <!-- end footer -->
        
    </body>
</html>
