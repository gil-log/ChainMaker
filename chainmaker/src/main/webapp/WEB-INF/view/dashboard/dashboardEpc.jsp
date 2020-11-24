<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 슬라이드 쇼 slick 라이브러리 -->
<script src="${CTX_PATH}/js/slick/slick.js"></script>
<script src="${CTX_PATH}/js/slick/slick.min.js"></script>
<script src="${CTX_PATH}/js/slick/slick.css"></script>
<script src="${CTX_PATH}/js/slick/slick-theme.css"></script>

<script src="${CTX_PATH}/js/view/dashboard/epc/dashboardEpc.js"></script>

<!-- font awesome css -->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/js/statistics/css/font-awesome.min.css">


<style>
/*post slider*/
.post-slider{
  width:70%;
  margin:0px auto;
  position:relative;
}
.post-slider .silder-title{
  text-align:center;
  margin:30px auto;
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}
.post-slider .post-wrapper{

  width:84%;
  height:350px;
  margin:0px auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:300px;
  margin:0px 10px;
  display:inline-block;
  background:white;
  border-radius: 5px;
}
.post-slider .post-wrapper .post .post-info{
  font-size:15px;
  height:30%;
  padding-left:10px;
}
.post-slider .post-wrapper .post .slider-image{
  width:100%;
  height:175px;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
}
</style>

</head>
<body>

    <div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">Trending Posts</h1>
        <i class="fas fa-chevron-left prev"></i>
        <i class="fas fa-chevron-right next"></i>
        <div class="post-wrapper">
          <div class="post">
            <img src="img/paris.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#" class="post-subject">Lorem ipsu eiusmod tempor incididunt ut </a></h4>
              <i class="far fa-user" style="height:10%;">Awa Melvine</i>
            </div>
          </div>
          <div class="post">
            <img src="img/architecture.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#"> Commodo odio aenean sed  </a></h4>
              <i class="far fa-user" style="height:10%;">Awa Melvine</i>
            </div>
          </div>
          <div class="post">
            <img src="img/paris.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">Quis hendrerit dolor magna eget est lorem ipsum dolor sit. </a></h4>
              <i class="far fa-user" style="height:10%;">Awa Melvine</i>
            </div>
          </div>
          <div class="post">
            <img src="img/gyungju.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">Elit at imperdiet dui accumsan sit.</a></h4>
              <i class="far fa-user" style="height:10%;">Awa Melvine</i>
            </div>
          </div>
        </div>
      </div>
      <!--post slider-->
    </div>


</body>
</html>