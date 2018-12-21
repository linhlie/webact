<%-- 
    Document   : add
    Created on : Oct 27, 2018, 4:01:08 PM
    Author     : Lie
--%>

<%@page import="bean.Author"%>
<%@page import="model.adminModel"%>
<%@page import="model.UserModel"%>
<%@page import="bean.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Truyện</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="updatebook.htm">Update Truyện</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <%
            adminModel ad = new adminModel();
            Author a = ad.getAuthor(request.getParameter("id"));
        %>
        <div class="container">
            <br/>
            
            <form:form modelAttribute="updatea" method="POST" action="updatea.htm" >
                <div class="form-group">
                    <label for="name">ID</label>
                    <form:input  path="id"  type="text" class="form-control"placeholder="" name="title" value="<%=a.getId()%>"/>
                </div>
                <div class="form-group">
                    <label for="name">Tên</label>
                    <form:input  path="name"  type="text" class="form-control"placeholder="" name="title" value="<%=a.getName()%>"/>
                </div>
                <div class="form-group">
                    <label for="name">Tác Giả</label>
                    <form:input  path="age"  type="text" class="form-control"placeholder="" name="title" value="<%=a.getAge()%>"/>
                </div>
                <button type="submit" class="btn btn-primary">Thêm</button>
            </form:form>
                
    </body>
</html>
