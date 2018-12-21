<%-- 
    Document   : add
    Created on : Oct 27, 2018, 4:01:08 PM
    Author     : Lie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Truyện</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="addbook.htm">Thêm truyện mới</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>


        <div class="container">
            <br/>
            <form:form modelAttribute="addNew" method="POST" action="add.htm">
                <div class="form-group">
                    <label for="name">Tên</label>
                    <form:input  path="name"  type="text" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="major">Mô tả</label>
                    <form:input path="describe" cssStyle="height: calc(2.25rem + 100px);" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="className">Nội Dung</label>
                    <form:textarea path="conten" cssStyle="height: calc(2.25rem + 400px);" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="className">Ảnh</label>
                    <form:input path="images" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="className">Giá</label>
                    <form:input path="price" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="className">ID Comment</label>
                    <form:input path="comment" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="className">ID Folder</label>
                    <form:input path="folder" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="className">ID Kind</label>
                    <form:input path="kind"  class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="className">ID Author</label>
                    <form:input  path="author" class="form-control"/>
                </div>  
                <button type="submit" class="btn btn-primary">Thêm</button>
            </form:form>
        </div>
    </body>
</html>
