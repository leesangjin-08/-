<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エレクトロニクス</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="login-container">
	<h3>エレクトロニクス</h3>
	
	
	<div class="login-box">
	<form action="login-servlet" method="post">
		ユーザID： <input type="text" name="userId" required><br>
		パスワード： <input type="password" name="password" required><br><br>
		<input type="submit" value="ログイン" class="button">
	</form>

	<% 
		String errorMsg = (String)request.getAttribute("errorMsg");
		if (errorMsg != null) {
	%>
			<p class="error-msg"><%= errorMsg %></p>
	<%
		} 
	%>
	</div>

</body>
</html>
