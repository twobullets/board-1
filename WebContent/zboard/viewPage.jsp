<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<% 
request.setCharacterEncoding("EUC-KR");
final String saveFolder = "d:\\upload";
final int maxSize = 10*1024*1024; //10mb
final String encoding = "EUC-KR";


try{
	//파일이 서버에 업로드되는 시점은 MultipartRequest 객체 생성 순간이다. 
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encoding, new DefaultFileRenamePolicy());
	//request가 되는 순간 null로 변한다. 
	//out.print("성공"); 
	String fileName = multi.getFilesystemName("uploadFile");//실제 저장될 파일이름 얻어오기, 파일을 업로드하면 프로그래머가쓸이름 사용자가 올린이름 두개
	String original = multi.getOriginalFileName("uploadFile");//filename은 중복이름이 들어올 경우 자동으로 index가 붙는데, index되기 전의 원본명
	String type = multi.getContentType("uploadFile");
	File f = multi.getFile("uploadFile");//쓸 준비
	int len = 0;
	if(f!=null) { len = (int)f.length(); }//업로드 할때 파일 크기 확인해서 데이터베이스에 넣기 위해
	
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");

%>
저장된 파일 : <%=fileName%><br/> 
실제 파일 : <%=original%><br/> 
파일 타입: <%=type%><br/> 
파일 크기 : <%=len%><br/> 
user : <%= user%><br/> 
title : <%= title%><br/> 
<a href="fileSelect.jsp">파일선택</a>
<% 
	}catch (Exception e) { e.printStackTrace(); } 
%>

