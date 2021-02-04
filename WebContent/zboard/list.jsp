<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbopen.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>list</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center">Good Night Board</h1>
	<div class="container">
			<%
				ResultSet        rs;		
				sql = "select count(*) as cnt from board ";
				mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				rs = mStmt.executeQuery();	
				rs.next();
				int recordTotal = Integer.parseInt(rs.getString("cnt"));
				
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
			%>
		
		About <%= recordTotal %> results
		<form align="right" id="frm" name="frm" method="get" action="list.jsp"  >
			Search: <select id="type" name="type">
				<%
					if(type.equals("1"))
					{
						%><option value="1" selected >All</option><% 
					}
					else
					{
						%><option value="1" >All</option><% 
					}
					if(type.equals("2"))
					{
						%><option value="2" selected>Title</option><%
					}
					else
					{
						%><option value="2">Title</option><%
					}
					if(type.equals("3"))
					{
						%><option value="3" selected>Content</option><% 			
					}
					else
					{
						%><option value="3">Content</option><% 	
					}
				%>
				
				
				
				</select>
			<input type="search" id="keyword" name="keyword" value=<%= keyword %>>
			<input type="submit">
		</form>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="10%">No</th>
						<th width="65%">Title</th>
						<th width="10%">Hit</th>
						<th width="15%">Date</th>
					</tr>
				</thead>
				<tbody>
				<%
					recordTotal = 0;
					int pageno  = 0;
					int perpage = 0;
					int startno = 0;
					
					try
					{
						
			
						String curpage = request.getParameter("page");
						if(curpage == null)
						{
							curpage = "1";
						}
						
						
						
						sql = "select count(*) as cnt from board ";
						if(!keyword.equals(""))
						{
							switch(type)
							{
							case "1": //전체
								sql += "where subject like '%" + keyword + "%' ";
								sql += "or body like '%" + keyword + "%' ";
							break;
							case "2": //제목
								sql += "where subject like '%" + keyword + "%' ";
							break;
							case "3": //내용
								sql += "where body like '%" + keyword + "%' ";
							break;
							}
						}
						mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs = mStmt.executeQuery();	
						rs.next();
						recordTotal = Integer.parseInt(rs.getString("cnt"));
	
						
						//검색된 결과를 닫는다.
						rs.close();
						//stmt 를 닫는다.
						mStmt.close();	
						
						pageno  = Integer.parseInt(curpage);
						perpage = 10;
						startno = ((pageno - 1) * perpage);
						sql = "select no,subject,hit,wdate from board ";
						if(!keyword.equals(""))
						{
							switch(type)
							{
							case "1": //전체
								sql += "where subject like '%" + keyword + "%' ";
								sql += "or body like '%" + keyword + "%' ";
							break;
							case "2": //제목
								sql += "where subject like '%" + keyword + "%' ";
							break;
							case "3": //내용
								sql += "where body like '%" + keyword + "%' ";
							break;
							}
						}
						sql += "order by no desc ";
						sql += "limit " + startno + "," + perpage;
						
						
						mStmt= conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs = mStmt.executeQuery();		
						
						int i = recordTotal - ((pageno - 1) * perpage);
						
						while(rs.next())
						{
							String vno      = rs.getString("no");
							String vsubject = rs.getString("subject");
							String vhit     = rs.getString("hit");
							String vwdate    = rs.getString("wdate");
						
							vsubject = vsubject.replace(keyword,"<font color=red>" + keyword +"</font>");
							%>
							<tr bgcolor="white">
								<td><%= i--  %></td>
								<td><a href="view.jsp?no=<%= vno %>&page=<%= curpage %>&<%= adParam%>"><%= vsubject %></a></td>
								<td><%= vhit  %></td>
								<td><%= vwdate %></td>
							</tr>
							<%
						}
						
						//검색된 결과를 닫는다.
						rs.close();
				
						//stmt 를 닫는다.
						mStmt.close();		
						
					}catch(Exception e)
					{
						out.println("ERROR:" + e.getMessage());
					}
					%>
				</tbody>
			</table>
		</div>
		<div align="right" >
			<%
				int maxPage = recordTotal / perpage;
				if( (recordTotal % perpage ) != 0)
				{
					maxPage++;
				}
				int blockstart = ((pageno-1)/10)*10;
			%>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="list.jsp?page=<%=blockstart - 1 %>&<%= adParam%>">Previous</a></li>
					<%
					
						for(int j=blockstart+1; j <= (blockstart+10); j++)
						{
							%><li class="page-item"><a href="list.jsp?page=<%= j %>&<%= adParam%>"><%= j %></a>&nbsp;&nbsp;</li><%
						}
					%> 
				<li class="page-item"><a class="page-link" href="list.jsp?page=<%=(blockstart+10)+1%>&<%= adParam%>">Next</a></li>	
				
			</ul>
			<a class ="btn btn-primary" href="write.jsp">Write</a>
		</div>
	</div>
</body>
</html>
<% conn.close();%>