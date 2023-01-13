<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    body {
      font-size: 0.9em;
    }
  </style>
  <script>
    function logoutCheck() {
    	parent.location.href = "${ctp}/member/memberLogout";
    }
  </script>
</head>
<body style="background-color:#ddd">
<br/>
<div class="container text-center">
  <h4><a href="${ctp}/admin/adminContent" target="adminContent" class="btn btn-primary btn-sm">관리자메뉴</a></h4>
  <hr/>
  <div class="panel-group text-center table-hover" id="accordion">
    <div class="panel panel-default bg-light mb-1">
      <div class="panel-heading bg-secondary text-white pt-1 pb-1">
        <div class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">케뮤니케이션</a>
        </div>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body pt-2"><a href="#">방명록리스트</a></div>
        <div class="panel-body pt-2"><a href="${ctp}/admin/board/adminBoardList" target="adminContent">게시판</a></div>
        <div class="panel-body pt-2"><a href="${ctp}/" target="adminContent">자료실</a></div>
      </div>
    </div>
    <div class="panel panel-default bg-light mb-1">
      <div class="panel-heading bg-secondary text-white pt-1 pb-1">
        <div class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">상품관리</a>
        </div>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">상품분류등록</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">상품등록관리</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">상품등록조회</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">옵션등록관리</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">주문관리</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">1:1문의</a></div>
      </div>
    </div>
    <div class="panel panel-default bg-light">
      <div class="panel-heading bg-secondary text-white pt-1 pb-1">
        <div class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">기타관리</a>
        </div>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/admin/member/adminMemberList" target="adminContent">회원리스트</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">공지사항관리</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/" target="adminContent">사이트분석</a></div>
        <div class="panel-body pt-2 pb-2"><a href="${ctp}/admin/imsiFileDelete" target="adContent">임시파일관리</a></div>
      </div>
    </div>
  </div>
  <hr/>
  <div class="bg-danger mb-1"><a href="javascript:logoutCheck()" class="btn btn-danger btn-sm">로그아웃</a></div>
  <div class="bg-success"><a href="${ctp}/" target="_top" class="btn btn-success btn-sm"> 홈 으 로 </a></div>
  <hr/>
  <h5><a href="${ctp}/admin/adminContent" target="adminContent" class="btn btn-primary btn-sm">관리자메뉴</a></h5>
  <hr/>
</div>
</body>
</html>