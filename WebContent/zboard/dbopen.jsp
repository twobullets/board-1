<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<%  
String mDBMS     = "jdbc:mysql://127.0.0.1/ezen?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
String mUserID   = "root";
String mUserPass = "mySQL1234";

Connection        conn;
PreparedStatement mStmt;
String            sql;


String  v_no    = ""; 
String  v_subject = "";
String  v_body  = "";
String  v_wdate = "";
String  v_hit   = "";


Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection( mDBMS, mUserID ,mUserPass );
%>