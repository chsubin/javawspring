<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    function midSearch() {
      let mid = myform.mid.value;
      if(mid.trim() == "") {
    	  alert("아이디를 입력하세요!");
    	  myform.mid.focus();
      }
      else {
    	  myform.submit();
      }
    }
    
    // 회원정보 상세보기
    function memberView(mid,nickName,name,gender,birthday,tel,address,email,homePage,job,hobby,photo,content,userInfor,userDel,point,strLevel,visitCnt,startDate,lastDate,todayCnt) {
    	let telArr = tel.split('-');
    	if(telArr[1].trim()=="" || telArr[2].trim()=="") tel = "없음";
    	address = address.replace(/\//g, ' ');
    	$("#myModal").on("show.bs.modal", function(e){
    		$(".modal-header #mid").html(mid);
    		$(".modal-body #name").html(name);
    		$(".modal-body #nickName").html(nickName);
    		$(".modal-body #gender").html(gender);
    		$(".modal-body #birthday").html(birthday);
    		$(".modal-body #tel").html(tel);
    		$(".modal-body #email").html(email);
    		$(".modal-body #address").html(address);
    		$(".modal-body #homePage").html("<a href='"+homePage+"' target='_blank'>"+homePage+"</a>");
    		$(".modal-body #job").html(job);
    		$(".modal-body #hobby").html(hobby);
    		$(".modal-body #userInfor").html(userInfor);
    		$(".modal-body #content").html(content);
    		$(".modal-body #userDel").html(userDel);
    		$(".modal-body #point").html(point);
    		$(".modal-body #todayCnt").html(todayCnt);
    		$(".modal-body #visitCnt").html(visitCnt);
    		$(".modal-body #startDate").html(startDate);
    		$(".modal-body #lastDate").html(lastDate);
    		$(".modal-body #photo").html("<img src=${ctp}/member/"+photo+" width='150px' />");
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">
    <c:if test="${empty mid}">전체 회원 리스트</c:if>
    <c:if test="${!empty mid}"><font color='blue'><b>${mid}</b></font> 회원 리스트(총<font color='red'>${pageVo.totRecCnt}</font>건)</c:if>
  </h2>
  <br/>
  <form name="myform">
  	<div class="row mb-2">
  	  <div class="col form-inline">
  	    <input type="text" name="mid" class="form-control" autofocus />&nbsp;
  	    <input type="button" value="아이디개별검색" onclick="midSearch();" class="btn btn-secondary" />
  	  </div>
  	  <div class="col text-right"><button type="button" onclick="location.href='${ctp}/member/memberList';" class="btn btn-secondary">전체검색</button></div>
  	</div>
  </form>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>별명</th>
      <th>성명</th>
      <th>성별</th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVo.curScrStartNo}"/>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${curScrStartNo}</td>
        <c:if test="${vo.level == 0}"><c:set var="strLevel" value="관리자"/></c:if>
        <c:if test="${vo.level == 1}"><c:set var="strLevel" value="운영자"/></c:if>
        <c:if test="${vo.level == 2}"><c:set var="strLevel" value="우수회원"/></c:if>
        <c:if test="${vo.level == 3}"><c:set var="strLevel" value="정회원"/></c:if>
        <c:if test="${vo.level == 4}"><c:set var="strLevel" value="준회원"/></c:if>
        <td><a href="#" onclick="memberView('${vo.mid}','${vo.nickName}','${vo.name}','${vo.gender}','${fn:substring(vo.birthday,0,10)}','${vo.tel}','${vo.address}','${vo.email}','${vo.homePage}','${vo.job}','${vo.hobby}','${vo.photo}','${vo.content}','${vo.userInfor}','${vo.userDel}','${vo.point}','${strLevel}','${vo.visitCnt}','${fn:substring(vo.startDate,0,10)}','${fn:substring(vo.lastDate,0,10)}','${vo.todayCnt}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td>
        <td>${vo.nickName}</td>
        <td>${vo.name}<c:if test="${sLevel == 0 && vo.userInfor == '비공개'}"><font color='red'>(비공개)</font></c:if></td>
        <td>${vo.gender}</td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
    </c:forEach>
    <tr><td colspan="5" class="m-0 p-0"></td></tr>
  </table>
</div>
<br/>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVo.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVo.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVo.pag < pageVo.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/member/memberList?mid=${mid}&pag=${pageVo.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->

<!-- The Modal('회원 아이디' 클릭시 회원의 상세정보를 모달창에 출력한다. -->
<div class="modal fade" id="myModal" style="width:690px;">
  <div class="modal-dialog">
    <div class="modal-content" style="width:600px;">
    
      <!-- Modal Header -->
      <div class="modal-header" style="width:600px;">
        <h4 class="modal-title">☆ 회원 상세정보 ☆(아이디:<span id="mid"></span>)</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body" style="width:600px;height:400px;overflow:auto;">
        <table class="table table-bordered" style="font-size:10pt">
          <tr>
          	<th>성명</th><td id="name"></td><th>닉네임</th><td id="nickName"></td>
          </tr>
          <tr>
          	<th>성별</th><td id="gender"></td><th>생일</th><td id="birthday"></td>
	        </tr>
          <tr>
          	<th>전화번호</th><td id="tel"></td><th>전자우편</th><td id="email"></td>
	        </tr>
          <tr>
          	<th>주소</th><td colspan="3" id="address"></td>
	        </tr>
          <tr>
          	<th>홈페이지</th><td id="homePage"></td><th>직업</th><td id="job"></td>
	        </tr>
          <tr>
          	<th>취미</th><td id="hobby"></td><th>정보공개여부</th><td id="userInfor"></td>
	        </tr>
          <tr>
          	<th>자기소개</th><td colspan="3" id="content"></td>
	        </tr>
          <tr>
          	<th>탈퇴여부</th><td id="userDel"></td><th>포인트</th><td id="point"></td>
	        </tr>
          <tr>
          	<th>오늘방문횟수</th><td id="todayCnt"></td><th>총 방문횟수</th><td id="visitCnt"></td>
	        </tr>
          <tr>
          	<th>최초가입일</th><td id="startDate"></td><th>최종방문일</th><td id="lastDate"></td>
	        </tr>
	        <tr>
          	<th>회원사진</th><td colspan="3" id="photo"></td>
	        </tr>
        </table>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer" style="width:600px;">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>