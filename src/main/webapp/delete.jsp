<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Performance"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除確認画面</title>
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

		<h2>削除の確認</h2>
		<br><br>

<%
		Performance deleteData = (Performance)request.getAttribute("deleteData");


		if (deleteData != null) {

			int performanceID = deleteData.getPerformanceID();
			int categoryID = deleteData.getCategoryID();
			int amount = deleteData.getAmount();
			String date = deleteData.getDate();


			Category category = (Category)request.getAttribute("category");

			String categoryName = category.getCategoryName();
			int bop = category.getBOP();
			String bopName = null;


			if(bop == 1) {
				bopName = "支出";
			} else {
				bopName = "収入";
			}
%>


	<%=bopName%>
	<br><br>
	<table border="1">
		<tr><th>カテゴリー</th><td><%=categoryName%></td></tr>
		<tr><th>金額</th><td><%=amount%></td></tr>
		<tr><th>日付</th>	<td><%=date%></td></tr>
	</table>
	<br><br>


	<h4 style="display: inline">削除します。よろしいですか？　　</h4>


	<form action="DeleteServlet" method="post" style="display: inline">
		<span class="submit"><input type="submit" name="check" value="削除"></span>
		<input type="hidden" name="performanceID" value= <%=performanceID%>>
	</form>

<%

		} else {

%>

		<h4 style="color: red">${okMsg}</h4>

<%
		}
%>
	</div>
	</div>
</body>
</html>