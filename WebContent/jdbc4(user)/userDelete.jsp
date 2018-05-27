<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc.user4.*, lecture1.ParseUtils"%>
<%
	String s1 = request.getParameter("id");
	int id = Integer.parseInt(s1);
	String pg = request.getParameter("pg");
	UserDAO.delete(id);
	response.sendRedirect("userList.jsp?pg=" + pg);
%>