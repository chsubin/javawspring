<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest3</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	
  	function idCheck(){
  		let mid = myform.mid.value;
  		if(mid.trim()==""){
  			alert("아이디를 입력하세요!");
  			myform.mid.focus();
  			return false;
  		}
  		$.ajax({
  			type : "post",
  			url : "${ctp}/study/ajax/ajaxTest3_1",
  			data : {mid:mid},
  			success: function(vo){
  				let str ='<b>전송결과</b><hr/>';
  				if(vo!=''){
  					str+= '성명 : '+vo.name+'<br/>';
  					str+= '이메일 : '+vo.email+'<br/>';
  					str+= '홈페이지 : '+vo.homePage+'<br/>';
  					str+= '방문IP : '+vo.hostIp+'<br/>';
  				}
  				else{
 						str+= '<font color="red">찾는자료가 없습니다.</font>' 					
  				}
  				$('#demo').html(str);
  			//	alert("vo : "+vo);
  			},
  			error:function(vo){
  				alert("전송오류!");
  			}
  		});
  	}
  	function nameCheck(){
  		let mid = myform.mid.value;
  		if(mid.trim()==""){
  			alert("아이디를 입력하세요!");
  			myform.mid.focus();
  			return false;
  		}
  		$.ajax({
  			type : "post",
  			url : "${ctp}/study/ajax/ajaxTest3_2",
  			data : {mid:mid},
  			success: function(vos){
  				let str ='<b>전송결과</b><hr/>';
  				if(vos!=''){
  					str += '찾는자료가 있습니다.'
  					str +='<table class="table table-hover"';
  					str +='<tr class="table-dark text-dark">';
  					str +='<th>성명</th><th>이메일</th><th>홈페이지</th><th>방문IP</th>'
  					str +='</tr>'
  					for(let i=0;i<vos.length;i++){
  						str +='<tr class="text-center">';
	  					str+= '<td>'+vos[i].name+'</td>';
	  					str+= '<td>'+vos[i].email+'</td>';
	  					str+= '<td>'+vos[i].homePage+'</td>';
	  					str+= '<td>'+vos[i].hostIp+'</td>';
  						str +='</tr>';
  					}
						str +='</table>';
  				}
  				else{
 						str+= '<font color="red">찾는자료가 없습니다.</font>' 					
  				}
  				$('#demo').html(str);
  			//	alert("vo : "+vo);
  			},
  			error:function(vo){
  				alert("전송오류!");
  			}
  		});
  	}
  	function fSearch(){
  		let search = myform.search.value;
  		let searchfield = myform.searchfield.value;
  		if(search.trim()==""){
  			alert("아이디를 입력하세요!");
  			myform.search.focus();
  			return false;
  		}
  		$.ajax({
  			type : "post",
  			url : "${ctp}/study/ajax/ajaxTest3_3",
  			data : {search:search,
  							searchfield:searchfield},
  			success: function(vos){
  				let str ='<b>전송결과</b><hr/>';
  				if(vos!=''){
  					str += '찾는자료가 있습니다.'
  					str +='<table class="table table-hover"';
  					str +='<tr class="table-dark text-dark">';
  					str +='<th>성명</th><th>이메일</th><th>홈페이지</th><th>방문IP</th>'
  					str +='</tr>'
  					for(let i=0;i<vos.length;i++){
  						str +='<tr class="text-center">';
	  					str+= '<td>'+vos[i].name+'</td>';
	  					str+= '<td>'+vos[i].email+'</td>';
	  					str+= '<td>'+vos[i].homePage+'</td>';
	  					str+= '<td>'+vos[i].hostIp+'</td>';
  						str +='</tr>';
  					}
						str +='</table>';
  				}
  				else{
 						str+= '<font color="red">찾는자료가 없습니다.</font>' 					
  				}
  				$('#demo').html(str);
  			//	alert("vo : "+vo);
  			},
  			error:function(vo){
  				alert("전송오류!");
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
  <h2>aJax를 활용한 '방명록 성명' 검색하기</h2>
  <hr/>
  <form name="myform">
  	<p>성명 : 
  		<input type="text" name="mid" autofocus />&nbsp;
  		<input type="button" value="성명일치검색" onclick="idCheck()" class="btn btn-success"/>&nbsp;
  		<input type="button" value="성명부분일치검색" onclick="nameCheck()" class="btn btn-success"/>&nbsp;
  		<input type="reset" value="다시입력" class="btn btn-secondary"/>&nbsp;
  		<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/ajax/ajaxMenu';" class="btn btn-warning"/>&nbsp;
  	</p>
  	<p>
			<select name="searchfield">
				<option value="name">이름</option>
				<option value="email">이메일</option>
				<option value="homePage">홈페이지</option>
				<option value="content">본문</option>
			</select> 
  		<input type="text" name="search" autofocus />&nbsp;
  		<input type="button" value="조건검색" onclick="fSearch()" class="btn btn-success"/>&nbsp;
  	</p>
  </form>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>