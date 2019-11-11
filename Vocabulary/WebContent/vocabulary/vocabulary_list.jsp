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

	<link rel="stylesheet" href="vocabulary.css" type="text/css" media="screen" />

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


<body>
	<div align=center>
	<H2>단어장 조회</H2>
	<HR>
	<a href="vocabulary_control.jsp?action=add">단어장 등록</a><BR>
	
	<!-- 단어 목록 조회폼 -->
	<form name="form1" method="post" action="vocabulary_control.jsp">
		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
		<table border=1>
			<tr>
				<td align=left>
				<a href="vocaword.exe">단어 테스트<br> 프로그램 다운</a>
				</td>
				<td colspan=3 align=right width="200">
    				<input type="button" value="조회" onClick="retrivalcheck()">
				</td>
			</tr>
			<tr>
				<th>ID</th>
				<th>단어</th>
				<th>단어설명</th>
			</tr>
			<%
				if(vocabularyList != null) {
					
						for(VocabularyDTO vocabularyDTO : (ArrayList<VocabularyDTO>) vocabularyList) {
			%>
						<tr>
							<td><a href="javascript:editcheck(<%=vocabularyDTO.getId() %>)"><%=vocabularyDTO.getId() %></a></td>
							<td><%=vocabularyDTO.getWord() %></td>
							<td><%=vocabularyDTO.getDescription() %></td>
						</tr>
			<%	
					}
				}
			%>
			</table>
		</form>
	</div>
</body>

</html>