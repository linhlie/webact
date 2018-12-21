<%-- 
    Document   : book
    Created on : Dec 3, 2018, 11:47:29 PM
    Author     : Lie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="bean.Author"%>
<%@page import="java.util.List"%>
<%@page import="bean.Book"%>
<%@page import="model.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <% UserModel usermodel = new UserModel();
            Book b = usermodel.getBook(request.getParameter("id"));
            Author a = usermodel.getAuthor(request.getParameter("id"));
        %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title><%= b.getName()%></title>

        <link href="${pageContext.request.contextPath}/public/css/bootstrap.min_1.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/public/css/animate.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/public/css/bootsnav.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/public/css/style_1.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/partials/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/partials/vendor/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css2/index.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/fontawesome-free-5.4.2-web/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css2/index.css">

    </head>

    <body>
        <header>
            <div class="container">
                <a href="index.htm" class="logo"><img src="${pageContext.request.contextPath}/public/imagesStory/logo_sachtot.jpg" alt="LOGO"></a>
                <div class="top_search">
                    <form:form action="search.htm" method="post" modelAttribute="searchBook">
                        <input path="name"  type="text" name="name" id="search" class="timkiem" placeholder="Nhập Sách Muốn Tìm ?">
                        <button class="check" type="submit"><i class="fa fa-search"></i></button>
                        </form:form>
                </div>
               <div class="login">
                    <c:if test="${loginInfo != null&&!loginInfo.equals('')}">
                    <i>Xin chào: ${loginInfo}</i>
                    <i class="fa fa-user"></i><a path="id" href="logout.htm? id=${id}" class="dangnhap">Đăng Xuất</a>
                    </c:if>
                    <c:if test="${loginInfo == null||loginInfo.equals('')}">
                    <i class="fa fa-user-plus"></i><a href="register.htm" class="themtaikhoan">Đăng Ký</a>
                    <i class="fa fa-user"></i><a href="login.htm" class="dangnhap">Đăng Nhập</a>
                    </c:if>
                </div>
            </div> <!-- the end container -->
        </header><!-- the end header -->
        <nav class="fixed-top menu">
            <div class="container">
                <div class="_1khoi">
                    <a href="index.htm" class="tieude"><i class="fa fa-home"></i> Trang chủ</a>

                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="kindbook.htm?id=1" class="tieude">Sách ngoại ngữ</a>
                   
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="kindbook.htm?id=3" class="tieude">Sách Kinh doanh</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="kindbook.htm?id=4" class="tieude">Phát triển cá nhân</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="kindbook.htm?id=5" class="tieude">Sách văn học</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="kindbook.htm?id=6" class="tieude">Sách kinh tế</a>

                </div> <!-- the end _1khoi -->
            </div>
        </nav>
        <div class="clearfix"></div>
        <div class="content">
            <div class="container">
                <div class="slider">
                    <div class="slider_left">
                        <img  alt="qc" class="qc" src="${pageContext.request.contextPath}/public/imagesStory/qc_left.png">
                    </div>
                    <div class="slider_right">

                        <div id="carousel-id" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item">
                                    <img alt="Second slide" src="${pageContext.request.contextPath}/public/imagesStory/slider2.jpg">
                                </div>
                                <div class="item ">
                                    <img alt="Third slide" src="${pageContext.request.contextPath}/public/imagesStory/slider3.jpg">
                                </div>
                                <div class="item active">
                                    <img alt="Third slide" src="${pageContext.request.contextPath}/public/imagesStory/slider4.jpg">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                            <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div> 
            </div>
            <div class="content">
                <div class="container noflex">
                    <h2 class="tieudend" style="text-align: center"><%= b.getName()%></h2>
                    <p style="text-align: center">Tác giả: <%= a.getName()%></p>
                    <p style="text-align: center">Tuổi: <%= a.getAge()%></p>
                    <h3 style="text-align: center">Nội dung</h3>
                </div>
            </div>
                <div style="text-align: center">
                <iframe align="center" width="800px" height="800px" name="conten" src="${pageContext.request.contextPath}<%= b.getConten()%>"></iframe>
                </div>
            <div style="font-family: Lato;margin-top: 100px;">
                <c:if test="${loginInfo != null}">
                    <h4 style="text-align: center">Bình luận</h4>
                    <div class="row">
                        <form:form >
                        <div class="col-md-6 col-md-offset-3">
                            <div class="panel panel-info">
                                    <input path=""  style="width: 100%;height: 100px;" name="name" id="search" class="timkiem" placeholder="Nhận xét của bạn ?">
                            </div>
                        </div>
                            <button style="background-color: gold">Comment</button>
                        </form:form>
                    </div>
                </c:if>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap/comment.css" />
                <script src="${pageContext.request.contextPath}/public/js/jquery-1.10.2.min.js"></script>
                <script src="${pageContext.request.contextPath}/public/bootstrap/js/bootstrap.min.js"></script>
            </div>

            <div class="container inf_add">
                <div class="inf_bot">
                    <img src="${pageContext.request.contextPath}/public/imagesStory/bottom1.jpg" alt="" class="anhbot">
                    <h4 class="titleBot">Đọc ở mọi lúc mọi nơi</h4>
                    <p class="noidungnho">Sách Tốt dùng được trên máy vi tính, di động, máy tính bảng của bạn.</p>
                </div><!-- the end inf_bot -->
                <div class="inf_bot">
                    <img src="${pageContext.request.contextPath}/public/imagesStory/bottom2.jpg" alt="" class="anhbot">
                    <h4 class="titleBot">Không quảng cáo</h4>
                    <p class="noidungnho">Tất cả các sách bạn đọc đều không có quảng cáo.</p>
                </div><!-- the end inf_bot -->
                <div class="inf_bot">
                    <img src="${pageContext.request.contextPath}/public/imagesStory/bottom3.jpg" alt="" class="anhbot">
                    <h4 class="titleBot">Tải & đọc ngoại tuyến</h4>
                    <p class="noidungnho">Sách đã tải về máy không cần mạng khi đọc nữa.</p>
                </div><!-- the end inf_bot -->
                <div class="inf_bot">
                    <img src="${pageContext.request.contextPath}/public/imagesStory/bottom4.jpg" alt="" class="anhbot">
                    <h4 class="titleBot">Đa dạng thể loại nội dung</h4>
                    <p class="noidungnho">Sách Tốt có: Sách chữ, truyện tranh và tạp chí.</p>
                </div><!-- the end inf_bot -->
                <div class="inf_bot">
                    <img src="${pageContext.request.contextPath}/public/imagesStory/bottom5.jpg" alt="" class="anhbot">
                    <h4 class="titleBot">Đọc sách VIP siêu rẻ</h4>
                    <p class="noidungnho">Chỉ 1,000 vnđ/ngày là bạn có thể đọc tất cả những gì Waka có.</p>
                </div><!-- the end inf_bot -->
            </div>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <a href="https://twitter.com/TauTivi">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/linhlie.nguyenkhaclinh">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://github.com/LinhNguyen1510">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <p class="copyright">Copyright © Your Website 2018</p>
                        </div>
                    </div>
                </div>
            </footer>
            <script src="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/public/js/index.js"></script>
            <!-- End Content -->

            <!-- START JAVASCRIPT -->

            <!-- Placed at the end of the document so the pages load faster -->
            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/public/js/bootstrap.min.js"></script>

            <!-- Bootsnavs -->
            <script src="${pageContext.request.contextPath}/public/js/bootsnav.js"></script>
    </body>
</html>
