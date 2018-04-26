<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table {
	border-collapse: collapse;
}

td {
	padding: 5px;
	border: solid 1px gray;
}
</style>
</head>
<body>
	<tr>
		<%for (int i = 1; i <= 10; ++i) {%>
		<td>4 * <%=i%> = <%=4 * i%></td>
		<%
			}
		%>
	</tr>

</body>
</html>
