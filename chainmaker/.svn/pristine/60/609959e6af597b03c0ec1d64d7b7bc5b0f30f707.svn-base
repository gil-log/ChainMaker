<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js" integrity="sha512-1YmX2ng5WyKIHh65dx6gy3pON533WtqyggGzPegPdZCcjkk6wucXQKYGF2YFBhKLYBEG2Ye436ZYh1EEs0zZsA==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js" integrity="sha512-98e5nQTE7pmtZ3xoD5GCVKafmziXDT5WINC91MugFzF57zzBnmvGQl1N70cvdyBSWxjCOC55gq9Zn76MUgtEMQ==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" integrity="sha512-wXEyXmtKft9mEiu8LTc3+3BQ95aYbvxgvzH4IzFHOwvGlA14B6zREXD4CRmUPx8r2Z1RVUOXS47bwjsotSlZkQ==" crossorigin="anonymous" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->
	<form method="post">
	  <textarea id="summernote" name="editordata"></textarea>
	  <input type="submit">
	</form>
	
	
	
	
	<!-- div에 에디터를 사용하는 경우 -->
	<div id="summernote">Hello Summernote</div>
	
	
	<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
	
	</script>
</body>
</html>