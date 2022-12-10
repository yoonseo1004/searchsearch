<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>searchsearch - 회원가입 페이지</title>
    <link rel="stylesheet" href="Join.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- 제이쿼리 import -->
        <script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
       
</head>
<body>
    <!-- 상단 메뉴 -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-brand ml-1">
                <a href="index.jsp" target="_self"><img src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true" width=50%
                    alt="searchsearch" class="d-inline-block align-text-top"></a>
                    <h4>회원가입</h4>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
            <form class="d-flex">
                <div class="btn-group">
                    <a class="btn btn-primary d-grid mx-auto" href="Login.jsp" role="button">로그인</a>
                </div>
            </form>
        </div>
    </nav>


    <!-- 본문 -->
    <div class="container mt-5">
        <div class="row">
            <div class="col col-lg-4 col-md-4 offset-md-4">
                <form action="JoinCon.do" method="post">
                    <div class="mb-3">
                        <label for="id" class="form-label">아이디</label>
                        
                      
                        <input onkeypress="enterKey2(event)"type="text" class="form-control" name="userId">
                        
                          <!-- 아이디 중복 체크 부분  -->
                        <p id="idCheck"></p>
                        <button id="btn" type="button" class="btn btn-primary d-grid col-4 mx-auto" >중복 확인</button>
                    </div>
                    <!--중복체크 끝  -->
                    
                    
                    <div class="mb-3">
                        <label for="Password1" class="form-label">비밀번호</label>
                        <input onkeypress="enterKey(event)" type="password" class="form-control" id="userPW" name="userPw">
                    </div>
                    <div class="mb-3">
                        <label for="nickname" class="form-label">닉네임</label>
                        <input onkeypress="enterKey(event)" type="text" class="form-control" id="userName" name="userName">
                    </div>
                    <button type="button" id = "join" class="btn btn-primary d-grid col-5 mx-auto">가입하기</button>
                    <a class="btn btn-primary d-grid col-5 mx-auto" href="Login.jsp" role="button">기존 회원 로그인</a>
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


