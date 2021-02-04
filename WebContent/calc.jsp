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
String px = request.getParameter("x");
String py = request.getParameter("y");
String pc = request.getParameter("c");


int iz = 0;

try
{
int ix = Integer.parseInt("px");	
int iy = Integer.parseInt("py");

if(pc == "+")
{
	iz = ix + iy;
}
if(pc == "-")
{
	iz = ix - iy;
}
if(pc == "x")
{
	iz = ix * iy;
}
if(pc == "/")
{
	iz = ix / iy;
}

}
catch(Exception e)
{
	
}
%>
<h1>CALCULATOR</h1>
	<form id="form" name ="form" method ="get" action="calc.jsp">
	x값 : <input type ="text" id="x" name="x" value=<%=px %>> 
	<select id="c" name="c">
		<option value="+">+
		<option value="-">-
		<option value="x">x
		<option value="/">/
	</select>
	y값 : <input type ="text" id="y" name="y" value=<%=py %>>
	결과: <%= iz %>
		<input type ="submit" value="계산">	
	</form>
	
</body>
</html>