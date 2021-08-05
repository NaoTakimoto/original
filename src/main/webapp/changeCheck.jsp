<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Performance"%>
    <%@ page import="dto.Category"%>
    <%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更内容確認画面</title>
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

		<h2>変更内容の確認</h2>
		<br><br>

<%
		Performance afterData = (Performance)request.getAttribute("afterData");


		if (afterData != null) {


			int performanceID = afterData.getPerformanceID();
			int categoryID = afterData.getCategoryID();
			int amount = afterData.getAmount();
			String date = afterData.getDate();


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
		<br>
		<table border="1">
			<tr><th>カテゴリー</th><td><%=categoryName%></td></tr>
			<tr><th>金額</th><td><%=amount%></td></tr>
			<tr><th>日付</th><td><%=date%></td></tr>
		</table>
		<br><br>


		<a href= "change.jsp">戻る</a>　　

		<form action="ChangeServlet" method="post" style="display: inline">
			<span class="submit"><input type="submit" name="check2" value="変更"></span>

			<input type="hidden" name="performanceID" value= <%=performanceID%>>
			<input type="hidden" name="categoryID" value= <%=categoryID%>>
			<input type="hidden" name="date" value= <%=date%>>
			<input type="hidden" name="amount" value= <%=amount%>>
		</form>
		<br><br><br>


<%
		} else  {
%>

		<h4 style="color: red">${okMsg}</h4>
		<br><br>

<%
			session.removeAttribute("beforeData");
		}
%>

	</div>
	</div>
</body>
</html>