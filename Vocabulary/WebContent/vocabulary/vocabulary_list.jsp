<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page errorPage="vocabulary_error.jsp" %>

<!-- 자바 클래스 Import  -->
<%@ page import= "vocabulary.*" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>단어장 조회</title>

	<link rel="stylesheet" href="vocabulary.css" type="text/css" />
	<script type="text/javascript">
		function retrivalcheck() {
			
			// get방식
			// document.location.href="addr_control.jsp?action=list";
			
			// post방식 디펄트가 list
			document.form1.action.value="list";
			document.form1.submit();
	
			
		}
	
		function editcheck(id) {
		
			// get방식
			// document.location.href="addr_control.jsp?action=edit&id="+id;
			
			// post방식
			document.form1.action.value="edit";
			document.form1.id.value=id;
			document.form1.submit();
	
			
		}
	</script>

</head>
<!--  scope=request 내장객체 공유 -->
<jsp:useBean id="vocabularyList" scope="request" class="java.util.ArrayList" />

<!-- 기본 버튼 css -->
<style> 
input[type=button] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 15px 30px 16px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  text-align: center;
  vertical-align: middle;
  font-weight: bold;
}
</style>

<!-- 기본 버튼 css 끝-->

<body>
<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="vocabulary_mainpage.jsp"><img src="../images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>
	<div align=center>
	<H2>단어장 조회</H2>
	<HR>
	<!-- 단어 목록 조회폼 -->
	<form name="form1" method="post" action="vocabulary_control.jsp">
		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
			
				<div class="wrapper">
  <a href="vocaword.zip"><span>단어 테스트 프로그램 다운</span></a>
</div>
		<table border=1>
  		<div ontouchstart="">
  <div class="button2">
    <a href="vocabulary_control.jsp?action=add">단어장 등록</a>
  </div>
</div>
  <br>
			<tr>
				<td colspan=2 align=right width="200">
    				<input type="button" value="조회" onClick="retrivalcheck()">
				</td>
			</tr>
			<tr>
				<th>단어</th>
				<th>단어설명</th>
			</tr>
			<%
				if(vocabularyList != null) {
					
						for(VocabularyDTO vocabularyDTO : (ArrayList<VocabularyDTO>) vocabularyList) {
			%>
						<tr>
							<td><a href="javascript:editcheck(<%=vocabularyDTO.getId() %>)"><%=vocabularyDTO.getWord() %></a></td>
							<td><%=vocabularyDTO.getDescription() %></td>
						</tr>
			<%	
					}
				}
			%>
			</table>
		</form>
	</div>
	
	<!-- ========== 푸터 ========== -->

<div class="content">

</div>


<footer>


  <div class="container footer-container">

	<p class="footer-copyright">

		COPYRIGHT@WordBook INC. ALL RIGHTS RESERVED.

		</p>
		
</div>
</footer>


</body>

</html>