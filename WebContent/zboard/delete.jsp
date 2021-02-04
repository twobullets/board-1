<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="dbopen.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>delete</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<%
String no = request.getParameter("no");
if(no == null)
{
	%>삭제할 게시물 번호가 없습니다.<%
	return;
}

String dtype = request.getParameter("type");
String dkeyword = request.getParameter("keyword");
if(dtype == null)
{
	dtype = "1";
}

if(dkeyword == null)
{
	dkeyword="";
}
String dadParam = "type=" + dtype + "&keyword=" + dkeyword;

String dcurpage = request.getParameter("page");
if(dcurpage == null)
{
	dcurpage = "1";
}

try
{
	
	PreparedStatement mSelectStatment;
	ResultSet         mResultSet;		

	sql = "delete from board where no = " + no;

	mSelectStatment= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	mSelectStatment.executeUpdate();


	//stmt 를 닫는다.
	mSelectStatment.close();		

}catch(Exception e)
{
	out.println("ERROR:" + e.getMessage());
}

conn.close();
%>    
<div class="container" role="main" style="margin-top : 20px">
	<h1 style="display:inline;">Deleted successfully!!!</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href ='list.jsp?no=<%= no %>&page=<%= dcurpage %>&<%= dadParam%>';">Back</button>
</div>
</body>
</html>