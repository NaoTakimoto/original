<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Performance"%>
    <%@ page import="dto.Category"%>
    <%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更入力画面</title>
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

		<h2>変更内容の入力</h2>
		<br><br>

<%
		Performance beforeData = (Performance)session.getAttribute("beforeData");


		int performanceID = beforeData.getPerformanceID();
		int beforeCategoryID =  beforeData.getCategoryID();
		int beforeAmount = beforeData.getAmount();
		String beforeDate =  beforeData.getDate();


		ArrayList categoryList = (ArrayList)session.getAttribute("categoryList");
%>

		<form action="ChangeServlet" method="post" style="display: inline">
			<p>
			<span class="iptxt">
			<label class="ef">

			カテゴリー　<select name="category">

<%
		int categoryID = 0;
		String categoryName = null;

		for (Object cDataList :categoryList) {
			Category cData = (Category)cDataList;


			if (cData != null) {
				categoryID = cData.getCategoryID();
				categoryName = cData.getCategoryName();

				if (categoryID == beforeCategoryID) {
%>
					<option value = <%=categoryID%> selected><%=categoryName%></option>
<%
				}else{
%>
					<option value = <%=categoryID%>><%=categoryName%></option>
<%
				}
			}
		}
%>
			</select>
			<br><br>
			　　金額　　<input type="text" name="amount" value = <%=beforeAmount%>>
			<br><br>
			　　日付　<input type="text" name="date" value = <%=beforeDate%>>
			<br>
			<input type="hidden" name="performanceID" value = <%=performanceID%>>
			</label>
			</span>
			</p>


			<h4 style="color: red">${msg}</h4><br>
			<span class="submit"><input type="reset" value="クリア"></span>　　
			<span class="submit"><input type="submit" name="check1" value="確認"></span>
		</form>
	</div>
	</div>
</body>
</html>