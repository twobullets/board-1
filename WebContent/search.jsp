<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String lef = request.getParameter("key");

if(lef == null)
{
	lef="";
}
%>
	<form id="form" name = "form" method ="get" action="search.jsp">
	�˻� : <input type ="text" id="key" name="key" value=<%=lef %>>
		<input type ="submit">		
	</form>
</body>
</html>