<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "java.io.*" %>
<%
response.addHeader("content-type","application/octet-stream");	
String fname = request.getParameter("file");
if(fname == null)
{
	fname = "Tulips.jpg";
	//response.sendRedirect("fileno.jsp") return;
}
try
{
	File mFile = new File("C:/eugene/zp/WebContent/upload",fname);
	
	InputStream in = null;
	in = new FileInputStream(mFile);
	OutputStream os = null;
	
	os = response.getOutputStream(); 
	byte b[] = new byte[(int)mFile.length()];
	int leng = 0;
	while((leng = in.read(b))>0)//�����鼭 output�� ��� �����鼭 ��� 
	{
		os.write(b,0,leng);
	}
	
	
	
	os.close();
	in.close();
}
catch(Exception e)
{
	out.print("Error");
}
%>