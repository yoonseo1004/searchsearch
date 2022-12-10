<!DOCTYPE html>
<%@page import="searchModel.userDTO"%>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>searchsearch - 로그인 페이지</title>
    <link rel="stylesheet" href="Login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>

<body>

    <!-- 상단 메뉴 -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-brand ml-1">            
                <a href="index.jsp" target="_self">
                <img src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true" width=50%
                    alt="searchsearch" class="d-inline-block align-text-top"></a>
                    <h4>로그인</h4>
            </div>
           
            <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
            <form class="d-flex">
    
                <div class="btn-group">
                    <a class="btn btn-primary d-grid mx-auto" href="Join.jsp" role="button">회원가입</a>
               
                </div>
            </form>
        </div>
    </nav>


    <!-- 본문 -->
    <div class="container mt-5">
        <div class="row">
            <div class="col col-lg-4 col-md-4 offset-md-4">
                <form action="LoginCon.do" method="post">
                    <div class="mb-3">
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="userId" name="userId2">
                    	<p id="loginCheck" style="color:red"></p>
                    </div>
                    <div class="mb-3">
                        <label for="Password1" class="form-label">비밀번호</label>
                        <input onkeypress="enterKey(event);" type="password" class="form-control" id="userPw" name="userPw2">
                    </div>
                    <button type="button" onclick="loginCheck()" class="btn btn-primary d-grid col-5 mt-4 mx-auto">로그인</button>
                </form>
                <div class="col col-lg-4 col-md-4"></div>
            </div>
        </div>
    </div>


    <!-- footer -->
    <div class="container">
        <footer class="py-3 my-4">
          <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item mb-4"></li>
          </ul>
          <p class="text-center text-muted">&copy; 2022 searchsearch Company, Inc</p>
        </footer>
      </div>
      <script>
function loginCheck(){
	let userId = $('#userId').val();
	let userPw = $('#userPw').val();
 $.ajax({
		//요청 경로 url
		url:'LoginCon.do',
		//요청 데이터(사용자가 입력한 댓글, 게시물번호)
	//json 방식 {key:value(실제값)}
		data:{'userId' : userId, 'userPw':userPw},
	//요청 방식 지정 type(html-form태그의 method)(get/post) 따로 지정 안해주면 get방식
		type: 'get',
		success : (result) => {
			if(result=='success'){
				console.log("로그인 성공");
				location.href = "index.jsp";
		}else{
			console.log('로그인 실패');
			$('#loginCheck').html('회원정보가 일치하지 않습니다.');
			
		}
		},
		error : (data) => alert('fail')
	});
 }
 </script>
     <script type="text/javascript">
function enterKey(e) {
    if (e.keyCode == 13) {
		loginCheck();


    }
}

</script>

</body>
</html>