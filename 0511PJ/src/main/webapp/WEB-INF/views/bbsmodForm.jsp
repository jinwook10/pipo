<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html lang="ko">

<head>

	<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Orani E-Shop</title>

	<!-- Latest compiled and minified CSS -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- Google Font -->

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">

    <!-- Theme Stylesheet -->

    <link rel="stylesheet" href="resources/css/style.css">

    <link rel="stylesheet" href="resources/css/responsive.css">

</head>

<body>

    <div class="top-bar">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <div class="social pull-left">

                        <ul>

                            <li><a href=""><i class="fa fa-facebook"></i></a></li>

                            <li><a href=""><i class="fa fa-twitter"></i></a></li>

                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>

                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>

                        </ul>

                    </div>

                </div>

                <div class="col-md-6">

                    <div class="action pull-right">

                        <ul>

                            <c:if test="${nowuser == null }">
                            <li><a href="<%=request.getContextPath()%>/signup"><i class="fa fa-lock"></i> 회원가입</a></li>
								<li><a href="<%=request.getContextPath()%>/login"><i
										class="fa fa-user"></i> 로그인</a></li>
							</c:if>
							<c:if test="${nowuser != null }">
							<li><a href="<%=request.getContextPath()%>/logout?path=bbslist"><i
									class="fa fa-user"></i> 로그아웃</a></li>
							</c:if>

                        </ul>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="header">

        <div class="container">

            <div class="row">

                <div class="col-md-3 col-sm-4">

                    <div class="logo">

                        <a href="<%=request.getContextPath()%>">

                            <img src="resources/images/logo.png" alt="Orani E-shop">

                        </a>

                    </div>

                </div>

                <div class="col-md-7 col-sm-5">

                    <div class="search-form">

                        <form class="navbar-form" role="search">

                            <div class="form-group">

                              <input type="text" class="form-control" placeholder="What do you need...">

                            </div>

                            <button type="submit" class="btn"><i class="fa fa-search"></i></button>

                        </form>

                    </div>

                </div>

                <div class="col-md-2 col-sm-3">

                    <div class="cart">

                        <div class="cart-icon">

                            <a href=""><i class="fa fa-shopping-cart"></i></a>

                        </div>

                        <div class="cart-text">

                            <c:if test="${nowuser == null }">
								로그인 해주세요.
							</c:if>
							<c:if test="${nowuser != null }">
								${nowuser } 님<br>환영합니다.
							</c:if>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="navigation">

        <nav class="navbar navbar-theme">

          <div class="container">

            <!-- Brand and toggle get grouped for better mobile display -->

            <div class="navbar-header">

              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">

                <span class="sr-only">Menu</span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

              </button>

            </div>

            <div class="shop-category nav navbar-nav navbar-left">

                <!-- Single button -->

                <div class="btn-group">

                  <button type="button" class="btn btn-shop-category dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    카테고리 선택 <span class="caret"></span>

                  </button>

                  <ul class="dropdown-menu">

                    <li><a href="">국내도서</a></li>

                    <li><a href="">해외도서</a></li>

                    <li><a href="">원서</a></li>

                    <li role="separator" class="divider"></li>

                    <li><a href="">후기</a></li>

                    <li><a href="<%=request.getContextPath()%>/bbslist">자유게시판</a></li>

                  </ul>

                </div>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->

            <div class="collapse navbar-collapse" id="navbar">

              <ul class="nav navbar-nav navbar-right">

                <li><a href="#">홈</a></li>

                <li><a href="#">추천 도서</a></li>

                <li><a href="#">이벤트</a></li>

                <li><a href="#">팁</a></li>

                <li><a href="#">회사 정보</a></li>

              </ul>

            </div><!-- /.navbar-collapse -->

          </div><!-- /.container-fluid -->

        </nav>

    </div>

	<div class="bbsTitle">글 수정</div>
	<div id="bbslist">
		<form action="<%=request.getContextPath() %>/bbsmod" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">작성자</label> <input
					type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" name="bbs_user" value="${bbsvo.bbs_user }" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control"
					id="exampleInputPassword1" name="pass" value="${bbsvo.pass }">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">제목</label> <input
					type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" name="title" value="${bbsvo.title }">
			</div>

			<div class="form-floating">
				<label for="floatingTextarea2">내용</label>
				<textarea class="form-control" placeholder="Leave a comment here"
					id="floatingTextarea2" style="height: 100px" name="memo">${bbsvo.memo }</textarea>
			</div>
			<div class="form-check form-switch">
			<!--   ${bbsvo.memo } 가 1이면 비밀글 2이면 비밀글 아님..   if. jstl-->
				<input class="form-check-input" type="checkbox" role="switch"
					id="flexSwitchCheckChecked" 
					 name="scheck" value="1"
					 
					<c:if test="${bbsvo.scheck eq '1'}">
    					<c:out value="checked" />
					</c:if>
					 
					 > <label
					class="form-check-label" for="flexSwitchCheckChecked">비밀글</label>
			</div>
			<input type="hidden" name="no" value=${bbsvo.no }>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
		<!-- /example -->

	</div>

	<div class="footer">

		<div class="container">

			<div class="row">

				<div class="col-md-3 col-sm-3">

					<div class="single-widget">

						<h2 class="widget-title">About Us</h2>

						<div class="widget-inner">

							<p>Office: 868 Fake Street, New York</p>

							<p>Phone: (08) 8827 633354</p>

							<p>Fax: 08) 08 4752 1499</p>

							<p>Email: mail@yourdomain.com</p>

							<img src="resources/images/payment.png" alt="we accept">

						</div>

					</div>

				</div>

				<div class="col-md-3 col-sm-3">

					<div class="single-widget">

						<h2 class="widget-title">Information</h2>

						<div class="widget-inner">

							<ul>

								<li><a href="">Frequently Asked Question</a></li>

								<li><a href="">Terms and Condition</a></li>

								<li><a href="">Privacy Policy</a></li>

								<li><a href="">Customer Service</a></li>

								<li><a href="">Delivery Information</a></li>

								<li><a href="">Manufacturers</a></li>

							</ul>

						</div>

					</div>

				</div>

				<div class="col-md-3 col-sm-3">

					<div class="single-widget">

						<h2 class="widget-title">Customer Care</h2>

						<div class="widget-inner">

							<ul>

								<li><a href="">Contact Us</a></li>

								<li><a href="">Sitemap</a></li>

								<li><a href="">Gift Vouchers</a></li>

								<li><a href="">Live Chat 24x7</a></li>

							</ul>

						</div>

					</div>

				</div>

				<div class="col-md-3 col-sm-3">

					<div class="single-widget">

						<h2 class="widget-title">Our Services</h2>

						<div class="widget-inner">

							<ul>

								<li><a href="">Shipping & Returns</a></li>

								<li><a href="">Secure Shopping</a></li>

								<li><a href="">International Shipping</a></li>

								<li><a href="">Affiliates</a></li>

								<li><a href="">Contact</a></li>

							</ul>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

	<div class="copyright text-center">

        <div class="container">

            <div class="row">

                <p class="copyright"> Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>

            </div>

        </div>

    </div>

	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="js/script.js"></script>

</body>

</html>