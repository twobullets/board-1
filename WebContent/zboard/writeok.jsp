<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../DBOpen.jsp" %>
<%
request.setCharacterEncoding("EUC-KR");
String subject = (String)request.getParameter("title");
String body    = (String)request.getParameter("content");


if(subject == null || body == null)
{
	out.print("no data.");
	return; //화면에 아무것도 표시 안됨
}

subject = subject.replace("'","''");
body = body.replace("'","''");

String sql = "insert into board (subject, body, wdate) " ;
sql += "values('" + subject +"','" + body + "',now()) ";

mDB.Excute(sql);
PreparedStatement mStmt;

sql = "select last_insert_id() as last";
mDB.OpenQuery(sql);
mDB.ResultNext();
int ArtiNo = mDB.getInt("last");
mDB.CloseQuery();

%>
<a href="view.jsp?no=<%= ArtiNo %>">view</a>
<%@ include file  = "../DBClose.jsp" %>