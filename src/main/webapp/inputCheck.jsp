<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Performance"%>
<%@ page import="java.util.Date,java.text.DateFormat"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入力内容確認画面</title>
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

		<h2>実績額の確認</h2><br>
<%
		Performance newP = (Performance)session.getAttribute("newP");

		if(newP != null){

				int userID = newP.getUserID();
				int categoryID = newP.getCategoryID();
				String date = newP.getDate();
				int amount = newP.getAmount();


				Category category = (Category)request.getAttribute("category");

				String categoryName = category.getCategoryName();
				int bop = category.getBOP();
				String bopName = null;


				if(bop == 1) {
					bopName = "支出";
				} else if(bop == 2) {
					bopName = "収入";
				}

%>

		<%=bopName%>
		<br>
		<table border="1">
			<tr><th>カテゴリー</th><td><%=categoryName%></td></tr>
			<tr><th>日付</th>	<td><%=date %></td></tr>
			<tr><th>金額</th><td><%=amount%></td></tr>
		</table><br><br>


		<a href ="input.jsp">戻る</a>　　

		<form action="InputServlet" method="post" style="display: inline">
			<span class="submit"><input type="submit" name="check" value="登録"></span>
		</form>

<%
		}else{
%>
			<h4 style="color: red">${okMsg}</h4>
<%
		}
%>

	</div>
	</div>
</body>
</html>