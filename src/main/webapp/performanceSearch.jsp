<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>

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

		<h2>実績額の検索</h2>
		<br><br>


		<form action="SearchServlet" method="post">
			<p>
			<span class="iptxt">
			<label class="ef">

			カテゴリー　<select name="category">
			<option type="hidden" value="hidden">　　　</option>

<%
		ArrayList categoryList = (ArrayList) session.getAttribute("categoryList");


		int categoryID = 0;
		String categoryName = null;


		for (Object data : categoryList) {

			Category cData = (Category)data;

			if (cData != null) {
				categoryID = cData.getCategoryID();
				categoryName = cData.getCategoryName();

%>

			<option value = <%=categoryID%>><%=categoryName%></option>

<%
			}
		}
 %>

			</select><br><br>

			　　日付　(半角数字)　<input type="text" name="date">
			</label>
			</span>
			</p>
			<br>

			<h4 style="color: red">${msg}</h4>

			<span class="submit"><input type="reset" value="クリア"></span>　　
			<span class="submit"><input type="submit" value="検索"></span><br><br>

		</form>
	</div>
	</div>
</body>
</html>