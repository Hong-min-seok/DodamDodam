<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Member information is changed completely!</title>
</head>
<script>
	alert("회원 정보가 수정되었습니다");
	location.href="mypage";
</script>
<body>

</body>
</html>