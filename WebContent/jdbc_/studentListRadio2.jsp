<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, lecture1.jdbc_.*"%>
<%
	String s = request.getParameter("departmentId"); //학과 번호 저장
	String s1 = request.getParameter("year"); //학년 저장
	int departmentId = (s == null) ? 0 : Integer.parseInt(s);
	int year = (s1 == null) ? 0 : Integer.parseInt(s1);
	List<Student> list;
	if (departmentId == 0 && year == 0)
		list = StudentDAO3.findAll();
	else if(departmentId != 0 && year == 0)
		list = StudentDAO3.findByDepartmentId(departmentId);
	else if(departmentId == 0 && year != 0)
		list = StudentDAO3.findByYear(year);	
	else
		list = StudentDAO3.findByYearAndDepartmentId(year, departmentId);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>학생목록</h1>
		<form class="form-inline">
			<div class="form-group">
				<h3>학과 선택</h3>
				<div class="radio">
					<label>학과</label> <label><input type="radio"
						name="departmentId" value="0"
						<%=departmentId == 0 ? "checked" : ""%> /> 전체</label>
					<% for(Department d : DepartmentDAO.findAll()) { %>
					<label><input type="radio" name="departmentId"
						value="<%= d.getId() %>"
						<%=departmentId == d.getId() ? "checked" : ""%> /> <%= d.getDepartmentName() %></label>
					<% } %>
				</div>
				<hr />
				<h3>학년 선택</h3>
				<div class="radio">
					<label><input type="radio" name="year" value="0" <%=year == 0 ? "checked" : ""%> /> 전체</label> 
					<label><input type="radio" name="year" value="1" <%=year == 1 ? "checked" : ""%> /> 1학년</label> 
					<label><input type="radio" name="year" value="2" <%=year == 2 ? "checked" : ""%> /> 2학년</label> 
					<label><input type="radio" name="year" value="3" <%=year == 3 ? "checked" : ""%> /> 3학년</label>
				</div>
			</div>
			<hr />
			<button type="submit" class="btn btn-primary">조회</button>
		</form>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>학과</th>
					<th>학년</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Student student : list) {
				%>
				<tr>
					<td><%=student.getStudentNumber()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getDepartmentName()%></td>
					<td><%=student.getYear()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>