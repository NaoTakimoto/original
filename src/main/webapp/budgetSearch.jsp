<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索画面</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>

	<div id="wrapper">
	<div class="left-column">

		<br><br>
		<form action="LoginServlet" method="post" style="display: inline">
			<span class="submit3"><input type="submit" name="logout" value="ログアウト"></span>
		</form>
		<br><br><br>
		<a href ="input.jsp">実績額入力</a><br>
		<a href ="performanceSearch.jsp">実績額検索</a><br>
		<a href ="budgetInput.jsp">目標額入力</a><br>
		<a href ="budgetSearch.jsp">目標額と実績額の比較</a><br>

	</div>



	<div class="right-column">

		<h2>目標額の検索</h2><br><br>



		<form action="BudgetSearchServlet" method="post">
			<p>

			日付　(半角数字)　<input type="text" name="date">
			<br>
			</p>
			<h4 style="color: red">${msg}</h4>
			<br>

		<span class="submit"><input type="reset" value="クリア"></span>　　
		<span class="submit"><input type="submit" value="検索"></span>
		<br><br>
		</form>

	</div>
	</div>
</body>
</html>