<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="http://192.168.50.41:9090/javawspring" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Guest</a>
    <c:if test="${sLevel<=4}">
	    <a href="${ctp}/board/boardList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Board</a>
	    <a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">PDS</a>
	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">STUDY<i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${ctp}/study/password/sha256" class="w3-bar-item w3-button">암호화(SHA256)</a>
	        <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button">암호화연습(ARIA)</a>
	        <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button">암호화연습3</a>
	        <a href="${ctp}/study/ajax/ajaxMenu" class="w3-bar-item w3-button">AJax연습</a>
	        <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일연습</a>
	        <a href="${ctp}/study/uuid/uuidForm" class="w3-bar-item w3-button">UUID</a>
	        <a href="#" class="w3-bar-item w3-button">달력</a>
	      </div>
	    </div>
	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">STUDY2<i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="#" class="w3-bar-item w3-button">쿠폰(QR코드)</a>
	        <a href="#" class="w3-bar-item w3-button">카카오맵</a>
	        <a href="#" class="w3-bar-item w3-button">구글차트</a>
	        <a href="#" class="w3-bar-item w3-button">트랜잭션</a>
	        <a href="#" class="w3-bar-item w3-button">장바구니</a>
	      </div>
	    </div>
	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">${sNickName}<i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${ctp}/member/memberMain" class="w3-bar-item w3-button">회원메인화면</a>
	        <a href="#" class="w3-bar-item w3-button">웹메세지</a>
	        <a href="${ctp}/member/memberList" class="w3-bar-item w3-button">회원리스트</a>
	        <a href="#" class="w3-bar-item w3-button">정보수정</a>
	        <a href="${ctp}/member/memberDelete" class="w3-bar-item w3-button">회원탈퇴</a>
	        <a href="#" class="w3-bar-item w3-button">관리자메뉴</a>
	      </div>
	    </div>
	    </c:if>
    <c:if test="${empty sLevel}">
    	<a href="${ctp}/member/memberLogin"  class="w3-padding-large w3-button" >Login</a>
    	<a href="${ctp}/member/memberJoin"  class="w3-padding-large w3-button" >Join</a>
    </c:if> 
    <c:if test="${!empty sLevel}"><a href="${ctp}/member/memberLogout"  class="w3-padding-large w3-button" >Logout</a></c:if> 
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#band" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">BAND</a>
  <a href="#tour" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">TOUR</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
</div>