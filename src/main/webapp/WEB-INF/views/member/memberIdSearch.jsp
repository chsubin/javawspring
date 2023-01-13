<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberLogin.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	
  	function idSearch(){
  			let name = myform.name.value;
  			let email = myform.email.value;
  		
  		$.ajax({
  			type:"post",
  			url : "${ctp}/member/memberIdSearch",
  			data : {name:name,
  							email:email},
  			success : function(res){
  				if(res==""){
 						alert("일치하는 정보가 없습니다."); 					
  				}
  				else{
  					$("#demo").html("아이디는 <font color='blue'>"+res+"</font>입니다.<br/><br/><br/>");
  				}
  			},
  			error : function(){
  				alert("전송실패");
  			}			
  		});
  	}
  	
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="container" style="padding:30px">
			  <form name="myform" method="post" class="was-validated">
			    <h2>아이디 찾기</h2>
			    <p>회원 아이디를 찾습니다.</p>
			    <div class="form-group">
			      <label for="name">이름</label>
			      <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." required autofocus />
			      <div class="valid-feedback">입력성공!!</div>
			      <div class="invalid-feedback">이름은 필수 입력사항입니다.</div>
			    </div>
			    <div class="form-group">
			      <label for="email">이메일 </label>
			      <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를입력하세요." required />
			      <div class="invalid-feedback">이메일은 필수 입력사항입니다.</div>
			    </div>
			    <div id="demo"></div>
			    <div class="form-group">
				    <button type="button" class="btn btn-primary" onclick="idSearch()">아이디찾기</button>
				    <button type="reset" class="btn btn-primary">다시입력</button>
				    <button type="button" onclick="location.href='${ctp}/member/memberLogin';" class="btn btn-primary">돌아가기</button>
				    <button type="button" onclick="location.href='${ctp}/member/memberJoin';" class="btn btn-primary">회원가입</button>
			    </div>
			  </form>
		  </div>
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>