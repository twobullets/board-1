<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import ="ezen.*" %>
<%
DBManager mDB = new DBManager();

mDB.setDBMS("jdbc:mysql://127.0.0.1/ezen?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC");
mDB.setUserID("root");
mDB.setPassword("mySQL1234");
mDB.DBOpen();

%>