<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guestList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <style>
    th {
      text-align: center;
      background-color: #ccc;
    }
  </style>
  <script>
    'use strict';
    function delCheck(idx) {
    	let ans = confirm("정말로 삭제하시겠습니까?");
    	if(ans) location.href="${ctp}/guest/guestDelete.gu?idx="+idx;
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  

  <h2 class="text-center">방 명 록 리 스 트</h2>
  <br/>
  <table class="table table-borderless mb-0">
		<tr>
		  <td>
		    <c:if test="${sAMid == 'admin'}"><a href="${ctp}/member/adminLogout" class="btn btn-sm btn-secondary">관리자 로그아웃</a></c:if>
		  </td>
		  <td style="text-align:right;"><a href="${ctp}/guest/guestInput.gu" class="btn btn-sm btn-secondary">글쓰기</a></td>
		</tr>
  </table>
  <table class="table table-borderless m-0 p-0">
		<tr>
		  <td class="text-right">
		    <!-- 첫페이지 / 이전페이지 / (현페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
		    <c:if test="${pageVO.pag > 1}">
		      [<a href="${ctp}/guest/guestList?pag=1">첫페이지</a>]
		      [<a href="${ctp}/guest/guestList?pag=${pageVO.pag-1}">이전페이지</a>]
		    </c:if>
		    ${pageVO.pag}/${pageVO.totPage}
		    <c:if test="${pageVO.pag < pageVO.totPage}">
		      [<a href="${ctp}/guest/guestList?pag=${pageVO.pag+1}">다음페이지</a>]
		      [<a href="${ctp}/guest/guestList?pag=${pageVO.totPage}">마지막페이지</a>]
		    </c:if>
		  </td>
		</tr>
  </table>
  <c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table table-borderless mb-0">
			<tr>
			  <td>방문번호 : ${curScrStartNo}
			    <c:if test="${sAMid == 'admin'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-danger">삭제</a></c:if>
			  </td>
			  <td style="text-align:right;">방문IP : ${vo.hostIp}</td>
			</tr>
	  </table>
	  <table class="table table-bordered">
			<tr>
			  <th style="width:20%;">성명</th>
			  <td style="width:25%;">${vo.name}</td>
			  <th style="width:20%;">방문일자</th>
			  <td style="width:35%;">${fn:substring(vo.visitDate,0,19)}</td>
			</tr>
			<tr>
			  <th>전자우편</th>
			  <td colspan="3">
			    <c:if test="${empty vo.email || fn:length(vo.email)<=4 || fn:indexOf(vo.email,'@')==-1 || fn:indexOf(vo.email,'.')==-1}">- 없음 -</c:if>
			    <c:if test="${!empty vo.email && fn:length(vo.email)>4 && fn:indexOf(vo.email,'@')!=-1 && fn:indexOf(vo.email,'.')!=-1}">${vo.email}</c:if>
			  </td>
			</tr>
			<tr>
			  <th>홈페이지</th>
			  <td colspan="3">
			    <c:if test="${fn:length(vo.homePage) <= 8}">- 없음 -</c:if>
			    <c:if test="${fn:length(vo.homePage) > 8}"><a href="${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
			  </td>
			</tr>
			<tr>
			  <th>방문소감</th>
			  <td colspan="3">${fn:replace(vo.content, newLine, '<br/>')}</td>
			</tr>
	  </table>
	  <br/>
	  <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	</c:forEach>
	<br/>
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3(6) / 다음블록 / 마지막페이지 -->
  <div class="text-center">
    <ul class="pagination justify-content-center">
	    <c:if test="${pageVO.pag > 1}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/guest/guestList?pag=1">첫페이지</a></li>
	    </c:if>
	    <c:if test="${pageVO.curBlock > 0}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/guest/guestList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}">이전블록</a></li>
	    </c:if>
	    <c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize + 1}" end="${(pageVO.curBlock)*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
	      <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/guest/guestList?pag=${i}">${i}</a></li>
	    	</c:if>
	      <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/guest/guestList?pag=${i}">${i}</a></li>
	    	</c:if>
	    </c:forEach>
	    <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/guest/guestList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}">다음블록</a></li>
	    </c:if>
	    <c:if test="${pageVO.pag < pageVO.totPage}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/guest/guestList?pag=${pageVO.totPage}">마지막페이지</a></li>
	    </c:if>
    </ul>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>