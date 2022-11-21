<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Siêu thị gia dụng</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://code.iconify.design/iconify-icon/1.0.1/iconify-icon.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:if test="${seller != null}">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb" style="display: inline-block;">
                                <h3><iconify-icon style="color: green;" icon="bi:shop"></iconify-icon> ${seller.user}</h3>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </c:if>
            <div class="container">
                <div class="row">
                <jsp:include page="Category.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="row">
                        <c:forEach items="${listOfP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?id=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} VNĐ</p>
                                            </div>
                                            <div class="col">
                                                <a href="addtocart?pid=${o.id}" class="btn btn-success btn-block">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="clearfix">
                        <ul class="pagination">
                            <% if (request.getAttribute("cid") == null && request.getAttribute("key") == null) {%>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a href="home?page=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <% } else if (request.getAttribute("cid") != null) { %>
                                <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a href="category?page=${i}&cid=${tagOfC}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <% } else { %>
                                <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a href="search?page=${i}&key=${key}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <% }%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>


