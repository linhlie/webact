<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản lý hệ thống truyện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist\css\bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/fontawesome-free-5.4.2-web\css\all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css2\sachTA.css">
</head>

<body>

    <header>

        <nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="navbar-header" style="text-align: center;">
                <a class="navbar-brand" href="admin.htm" style="color: white;" >Quản Trị Hệ Thống - Bạn Cần Nâng Cấp Tôi Cái Gì Nào?</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Xin Chào : Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Đổi mật khẩu</a></li>
                            <li><a href="logout.htm">Log out</a></li>

                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </header>
     <nav class="fixed-top menu">
            <div class="container">
                <div class="_1khoi">
                    <a href="index.htm" class="tieude"><i class="fa fa-home"></i> Trang Chủ</a>

                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="listuser.htm" class="tieude">Quản lý User</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="listbook.htm" class="tieude">Quản Lý Truyện</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="listauthor.htm" class="tieude">Quản Lý Tác Giả</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="listfolder.htm" class="tieude">Quản Lý Folder</a>
                    
                </div> <!-- the end _1khoi -->
                <div class="_1khoi">
                    <a href="listkind.htm" class="tieude">Quản Lý Thể loại</a>
                    
                </div> <!-- the end _1khoi -->
            </div>
        </nav>
        <!-- the end nav -->
        <div class="content">
            <div class="container noflex">
                
                       
                    </div>
                </div>
              
                </div>

            </div>
        </div><!-- the end content -->
        <div class="container inf_add">
           
        </div>

    
    <script src="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/index.js"></script>

</body>

</html>