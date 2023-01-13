<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/admin/board/adminBoardList?pageSize="+pageSize+"&pag=${pag}";
    }
    
    function searchCheck() {
    	let searchString = $("#searchString").val();
    	
    	if(searchString.trim() == "") {
	    	let pageSize = document.getElementById("pageSize").value;
	    	location.href = "${ctp}/admin/board/adminBoardList?pageSize="+pageSize+"&pag=${pag}";
    	}
    	else {
    		searchForm.submit();
    	}
    }
    
    function selectAll(){
    	if(document.getElementById("selectA").checked){
    		$(".chk").prop("checked", true);
    	}
    	else {
    		$(".chk").prop("checked", false);
    	}
    }
    function selectReverse(){
  		$(".chk").prop("checked", function(){
  			return !$(this).prop("checked");
  		});
    }
    
	  // 선택항목 삭제하기(ajax처리하기)
	  function selectDelCheck() {
	  	let ans = confirm("선택된 모든 게시물을 삭제 하시겠습니까?");
	  	if(!ans) return false;
	  	let delItems = "";
	  	for(let i=0; i<myform.chk.length; i++) {
	  		if(myform.chk[i].checked) delItems += myform.chk[i].value + "/";
	  	}
	  	alert(delItems);
			
	  	$.ajax({
	  		type : "post",
	  		url  : "${ctp}/admin/board/adminBoardDelete",
	  		data : {delItems : delItems},
	  		success:function(res) {
	  			if(res == "1") {
	  				alert("선택된 파일을 삭제처리 하였습니다.");
	  			  location.reload();
	  			}
	  		},
	  		error  :function() {
	  			alert("전송오류!!");
	  		}
	  	});
	  }
  </script>
</head>
<body>
<p><br/></p>
<div class="container-fluid">
	<form name="myform">
	  <h2 class="text-center">게 시 판 리 스 트</h2>
	  <br/>
	  <table class="table table-borderless">
	    <tr>
	      <td class="text-left p-0">
	        <input type="button" class="btn btn-danger" value="삭제" onclick="selectDelCheck()">&nbsp;&nbsp;
	        <input type="checkbox" name="selectA" id="selectA" onclick="selectAll()">전체 선택 &nbsp;
	        <input type="checkbox" name="selectR" id="selectR"  onclick="selectReverse()">선택 반전 &nbsp;
	      </td>
	      <td class="text-right p-0">
	        <select name="pageSize" id="pageSize" onchange="pageCheck()">
	          <option value="5"  ${pageVO.pageSize==5  ? 'selected' : ''}>5건</option>
	          <option value="10" ${pageVO.pageSize==10 ? 'selected' : ''}>10건</option>
	          <option value="15" ${pageVO.pageSize==15 ? 'selected' : ''}>15건</option>
	          <option value="20" ${pageVO.pageSize==20 ? 'selected' : ''}>20건</option>
	        </select>
	      </td>
	    </tr>
	  </table>
	  <table class="table table-hover text-center">
	    <tr class="table-dark text-dark">
	      <th width="5%">선택</th>
	      <th>글번호</th>
	      <th>글제목</th>
	      <th>글쓴이</th>
	      <th>글쓴날짜</th>
	      <th>조회수</th>
	      <th>좋아요</th>
	    </tr>
	    <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}">
	    	<tr>
	    		<td><input type="checkbox" name="chk" id="deleteBox${vo.idx}" class="chk" value="${vo.idx}"></td>
	    	  <td>${curScrStartNo}</td>
	    	  <td class="text-left">
	    	    <a href="${ctp}/board/boardContent?idx=${vo.idx}&pageSize=${pageVO.pageSize}&pag=${pageVO.pag}">${vo.title}</a>
	    	    <c:if test="${vo.replyCount != 0}">(${vo.replyCount})</c:if>
	    	    <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
	    	  </td>
	    	  <td>${vo.nickName}</td>
	    	  <td>
	    	    <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.WDate,0,10)}</c:if>
	    	    <c:if test="${vo.hour_diff < 24}">
	    	      ${vo.day_diff > 0 ? fn:substring(vo.WDate,0,16) : fn:substring(vo.WDate,11,19)}
	    	    </c:if>
	    	  </td>
	    	  <td>${vo.readNum}</td>
	    	  <td>${vo.good}</td>
	    	</tr>
	    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
	    </c:forEach>
	    <tr><td colspan="6" class="m-0 p-0"></td></tr>
	  </table>
  </form>
</div>

<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVO.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVO.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
      <c:if test="${i <=pageVO.totPage && i == pageVO.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVO.pag < pageVO.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/board/adminBoardList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
<br/>
<!-- 검색기 처리 시작  -->
<div class="container text-center">
  <form name="searchForm" method="post" action="${ctp}/board/boardSearch">
    <b>검색 : </b>
    <select name="search">
      <option value="title">글제목</option>
      <option value="nickName">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" id="searchString"/>
    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>
    <input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝  -->
<p><br/></p>
</body>
</html>