<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
	<br>
	<h2>家計簿アプリ</h2>

	<form action="LoginServlet" method="post"><br><br>
		<p>
		　ID　　<input type="text" name="userID"><br><br>
		PASS　　<input type="password" name="pass">
		</p><br>
		<%-- エラーメッセージの表示 --%>
		<h4 style="color: red">${msg}</h4><br>
		<span class="submit"><input type="reset" value="クリア"></span>　　
		<span class="submit"> <input type="submit" value="ログイン" /></span><br><br>

	</form><br>
</body>
</html>