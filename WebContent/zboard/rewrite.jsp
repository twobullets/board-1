<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="dbopen.jsp" %> 
<%
String no = request.getParameter("no");
if(no == null)
{
	%>no data.<%
	return;
}
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
	
	PreparedStatement mSelectStatment;
	ResultSet         mResultSet;		

	sql = "select no,subject,body,hit,wdate from board where no = " + no;

	mSelectStatment= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	mResultSet = mSelectStatment.executeQuery();
	mResultSet.next();
	
	v_no = mResultSet.getString("no");
	v_subject = mResultSet.getString("subject");
	v_body =  mResultSet.getString("body");
	v_hit = mResultSet.getString("hit");
	v_wdate = mResultSet.getString("wdate");
	//검색된 결과를 닫는다.
	mResultSet.close();

	//stmt 를 닫는다.
	mSelectStatment.close();		

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
<title>rewrite</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<script language="javascript">
	
		function DataCheck()
		{
		
			if(document.form.title.value == "")
			{
				alert("please write the title");
				document.form.title.focus();
				return;
			}else if(document.form.content.value == "")
			{
				alert("please write the content");
				document.form.content.focus();
				return;
			}
			
			
			form.submit();
			
		}
		
	</script>
	<h1 class="text-center">Good Night Board</h1>
	<article>
		<div class="container" role="main">
			<form name="form" id="form" role="form" method="post" action="rewriteok.jsp">
			<input type ="hidden" id="no" name="no" value=<%= v_no %>>
				<div class="mb-3">
					<label for="title">Title</label>
					<input type="text" class="form-control" name="title" id="title" value=<%= v_subject %>>
				</div>
				<div class="mb-3">
					<label for="content">Content</label>
					<textarea class="form-control" rows="5" name="content" id="content"><%= v_body %></textarea>
				</div>
				<div class="mb-3">
					<label for="file">File</label>
					<input type="file" class="form-control" name="file" id="file">
				</div>
			</form>
			<div align="right">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="javascript:DataCheck()">Save</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='view.jsp?no=<%= no %>&page=<%= curpage %>&<%= adParam%>';">Cancel</button>
			</div>
		</div>
	</article>
</body>
</html>