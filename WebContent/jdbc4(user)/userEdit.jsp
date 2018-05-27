<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc.user4.*, lecture1.ParseUtils"%>
<%
	request.setCharacterEncoding("UTF-8");
	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id = ParseUtils.parseInt(s1, 0);
	
	User user = null;
	String pg = request.getParameter("pg");
	if (request.getMethod().equals("GET")) {
		user = UserDAO.findOne(id);
	} else {
		user = new User();
		user.setId(id);
		user.setUserid(request.getParameter("userid"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		String s2 = request.getParameter("departmentId");
		user.setDepartmentId(ParseUtils.parseInt(s2, 1));
		user.setEnabled(Boolean.valueOf(request.getParameter("enabled")));
		user.setUserType(request.getParameter("userType"));
		if (s1 == null || s1.length() == 0)
			에러메시지 = "ID를 입력하세요";
		else if (user.getUserid() == null || user.getUserid().length() == 0)
			에러메시지 = "사용자의 아이디를 입력하세요";
		else if (user.getName() == null || user.getName().length() == 0)
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0)
			에러메시지 = "이메일을 입력하세요";
		else {
			UserDAO.update(user);
			response.sendRedirect("userList.jsp?pg=" + pg);
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
		<h1>사용자 등록</h1>
		<hr />
		<form method="post">
			<div class="form-group">
				<label>아이디</label> <input type="text" class="form-control"
					name="userid" value="<%=user.getUserid()%>" />
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" value="<%=user.getName()%>" />
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="text" class="form-control"
					name="email" value="<%=user.getEmail()%>" />
			</div>
			<div class="form-group">
				<label>학과</label> <select class="form-control" name="departmentId">
					<%
						for (Department d : DepartmentDAO.findAll()) {
					%>
					<%
						String selected = user.getDepartmentId() == d.getId() ? "selected" : "";
					%>
					<option value="<%=d.getId()%>" <%=selected%>>
						<%=d.getDepartmentName()%>
					</option>
					<%
						}
					%>
				</select>
			</div>
			<label>사용 여부</label>
			<div class="radio">
				<label><input type="radio" name="enabled" value="true"
					<%=user.isEnabled() == true ? "checked" : ""%> />true</label> <label><input
					type="radio" name="enabled" value="false"
					<%=user.isEnabled() == false ? "checked" : ""%> />false</label>
			</div>
			<label>사용자 유형</label>
			<div class="radio">
				<label><input type="radio" name="userType" value="관리자" <%=user.getUserType().equals("관리자") ? "checked" : ""%> />관리자</label> 
				<label><input type="radio" name="userType" value="교수" 	<%=user.getUserType().equals("교수") ? "checked" : ""%> />교수</label> 
				<label><input type="radio" name="userType" value="교직원" <%=user.getUserType().equals("교직원") ? "checked" : ""%> />교직원</label> 
				<label><input type="radio" name="userType" value="학생" 	<%=user.getUserType().equals("학생") ? "checked" : ""%> />학생</label>
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
			<a href="userDelete.jsp?id=<%=id%>&pg=<%=pg%>"
				class="btn btn-default" onclick="return confirm('삭제하시겠습니까?')"> <i
				class="glyphicon glyphicon-trash"></i> 삭제
			</a>
		</form>
		<hr />
		<%
			if (에러메시지 != null) {
		%>
		<div class="alert alert-danger">
			사용자 등록 실패:
			<%=에러메시지%>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>