<%-- 
    Document   : listbook
    Created on : Dec 17, 2018, 3:31:40 PM
    Author     : Lie
--%>
<%@page import="bean.User"%>
<%@page import="bean.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.UserModel"%>
<%@page import="model.adminModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sách</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h2 style="text-align:center">Quản Lý Sách</h2>
        <div class="container" >
            <br/>
            
            <form:form modelAttribute="List" method="POST" action="listbook.htm">
                <table class="table border">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên Sách</th>
                        <th scope="col">Mô Tả</th>
                        <th scope="col">Giá Bán</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="b" items="${listBook}">
                    <tr>
                        <th scope="row">${b.getId()}</th>
                        <td>${b.getName()}</th>
                        <td>${b.getDescribe()}</td>
                        <td>${b.getPrice()}</td>
                        <td>
                            <a class="btn btn-primary"href="updatebook.htm?id=${b.getId()}">Sửa</a>
                            <a class="btn btn-danger" href="deletebook.htm?id=${b.getId() }">Xoá</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
                <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:choose>
                    <c:when test="${current==total&& total==1}">
                        <c:forEach var="i" begin="1" end="${total}" step="1">
                        <li class="page-item"><a class="page-link" href="listbook.htm?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:when test="${current ==1}">
                        <c:forEach var="i" begin="1" end="${total}" step="1">
                            <li class="page-item"><a class="page-link" href="listbook.htm?page=${i}">${i}</a></li>
                        </c:forEach>
                    <li class="page-item"><a class="page-link" href="listbook.htm?page=${current + 1}">Next</a></li>
                        </c:when>
                            <c:when test="${total==current}">
                            <li class="page-item"><a class="page-link" href="listbook.htm?page=${current - 1}">Previous</a></li>
                                <c:forEach var="i" begin="1" end="${total}" step="1">
                                    <li class="page-item"><a class="page-link" href="listbook.htm?page=${i}">${i}</a></li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                            <li class="page-item"><a class="page-link" href="listbook.htm?page=${current - 1}">Previous</a></li>
                            <c:forEach var="i" begin="1" end="${total}" step="1">
                                <li class="page-item"><a class="page-link" href="listbook.htm?page=${i}">${i}</a></li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="listbook.htm?page=${current + 1}">Next</a></li>
                            </c:otherwise>
                            </c:choose>
                        </ul>
                </nav>
            <a href="addbook.htm" class="btn btn-success">Thêm mới</a>
            <a href="admin.htm" class="btn btn-success">Trang quản lý</a>
           </form:form>
        </div>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
