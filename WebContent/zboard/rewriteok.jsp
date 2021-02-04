<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="dbopen.jsp" %> 
<% 
 v_no = request.getParameter("no");
 v_subject = request.getParameter("title");
 v_body  = request.getParameter("content");
out.print(v_subject);

String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
if(type == null)
{
	type = "1";
}

if(keyword == null)
{
	keyword="";
}

String adParam = "type=" + type + "&keyword=" + keyword;
String curpage = request.getParameter("page");
if(curpage == null)
{
	curpage = "1";
}

try
{
	
	sql = "update board set ";
	sql = sql + "subject = '" + v_subject + "', ";
	sql = sql + "body = '" + v_body + "' ";
	sql = sql + "where no = " + v_no;
	out.println(sql);
	
	mStmt  = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
	mStmt.executeUpdate();
	mStmt.close();

}
catch (Exception e)
{
	out.println("ERROR:" + e.getMessage());
	return;
}

conn.close();
%>
<html>
<div class="container" role="main" style="margin-top : 20px">
	<h1 style="display:inline;">Rewrite successfully!!!</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href ='view.jsp?no=<%=  v_no %>&page=<%= curpage %>&<%= adParam%>';">View</button>
</div>
</body>
</html>
