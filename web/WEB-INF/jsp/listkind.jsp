<%-- 
    Document   : listbook
    Created on : Dec 17, 2018, 3:31:40 PM
    Author     : Lie
--%>
<%@page import="bean.kind"%>
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
        <title>Quản lý Thể Loại</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h2 style="text-align:center">Quản Lý Thể Loại</h2>
        <div class="container" >
            <br/>
            
            <form:form modelAttribute="ListKind" method="POST" action="listkind.htm">
                <table class="table border">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên Thể Loại</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="k" items="${listKind}">
                    <tr>
                        <th scope="row">${k.getId()}</th>
                        <td>${k.getName()}</td>
                        <td>
                            <a class="btn btn-primary"href="updatekind.htm?id=${k.getId()}">Sửa</a>
                            <a class="btn btn-danger" href="deletekind.htm?id=${k.getId() }">Xoá</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="addkind.htm" class="btn btn-success">Thêm mới</a>
            <a href="admin.htm" class="btn btn-success">Trang quản lý</a>
           </form:form>
            
        </div>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
