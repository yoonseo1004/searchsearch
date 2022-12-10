<!DOCTYPE html>
<%@page import="searchModel.userDTO"%>
<%@page import="searchModel.clothDAO"%>
<%@page import="java.util.List"%>
<%@page import="searchModel.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="KR">

<head>
<script src="Main.js"></script>
<link href="Main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>searchsearch - 나만의 패션사진을 올려주세요^^</title>
<script>
history.scrollRestoration = "manual";

</script>
<style>
.btn-outline-secondary:hover {
	background-color: #104a8c;
	color: white;
}	
</style>

</head>
<body>
	<%
	userDTO user = (userDTO) session.getAttribute("info");
	%>

	<!-- 상단 메뉴 -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-brand ml-1;">
				<a href="index.jsp" target="_self">
				<img src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true"
					width=50% alt="searchsearch" class="d-inline-block align-text-top"></a>
					<h4>업로드</h4>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>

			<div class="btn-group">

				<%
				if (user == null) {
				%>
				<a class="btn btn-primary d-grid mx-auto" href="Login.jsp"
					role="button">로그인</a> <a class="btn btn-primary d-grid mx-auto"
					href="Join.jsp" role="button">회원가입</a>
				<%
				} else {
				%>
				<a class="btn btn-primary d-grid mx-auto" href="Update.jsp"
					role="button">정보수정</a> <a class="btn btn-primary d-grid mx-auto"
					href="bookmark.jsp?page=1" roFle="button">즐겨찾기</a>
				<form action="deleteCon.do">
					<button class="btn btn-primary d-grid mx-auto" type=submit">로그아웃</button>
				</form>
				<%
				}
				%>


			</div>

		</div>
	</nav>
	<!-- 배경 이미지 -->
	<div class="row">
		<div class="col mx-auto main_image"></div>
	</div>



	<div class="file-upload">
		<div class="mb-3" style="text-align: center;">
			<!-- 토글 만들기 -->

		<!-- 	<span style="margin-right: 20px; display: inline-block"><h5>남자</h5></span>
			<label class="switch">남자 <input id="gender" type="checkbox">
				<span class="slider round"></span>
			</label> <span style="margin-left: 20px; display: inline-block"><h5>여자</h5></span>
			  -->

			<!-- 토글 부분 끝 -->
		</div>
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">Add
			Image</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type='file'
				onchange="readURL(this);init().then(()=>predict());"
				accept="image/*" />
			<div class="drag-text">
				<h3>
					<strong>나만의 패션사진을 올려주세요</strong>
				</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" style="border:0px; width: 300px; height: 300px;"
				id="face-image" src="#" alt="your image" />
			<div class="image-title-wrap">
				<button type="button" id="delete"
					onclick="removeUpload();removePredict();()=>document.body.scrollTop = 0"
					class="remove-image">새로운 사진 올리기</button>
			</div>
		</div>
	</div>



	<div id="webcam-container"></div>
	<div id="label-container" style="text-align: center"></div>

	<div style="text-align: center">
		<i id='loading' style="display: inline-block;font-size:30px;color: #FCC471; visibility: hidden"
			class="fa fa-circle-o-notch fa-spin"></i>
	</div>
	<div style="text-align: center">
		<a id="recommandCloth">
			<button style="visibility: hidden" type="submit" id="recommand"
				class="btn-outline-secondary" style="text-align:center">추천쇼핑몰
				보러가기</button>
		</a>
	</div>
	</div>



	<!-- footer -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item mb-4"></li>
			</ul>
			<p class="text-center text-muted mb-4">&copy; 2022 searchsearch
				Company, Inc</p>
		</footer>
	</div>














	<!-- 자바 스크립트 -->

	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>



	<script type="text/javascript">
        // More API functions here:
        // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image
        // the link to your model provided by Teachable Machine export panel
        const URL = "https://teachablemachine.withgoogle.com/models/COZQxqRi6/";
        let model, labelContainer, maxPredictions;
        let i1 = document.getElementById("loading");
        // 토글로 남자인지 여자인지 체크하는 부분
        let checkBox = document.getElementById("gender");
        // Load the image model and setup the webcam
        async function init() {
            i1.style.visibility = "visible"
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";
            // load the model and metadata
            // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
            // or files from your local hard drive
            // Note: the pose library adds "tmImage" object to your window (window.tmImage)
            model = await
                tmImage.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();
            // Convenience function to setup a webcam
            const flip = true; // whether to flip the webcam
            // append elements to the DOM
            labelContainer = document.getElementById("label-container");
            for (let i = 0; i < maxPredictions; i++) { // and class labels
                labelContainer.appendChild(document.createElement("div"));
            }
            /* 사진이 올라가고 초기화 중에는 일단 로딩표시가 돌게 함 */
        }
        // run the webcam image through the image model
        async function predict() {
            /* $('#loading').attr("style", "visibility:hidden"); */
            i1.style.visibility = "hidden";
            $("#recommand").attr("style", "visibility:visible")
            $('body').attr("style", "overflow:auto");
           
            // predict can take in an image, video or canvas html element
            var image = document.getElementById("face-image");
            const prediction = await model.predict(image, false);
            prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability))
            let typebox = document.getElementById("result");
            let max = 0;
            let type;
            for (let i = 0; i < maxPredictions; i++) {
                let gage = prediction[i].probability.toFixed(2) * 100;
                let classPrediction = prediction[i].className + ": " + gage.toFixed();
                type = prediction[i].className
                if (max <= gage) {
                    $('input[name=result]').attr('value', type)
                }
                labelContainer.childNodes[i].innerHTML = classPrediction;
                $('#label-container > div:nth-child(' + i + ')').attr('class', 'item' + i)
                $('#label-container > div:nth-child(' + i + ')').attr('width', 100)
				 
            }
            
            $('#recommandCloth').attr("href", "shop.jsp?clothType="+prediction[0].className+"&gender=남")
        }
        
        function removePredict(){
        	let parent = document.getElementById('label-container');
        	i1.style.visibility = "hidden"
        	while(parent.hasChildNodes){
        		parent.removeChild(parent.firstChild);
        	}
        	
        		}
    	
        

     
       
    </script>
    


</body>
</html>