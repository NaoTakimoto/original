<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目標額入力画面</title>
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


		<h2>目標額の入力</h2><br><br>


		<form action="BudgetInputServlet" method="post" style="display: inline">
			<p><span class="iptxt"><label class="ef">


			日付　(半角数字)　<input type="text" name="date"><br><br>

			支出　(半角数字)<br>
			食費　　　　<input type="text" name="amount"><br>
			日用品　　　<input type="text" name="amount"><br>
			交通費　　　<input type="text" name="amount"><br>
			交際費　　　<input type="text" name="amount"><br>
			被服費　　<input type="text" name="amount"><br>
			住宅費　　　<input type="text" name="amount"><br>
			水道光熱費　<input type="text" name="amount"><br>
			医療費　　　<input type="text" name="amount"><br>
			その他　　　<input type="text" name="amount"><br><br>

			収入　(半角数字)<br>
			給与　　　　<input type="text" name="amount"><br>
			その他　　　<input type="text" name="amount"><br>


			</label></span></p>

			<h4 style="color: red">${msg}</h4><br>
			<span class="submit"><input type="reset" value="クリア"></span>　　
			<span class="submit"><input type="submit" value="確認"></span><br><br>
		</form>

	</div>
	</div>
</body>
</html>