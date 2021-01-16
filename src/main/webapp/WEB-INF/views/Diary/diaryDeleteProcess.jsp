<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Diary is deleting,,</title>
<script>
	alert("게시물이 삭제되었습니다.")
	history.go(-2);
</script>
</head>
<body>
</body>
</html>