<%-- 
    Document   : listbook
    Created on : Dec 17, 2018, 3:31:40 PM
    Author     : Lie
--%>
<%@page import="bean.User"%>
<%@page import="bean.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.UserModel"%>
<%@page import="bean.Author" %>
<%@page import="model.adminModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tác giả</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h2 style="text-align:center">Quản Lý Tác Giả</h2>
        <div class="container" >
            <br/>
            
            <form:form modelAttribute="ListAuthor" method="POST" action="listauthor.htm">
                <table class="table border">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tác Giả</th>
                        <th scope="col">Tuổi</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="a" items="${listAuthor}">
                    <tr>
                        <th scope="row">${a.getId()}</th>
                        <td>${a.getName()}</th>
                        <td>${a.getAge()}</td>
                        <td>
                            <a class="btn btn-primary"href="updateauthor.htm?id=${a.getId()}">Sửa</a>
                            <a class="btn btn-danger" href="deleteauthor.htm?id=${a.getId() }">Xoá</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="addauthor.htm" class="btn btn-success">Thêm mới</a>
            <a href="admin.htm" class="btn btn-success">Trang quản lý</a>
           </form:form>
            
        </div>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
