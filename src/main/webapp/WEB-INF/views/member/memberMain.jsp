<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2>회 원 전 용 방</h2>
  <hr/>
  <div id="memberInfo1" class="mr-5">
	  <p><font color="blue"><b>${sNickName}</b></font>님 로그인 중이십니다.</p>
	  <p>현재 <font color="blue"><b>${strLevel}</b></font> 등급 이십니다.</p>
	  <p>누적 포인트 : <span class="viewCheck">${vo.point}</span></p>
	  <p>최종 접속일 : <span class="viewCheck">${fn:substring(vo.lastDate,0,fn:length(vo.lastDate)-2)}</span></p>
	  <p>총 방문횟수 : <span class="viewCheck">${vo.visitCnt}</span></p>
	  <p>오늘 방문횟수 : <span class="viewCheck">${vo.todayCnt}</span></p>
  </div>
  <div id="memberInfo2">
    <h3>회원사진</h3>
	  <p><img src="${ctp}/member/${vo.photo}" width="200px" /></p>
  </div>
  <hr id="memberInfo3" />
  <h4>활동내역</h4>
  <p>방명록에 올린글수 : <span class="viewCheck">${guestCnt}</span></p>
  <p>게시판에 올린글수 : </p>
  <p>자료실에 올린글수 : </p>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>