</body>
</html>
<!-- 아이디 중복체크하는 ajax -->
         <script type="text/javascript">
         // 아이디 중복체크 버튼을 눌렀을 때 !
         $('#btn').on('click',function(){
            //사용자가 입력한 userId 가져오기
            //input태그인데 name=eamil인 요소의 값을 가져올것 
            //2개(로그인,회원가입)이기 때문에 인덱스 번호 사용해서 회원가입에 있는 요소의 값을 가져올 것.
            var userId = $('input[name=userId]').val();
           
            
            //ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
            $.ajax({
               // url : 어디와 통신을 할 것인지? action에 작성하는 값과 비슷 
               url : "idCheckCon.do",
               //data : url작성한 곳에 데이터를 보낼때 
               data :{
                  "userId" : userId 
               },
               //dataType : 결과 값을 어떤 타입으로 받아올 것 인지(jason,text등등)
               dataType : "text",
               // success : 통신 성공시 
               success : function(result){
                  if(result == 'true'){
                     $('#idCheck').html("아이디가 중복됩니다");
                     $('#idCheck').attr('style', 'color:red');
                     console.log("중복 체크 성공");
                  }else{
                     $('#idCheck').html("중복되는 아이디가 없습니다");
                     $('#idCheck').attr('style', 'color:blue');
                  }
               },
               // error : 통신 실패시
               error : function(e){
                  alert("실패");
                  console.log(e)
               }
            })
            
         });
         
         
         
         /* 회원가입 버튼 눌렀을 시 로그인 중복 재확인 */
         $('#join').on('click',function(){
             //사용자가 입력한 userId 가져오기
             //input태그인데 name=eamil인 요소의 값을 가져올것 
             //2개(로그인,회원가입)이기 때문에 인덱스 번호 사용해서 회원가입에 있는 요소의 값을 가져올 것.
             let userId = $('input[name=userId]').val();
             let userPw = $('input[name=userPw]').val();
             let userName = $('input[name=userName]').val();
             
             //ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
             $.ajax({
                // url : 어디와 통신을 할 것인지? action에 작성하는 값과 비슷 
                url : "JoinCon.do",
                //data : url작성한 곳에 데이터를 보낼때 
                data :{
                   "userId" : userId,
                   "userPw" : userPw,
                   "userName" : userName
                },
                //dataType : 결과 값을 어떤 타입으로 받아올 것 인지(jason,text등등)
                dataType : "text",
                // success : 통신 성공시 
                success : function(result){
                   if(result == 'fail'){
                      alert('중복되는 아이디로는 회원가입을 할 수 없습니다.');
                      console.log("중복 체크 성공");
                   }else{
                	   alert('회원가입이 성공하였습니다!');
                      location.href = "index.jsp";
                   }
                },
                // error : 통신 실패시
                error : function(e){
                	if(userId!=''&&userPw!=''&&userName!=''){
                	alert('중복되는 아이디로는 회원가입을 할 수 없습니다.');
                	}else{
                		alert('회원가입을 하기 위해서는 모든 칸을 채워야합니다.');
                	}
                }
             })
             
          });
         function enterKey(e) {
        	     if (e.keyCode == 13) {
        		 let userId = $('input[name=userId]').val();
                 let userPw = $('input[name=userPw]').val();
                 let userName = $('input[name=userName]').val();
                 
                 //ajax사용해서 비동기통신으로 아이디가 있는지 없는지 체크 후 결과값 받아오기
                 $.ajax({
                    // url : 어디와 통신을 할 것인지? action에 작성하는 값과 비슷 
                    url : "JoinCon.do",
                    //data : url작성한 곳에 데이터를 보낼때 
                    data :{
                       "userId" : userId,
                       "userPw" : userPw,
                       "userName" : userName
                    },
                    //dataType : 결과 값을 어떤 타입으로 받아올 것 인지(jason,text등등)
                    dataType : "text",
                    // success : 통신 성공시 
                    success : function(result){
                       if(result == 'fail'){
                          alert('중복되는 아이디로는 회원가입을 할 수 없습니다.');
                          console.log("중복 체크 성공");
                       }else{
                    	   alert('회원가입이 성공하였습니다!');
                          location.href = "index.jsp";
                       }
                    },
                    // error : 통신 실패시
                    error : function(e){
                    	if(userId!=''&&userPw!=''&&userName!=''){
                    	alert('중복되는 아이디로는 회원가입을 할 수 없습니다.');
                    	}else{
                    		alert('회원가입을 하기 위해서는 모든 칸을 채워야합니다.');
                    	}
                    }
                 })


        	     }
        	 }
         
         function enterKey2(e) {
        	 
        	 var userId = $('input[name=userId]').val();
        	 
        	     if (e.keyCode == 13) {
        		 $.ajax({
                     // url : 어디와 통신을 할 것인지? action에 작성하는 값과 비슷 
                     url : "idCheckCon.do",
                     //data : url작성한 곳에 데이터를 보낼때 
                     data :{
                        "userId" : userId 
                     },
                     //dataType : 결과 값을 어떤 타입으로 받아올 것 인지(jason,text등등)
                     dataType : "text",
                     // success : 통신 성공시 
                     success : function(result){
                        if(result == 'true'){
                           $('#idCheck').html("아이디가 중복됩니다");
                           $('#idCheck').attr('style', 'color:red');
                           console.log("중복 체크 성공");
                        }else{
                           $('#idCheck').html("중복되는 아이디가 없습니다");
                           $('#idCheck').attr('style', 'color:blue');
                        }
                     },
                     // error : 통신 실패시
                     error : function(e){
                        alert("실패");
                        console.log(e)
                     }
                  })


        	     }
        	 }
         </script>

</body>
</html>