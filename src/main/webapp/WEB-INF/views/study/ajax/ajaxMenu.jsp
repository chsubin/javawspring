<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxMenu.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function aJaxTest1_1(idx){
  		$.ajax({
  			type:"post",
  			url : "${ctp}/study/ajax/ajaxTest1_1",
  			data :{idx:idx},
  			success: function(res){
  				$("#demo").html(res);
  			},
  			error : function(){
  				alert("전송오류!!!");
  			}
  		});
  	}
  	function aJaxTest1_2(idx){
  		$.ajax({
  			type:"post",
  			url : "${ctp}/study/ajax/ajaxTest1_2",
  			data :{idx:idx},
  			success: function(res){
  				$("#demo").html(res);
  			},
  			error : function(){
  				alert("전송오류!!!");
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
  <h2>Ajax 연습</h2>
  <hr/>
  <p>기본(String) :
  	<a href="javascript:aJaxTest1_1(10)" class="btn btn-secondary">값전달1</a>&nbsp;
  	<a href="javascript:aJaxTest1_2(10)" class="btn btn-secondary">값전달2</a>&nbsp;
  	: <span id="demo"></span>
  </p>
  <p>응용1(배열) :
  	<a href="${ctp}/study/ajax/ajaxTest2_1" class="btn btn-secondary">시(도)/구(시,군,동)(String 배열)</a>&nbsp;
  	<a href="${ctp}/study/ajax/ajaxTest2_2" class="btn btn-secondary">시(도)/구(시,군,동)(ArrayList)</a>&nbsp;
  	<a href="${ctp}/study/ajax/ajaxTest2_3" class="btn btn-secondary">시(도)/구(시,군,동)(Map(HashMap))</a>&nbsp;
  	: <span id="demo"></span>
  </p>
  <p>응용2(DB) :
  	<a href="${ctp}/study/ajax/ajaxTest3" class="btn btn-secondary">회원아이디검색(DB활용)</a>&nbsp;
  </p>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>