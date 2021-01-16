<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Password is Changing,,</title>
<script>
	alert("비밀번호가 변경되었습니다!");
	location.href="mypage";
</script>
</head>
<body>

	
</body>
</html>