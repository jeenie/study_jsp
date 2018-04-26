<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
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
input.form-control {
	width: 200px;
}

select.form-control {
	width: 70px;
}

table.table {
	width: 500px;
}

thead tr {
	background-color: #eee;
}
</style>
</head>
<body>
	<%
		String s1 = request.getParameter("cmd");
		String txt = request.getParameter("txt");
		if(txt == null) 
			txt = "";
		if ("one".equals(s1))
			txt = "one";
		else if ("two".equals(s1))
			txt = "two";
		else if ("three".equals(s1))
			txt = "three";
	
	%>
	<div class="container">
		<form method="get">
			<div class="form-group">
				<label>select1:</label> <select name="cmd" class="form-control">
					<option value="one" <%="one".equals(s1) ? "selected" : ""%>>one</option>
					<option value="two" <%="two".equals(s1) ? "selected" : ""%>>two</option>
					<option value="three" <%="three".equals(s1) ? "selected" : ""%>>three</option>
				</select>
			</div>
			<div class="radio">
				<label><input type="radio" name="radio2" value="one"
					<%="one".equals(s1) ? "checked" : ""%> /> one</label> 
				<label><input type="radio" name="radio2" value="two" 
					<%="two".equals(s1) ? "checked" : ""%> /> two</label> 
				<label><input type="radio" name="radio2" value="three" 
					<%="three".equals(s1) ? "checked" : ""%> /> three</label> 
			</div>
			<div class="form-group">
				<input type="text" name="txt"
					class="form-control" value="<%=txt%>" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">확인</button>
			</div>
		</form>
	</div>
</body>
</html>