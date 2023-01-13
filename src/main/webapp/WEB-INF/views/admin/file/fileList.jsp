<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fileList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script>
	  // 전체선택
	  $(function(){
	  	$("#checkAll").click(function(){
	  		if($("#checkAll").prop("checked")) {
		    		$(".chk").prop("checked", true);
	  		}
	  		else {
		    		$(".chk").prop("checked", false);
	  		}
	  	});
	  });
	  
	  // 선택항목 반전
	  $(function(){
	  	$("#reversekAll").click(function(){
	  		$(".chk").prop("checked", function(){
	  			return !$(this).prop("checked");
	  		});
	  	});
	  });
	  
	  // 선택항목 삭제하기(ajax처리하기)
	  function selectDelCheck() {
	  	let ans = confirm("선택된 모든 게시물을 삭제 하시겠습니까?");
	  	if(!ans) return false;
	  	let delItems = "";
	  	for(let i=0; i<myform.chk.length; i++) {
	  		if(myform.chk[i].checked == true) delItems += myform.chk[i].value + "/";
	  	}
			
	  	$.ajax({
	  		type : "post",
	  		url  : "${ctp}/admin/fileSelectDelete",
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
<div class="container">
  <h2>서버 파일 리스트</h2>
  <hr/>
  <p>서버의 파일 경로 : ${ctp}/data/ckeditor/~~~파일명</p>
  <hr/>
  <form name="myform">
	  <table class="table table-hover text-center">
	    <tr>
	      <td colspan="4">
	        <input type="checkbox" id="checkAll" onclick="checkAllCheck()"/>전체선택/해제 &nbsp;&nbsp;
	        <input type="checkbox" id="reversekAll" onclick="reverseAllCheck()"/>선택반전 &nbsp;&nbsp;
	        <input type="button" value="선택항목삭제" onclick="selectDelCheck()" class="btn btn-danger btn-sm"/>
	      </td>
	    </tr>
	    <tr class="table-dark text-dark">
	      <th>선택</th><th>번호</th><th>파일명</th><th>그림파일</th>
	    </tr>
		  <c:forEach var="file" items="${files}" varStatus="st">
		    <tr>
		      <td>
		        <c:if test="${file != 'board'}">
		        	<input type="checkbox" name="chk" class="chk" value="${file}"/>
		        </c:if>
		      </td>
		      <td>${st.count}</td>
		      <td>${file}</td>
		      <td>
		        <c:if test="${file == 'board'}">폴더명입니다.</c:if>
		        <c:if test="${file != 'board'}">
		        	<img src="${ctp}/data/ckeditor/${file}" width="150px"/>
		        </c:if>
		      </td>
		    </tr>
		  </c:forEach>
		  <tr><td colspan="4" class="m-0 p-0"></td></tr>
	  </table>
  </form>
</div>
<p><br/></p>
</body>
</html>