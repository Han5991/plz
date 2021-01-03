<%@page import="com.javamini.StoreDto"%>
<%@page import="com.javamini.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).on('keyup', '#textarea01', function(e) {
      var textarea01 = $(this).val();
      $('#cntSPAN').text(getBytes(textarea01));
   });
   
   function insertInfoConfirm(){
	   if(document.inputStore.storeId.value==""){
	         alert("매장 관리번호를 입력하세요")
	         inputStore.storeId.focus();
	         return;
	      }
      if(document.inputStore.storeName.value==""){
         alert("매장 이름을 입력하세요")
         inputStore.storeName.focus();
         return;
      }
      if(document.inputStore.storeAddress.value==""){
         alert("매장 주소를 입력하세요")
         inputStore.storeAddress.focus();
         return;
      }
      if(document.inputStore.storePhone.value==""){
         alert("전화번호를 입력하세요")
         inputStore.storePhone.focus();
         return;
      }
      document.inputStore.submit();
   }
</script>
<style>
@font-face {
   font-family: hzStyleFont;
   src: url("../font/Cafe24Ssurround.ttf");
}

* {
   font-family: hzStyleFont;
}

.navbar {
   margin-bottom: 0;
   border-radius: 0;
   border: none;
   background-color:#D9CDBC;
}

.jumbotron { /* 이 접근자로는 컨트롤 안 됨. */
   margin-bottom: 100px;
   background-color: blue;
}

.table {
   text-align: left;
   font-size: 20px;
   margin-bottom: 100px;
}

img {
   object-fit: cover
}
</style>
<script type="text/javascript">

</script>
<title>매장 정보 추가</title>
</head>
<body style="background: lightgray">
<nav class="navbar navbar-inverse">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target="#myNavbar">
               <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">매장 정보 추가</a>
         </div>
         <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
               <li><a href="#">About</a></li>
               <li><a href="#">Gallery</a></li>
               <li><a href="#">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
               <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
                     Login</a></li>
            </ul>
         </div>
      </div>
   </nav>
   
<div class="jumbotron" style="background-color: white;">
  <div class="container text-center">
      <div class="inputStore_form">
      <form action="inputStoreOk.jsp" method="post" name="inputStore">
         <h2 id="pageTit" class="pageName" style="text-align:center">매장정보 관리</h2>
           <table class="table">
           <thead style="font-size: 30px;">
                  <tr>
                     <td><h4>매장정보 추가</h4></td>
                  </tr>
            </thead>
            <tbody>
               <tr>
                  <td>
                     관리 번호 : <input type="text" name="storeId"size="50"><br>  
                     매장 이름 : <input type="text" name="storeName" size="50"><br>
                     매장 주소 : <input type="text" name="storeAddress" size="50"><br>
                     전화 번호 : <input type="text" name="storePhone"size="50"><br>
                  </td>
               </tr>
            </tbody>
            </table>   
            </form>
         </div>
         
      	<div class="btn_wrap">
      		<input type="button" value="추가" class="btn btn-warning" onclick="insertInfoConfirm()">&nbsp;&nbsp;&nbsp;
      		<input type="reset" value="취소" class="btn btn-warning" onclick="javascript:window.location='storeList.jsp'">
  		</div>
  </div>
</div>
</body>
</html>