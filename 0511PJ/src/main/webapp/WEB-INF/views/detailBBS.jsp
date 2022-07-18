<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<li><a href="<%=request.getContextPath()%>/logout?path=view?no=${bbsvo.no}"><i
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

	<div class="bbsTitle">글 자세히 보기</div>
   <div id="bbslist">
   
      <table id = "table" class="table table-striped">
         <tbody>
               <tr>
                  <td>작성자</td>
                  <td>${bbsvo.bbs_user}</td>
               </tr>
               <tr>
                  <td>제목</td>
                  <td>${bbsvo.title}</td>
               </tr>
               <tr>
                  <td>내용</td>
                  <td>${bbsvo.memo}</td>
               </tr>
               <tr>
                 <td>비밀글 여부</td>
                  <td>
                  <c:if test="${bbsvo.scheck == 1 }">
                  	O
                  </c:if>
                  <c:if test="${bbsvo.scheck == 2 }">
                  	X
                  </c:if>
				 </td>
               </tr>
               <tr>
                  <td>조회수</td>
                  <td>${bbsvo.cnt}</td>
               </tr>
               <tr>
                  <td>작성일</td>
                  <td>
                  <fmt:parseDate value="${bbsvo.indate}" var='writedate' pattern="yyyy-MM-dd HH:mm:ss"/>
                  <fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd"/>
                  </td>
               </tr>
               <%-- <tr>
               	<td> 첨부파일</td>
                  <td>
                  <c:if test="${bbsvo.fname != null }">
                  	<a href="<%=request.getContextPath()%>/download?filename=${bbsvo.fname }">[첨부파일]</a>
                  </c:if>
                  </td>
               </tr>
                <tr>
                  <td> 이미지</td>
                  <!--  확장자가 그림이 이라면 나오도록 업그레이드하면 좋다.. -->
                  <td><img src="<%=request.getContextPath()%>/download?filename=${bbsvo.fname }"></td>
               </tr> --%>
         </tbody>
      </table>
      <c:if test="${nowuser == bbsvo.bbs_user }">
            <a class="btn btn-primary" href="<%=request.getContextPath() %>/bbsmod?no=${bbsvo.no}">수정하기</a>
            <a class="btn btn-primary" href="<%=request.getContextPath() %>/delno?no=${bbsvo.no}">삭제하기</a>
      </c:if>
            <a class="btn btn-primary" href="<%=request.getContextPath()%>/bbslist">목록으로</a>
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

                <p class="copyright"> Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</p>

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