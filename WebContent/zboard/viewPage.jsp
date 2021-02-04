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
	//������ ������ ���ε�Ǵ� ������ MultipartRequest ��ü ���� �����̴�. 
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encoding, new DefaultFileRenamePolicy());
	//request�� �Ǵ� ���� null�� ���Ѵ�. 
	//out.print("����"); 
	String fileName = multi.getFilesystemName("uploadFile");//���� ����� �����̸� ������, ������ ���ε��ϸ� ���α׷��Ӱ����̸� ����ڰ� �ø��̸� �ΰ�
	String original = multi.getOriginalFileName("uploadFile");//filename�� �ߺ��̸��� ���� ��� �ڵ����� index�� �ٴµ�, index�Ǳ� ���� ������
	String type = multi.getContentType("uploadFile");
	File f = multi.getFile("uploadFile");//�� �غ�
	int len = 0;
	if(f!=null) { len = (int)f.length(); }//���ε� �Ҷ� ���� ũ�� Ȯ���ؼ� �����ͺ��̽��� �ֱ� ����
	
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");

%>
����� ���� : <%=fileName%><br/> 
���� ���� : <%=original%><br/> 
���� Ÿ��: <%=type%><br/> 
���� ũ�� : <%=len%><br/> 
user : <%= user%><br/> 
title : <%= title%><br/> 
<a href="fileSelect.jsp">���ϼ���</a>
<% 
	}catch (Exception e) { e.printStackTrace(); } 
%>

