<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberPwdUpdate.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
   <script>
  	'use strict';
    function fCheck() {
    	let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}$/;
    	
    	let oldPwd = document.getElementById("oldPwd").value;
    	let newPwd = document.getElementById("newPwd").value;
    	let rePwd = document.getElementById("rePwd").value;
    	
    	if(oldPwd.trim() == "") {
    		alert("기존 비밀번호를 입력하세요");
    		document.getElementById("oldPwd").focus();
    	}
    	else if(newPwd.trim() == "") {
    		alert("새 비밀번호를 입력하세요");
    		document.getElementById("newPwd").focus();
    	}
    	else if(rePwd.trim() == "") {
    		alert("새 비밀번호를 한번더 입력하세요");
    		document.getElementById("rePwd").focus();
    	}
    	else if(!regPwd.test(newPwd)) {
        alert("비밀번호는 6~20 자리로 작성해주세요.");
        myform.newPwd.focus();
      }
    	else if(newPwd != rePwd) {
    		alert("새 비밀번호와 동일한 비밀번호를 입력해 주세요.");
        myform.rePwd.focus();
    	}
    	else if(newPwd == oldPwd) {
    		alert("기존비밀번호와 새 비밀번호가 동일합니다.");
        myform.newPwd.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
   <form name="myform" method="post"  class="was-validated">
  <h2 class="text-center">비밀번호 변경</h2>
  <br/>
  <table class="table table-bordered">
    <tr>
      <th>기존 비밀번호</th>
      <td>
        <input type="password" name="oldPwd" id="oldPwd" autofocus required class="form-control"/>
        <div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
      </td>
    </tr>
    <tr>
      <th>새 비밀번호</th>
      <td>
        <input type="password" name="newPwd" id="newPwd" required class="form-control"/>
        <div class="invalid-feedback">새 비밀번호를 입력하세요.</div>
      </td>
    </tr>
    <tr>
      <th>비밀번호 확인</th>
      <td>
        <input type="password" name="rePwd" id="rePwd" required class="form-control"/>
        <div class="invalid-feedback">새 비밀번호를 한번더 입력하세요.</div>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type="button" value="비밀번호변경" onclick="fCheck()" class="btn btn-success"/> &nbsp;
        <input type="reset" value="다시입력" class="btn btn-success"/> &nbsp;
        <input type="button" value="돌아가기" onclick="location.href='${ctp}/member/memberMain';" class="btn btn-success"/>
      </td>
    </tr>
  </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>