<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminContent.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h5>관리자 홈 화면</h5>
  <hr/>
  <p>
    신규 가입자 : <c:if test="${memberCnt>0}"><span class="badge badge-danger">N</span></c:if> ${memberCnt}건
  </p>
  <hr/>
  <p>
    새로운 글 : <c:if test="${boardCnt>0}"><span class="badge badge-danger">N</span></c:if> ${boardCnt}건
  </p>
  
</div>
<p><br/></p>
</body>
</html>