<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đơn hàng</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4><a href="home" style="color:white">Trang chủ</a></h4>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Khách hàng</th>
                            <th>Sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listOrderedDetail}" var="o">
                            <tr>
                                <c:if test="${o.status == 0}">
                                <td class="align-middle"><a href="updatedetail?pID=${o.pID}&oID=${o.oID}" class="text-dark">
                                        <button type="button" class="btn btn-danger">Xác nhận</button>
                                    </a>
                                </td>
                                </c:if>
                                <c:if test="${o.status == 1}">
                                <td class="align-middle"><a href="#?=${o.pID}&oID=${o.oID}" class="text-dark">
                                        <button type="button" class="btn btn-danger">Đang giao</button>
                                    </a>
                                </td>
                                </c:if>
                                <c:if test="${o.status == 2}">
                                <td>
                                    <a href="finish?pID=${o.pID}&oID=${o.oID}" class="btn btn-success btn-block" style="color : white">Hoàn thành</a>
                                </td>
                                </c:if>
                                <td>${o.user}</td>
                                <td><img src="${o.image}">
                                    <br>
                                    ${o.name}</td>
                                <td>${o.price} VND</td>
                                <td>${o.quantity}</td>
                                <td>${o.phone}</td>
                                <td>${o.address}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>