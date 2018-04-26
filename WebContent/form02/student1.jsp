<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.form02.*"%>
<%
	String id= ""; //ID
	String number= ""; //학번
	String name = ""; //이름
	int department = 0; //학과 번호
	String year= "0"; //학년
	String 에러메시지 = null;
	request.setCharacterEncoding("UTF-8");
	//request parameter로 받은 데이터 변수에 저장
	if (request.getMethod().equals("POST")) {
		id = request.getParameter("userid"); //ID
		number = request.getParameter("number"); //학번
		name = request.getParameter("name"); //이름
		String s1 = request.getParameter("department");
		department = Integer.parseInt(s1);
		year = request.getParameter("year");

		//에러메시지
		if (id == null || id.length() == 0)
			에러메시지 = "사용자 아이디를 입력하세요";
		else if (number == null || number.length() == 0)
			에러메시지 = "학번을 입력하세요";
		else if (name == null || name.length() == 0)
			에러메시지 = "이름을 입력하세요";
		else if (year == null || year.length() == 0)
			에러메시지 = "학년을 입력하세요";
		else {
			Student student = new Student(Integer.parseInt(id), number, name, department, Integer.parseInt(year));
			session.setAttribute("student", student);
			response.sendRedirect("student_success.jsp");
			return;
		}
	}
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
body {
	font-family: 굴림체;
}

input.form-control, select.form-control {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>학생 등록</h1>
		<hr />
		<form method="post">
			<div class="form-group">
				<label>ID</label> 
				<input type="text" class="form-control" name="userid" value="<%=id%>" />
			</div>
			<div class="form-group">
				<label>학번</label> 
				<input type="text" class="form-control"	name="number" value="<%=number%>"/>
			</div>
			<div class="form-group">
				<label>이름</label> 
				<input type="text" class="form-control"	name="name" value="<%=name%>" />
			</div>
			<div class="form-group">
				<label>학과</label> <select class="form-control" name="department">
					<option value="1" <%=department == 1 ? "selected" : ""%>>소프트웨어공학과</option>
					<option value="2" <%=department == 2 ? "selected" : ""%>>컴퓨터공학과</option>
					<option value="3" <%=department == 3 ? "selected" : ""%>>정보통신공학과</option>
					<option value="4" <%=department == 4 ? "selected" : ""%>>글로컬IT공학과</option>
				</select>
			</div>
			<div class="form-group">
				<label>학년</label> 
				<input type="text" class="form-control" name="year" value="<%=year%>" />
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
		</form>
		<hr />
		<%
			if (에러메시지 != null) {
		%>
		<div class="alert alert-danger">
			학생등록 실패:
			<%= 에러메시지 %>
		</div>
		<% } %>
	</div>
</body>
</html>
