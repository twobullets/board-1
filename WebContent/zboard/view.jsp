<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../DBOpen.jsp" %>
<jsp:include page="../DBOpen.jsp"></jsp:include>
<jsp:include page="../DBOpen.jsp"/>
<%

Connection        conn;
PreparedStatement mStmt;
String            sql;


String  v_no    = ""; 
String  v_subject = "";
String  v_body  = "";
String  v_wdate = "";
String  v_hit   = "";


String no = request.getParameter("no");
if(no == null)
{
	%>no data.<%
	return;
}

String vtype = request.getParameter("type");
String vkeyword = request.getParameter("keyword");
if(vtype == null)
{
	vtype = "1";
}
if(vkeyword == null)
{
	vkeyword="";
}
String vadParam = "type=" + vtype + "&keyword=" + vkeyword;

String vcurpage = request.getParameter("page");
if(vcurpage == null)
{
	vcurpage = "1";
}


try
{
	
	PreparedStatement mSelectStatment;
	ResultSet         mResultSet;		

	sql = "select no,subject,body,hit,wdate from board where no = " + no;

	mDB.OpenQuery(sql);
	mDB.ResultNext();
	
	v_no = mDB.getString("no");
	v_subject = mDB.getString("subject");
	v_body =  mDB.getString("body");
	v_hit = mDB.getString("hit");
	v_wdate = mDB.getString("wdate");

	mDB.CloseQuery();

}catch(Exception e)
{
	out.println("ERROR:" + e.getMessage());
}
v_body = v_body.replace("\n","<br>");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>view</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center">Good Night Board</h1>
	<article>
		<div class="container" role="main">
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><%= v_subject %></div>
				<div class="board_info_box">
					<span class="board_date"><%=v_wdate %></span><span>,hit:10</span>
				</div>
				<div class="board_content"><%= v_body %></div>
				
			</div>
			<div style="margin-top : 20px" align="right">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='rewrite.jsp?no=<%= no %>&page=<%= vcurpage %>&<%= vadParam%>';">Rewrite</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="location.href='delete.jsp?no=<%= no %>&page=<%= vcurpage %>&<%= vadParam%>';">Delete</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href ='list.jsp?no=<%= no %>&page=<%= vcurpage %>&<%= vadParam%>';">List</button>
			</div>
		</div>
	</article>
</body>
</html>
<%@ include file  = "../DBClose.jsp" %>