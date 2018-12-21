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
        <title>Quản lý Folder</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <h2 style="text-align:center">Quản Lý Folder</h2>
        <div class="container" >
            <br/>
            
            <form:form modelAttribute="ListFolder" method="POST" action="listfolder.htm">
                <table class="table border">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên Folder</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="f" items="${listFolder}">
                    <tr>
                        <th scope="row">${f.getId()}</th>
                        <td>${f.getName()}</td>
                        <td>
                            <a class="btn btn-primary"href="updatefolder.htm?id=${f.getId()}">Sửa</a>
                            <a class="btn btn-danger" href="deletefolder.htm?id=${f.getId() }">Xoá</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="addfolder.htm" class="btn btn-success">Thêm mới</a>
            <a href="admin.htm" class="btn btn-success">Trang quản lý</a>
           </form:form>
            
        </div>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
