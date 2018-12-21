<%-- 
    Document   : book
    Created on : Dec 3, 2018, 11:47:29 PM
    Author     : Lie
--%>

<%@page import="java.util.List"%>
<%@page import="bean.Book"%>
<%@page import="model.UserModel"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang tìm kiếm</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/fontawesome-free-5.4.2-web/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css2/sachTA.css">
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
    <div class="title_ebookchonloc">
                <div class="chonloc">Sách tìm kiếm</div>
                <div class="content_chonloc">
                     <% UserModel usermodel = new UserModel();
                                List<Book> list = usermodel.getsearchbook(request.getParameter("name"));
                                for(Book b :list){
                        %>
                    <a href="thisbook.htm?id=<%= b.getId() %>" class="block_content">
                        <img src="${pageContext.request.contextPath}<%=b.getImages() %>" alt="" class="anh">
                        <h4 class="titleBook"><%=b.getName() %></h4>
                        <span class="rating">
                            <i class="fa fa-star star-item"></i>
                            <i class="fa fa-star star-item"></i>
                            <i class="fa fa-star star-item"></i>
                            <i class="fa fa-star star-item"></i>
                            <i class="fa fa-star star-item"></i>
                        </span>
                        <p class="price">Miễn Phí</p>
                    </a>
                        <% 
                                }
                        %>
                        
                </div>
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
</body>
</html>
