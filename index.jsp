<%@page import="searchModel.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>searchsearch - 메인 페이지</title>
<link rel="stylesheet" href="index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-image: linear-gradient(rgba(237, 235, 223, 0.8),
		rgba(237, 235, 223, 0.8)),
		url(https://github.com/yoonseo1004/yoonseo/blob/main/images/main_back.jpg?raw=true);
	background-size: cover;
}

.btn.btn-primary {
	color: white;
}


</style>
</head>


<body>
	<%
	userDTO info = (userDTO) session.getAttribute("info");
	%>
	<!-- 상단 메뉴 -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-brand ml-1">
				<a href="index.jsp" target="_self"><img
					src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true"
					width=50% alt="searchsearch" class="d-inline-block align-text-top"></a>
				<h4>Main</h4>

			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
			<form class="d-flex">
				<div class="btn-group">
					<%
					if (info == null) {
					%>
					<a class="top_button btn btn-primary d-grid mx-auto"
						href="Login.jsp" role="button">로그인</a> <a
						class="btn btn-primary d-grid mx-auto" href="Join.jsp"
						role="button">회원가입</a>
					<%
					} else {
					%>
					<a class="top_button btn btn-primary d-grid mx-auto"
						href="Update.jsp" role="button">정보수정</a> <a
						class="top_button btn btn-primary d-grid mx-auto"
						href="bookmark.jsp" role="button">즐겨찾기</a> <a
						class="btn btn-primary d-grid mx-auto" href="deleteCon.do"
						role="button">로그아웃</a>
					<%
					}
					%>
				</div>
			</form>
		</div>
	</nav>


	<!-- header 텍스트 -->
	<div class="container text">
		<div class="row row-cols-12">
			<div class="col">
				<h2>나만의 옷 스타일을 추천해드립니다</h2>
			</div>
		</div>
		<div class="row row-cols-12">
			<div class="col col-lg-12">
				<p>Our searchsearch is a web service that recommends your
					clothing styles.</p>
			</div>
		</div>
		<div class="row row-cols-12">
			<div class="col col-lg-12">
				<p>We also recommend shopping mall sites that match your
					clothing style.</p>
			</div>
		</div>
	</div>




	<!-- 옷 사진 올리기 버튼 -->
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
  <a href="mansMain.jsp"><button class="btn btn-primary man" type="Man">Man</button></a>
  <a href="grilsMain.jsp"><button class="btn btn-primary woman" type="Woman">Woman</button></a>
	</div>




	<!-- 캐러셀 -->
	<div class="row colorbox"></div>
	<div class="container carousel">
		<div id="carouselExampleFade" class="carousel slide carousel-fade"
			data-bs-ride="carousel" data-bs-wrap="true" data-bs-pause="false"
			data-bs-keyboard="false" data-bs-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://github.com/yoonseo1004/yoonseo/blob/main/images/main_slide04.jpg?raw=true"
						class="d-block w-100">
					<div class="carousel-caption d-none d-md-block">
						<h5>searchsearch abou us</h5>
						<p>searchsearch는 당신의 옷 스타일을 추천하는 웹서비스입니다</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="https://github.com/yoonseo1004/yoonseo/blob/main/images/main_slide05.jpg?raw=true"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>recommend shopping mall sites</h5>
						<p>나만의 스타일에 맞는 쇼핑몰 사이트을 추천해 드립니다</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="https://github.com/yoonseo1004/yoonseo/blob/main/images/main_slide03.jpg?raw=true"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Get recommendations for your own style</h5>
						<p>나만의 옷 스타일을 추천 받아보세요</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 하단 서브 이미지 SNS구현 -->



	<!-- footer -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item mb-4"></li>
			</ul>
			<p class="text-center text-muted">&copy; 2022 searchsearch
				Company, Inc</p>
		</footer>
	</div>

	<script>
		function toMain() {
			location.href = "mansMain.jsp";
		}
	</script>

</body>
</html>