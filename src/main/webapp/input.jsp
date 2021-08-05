<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Performance"%>
<%@ page import="dto.Category"%>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>収入支出入力画面</title>
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

		<h2>実績額の入力</h2><br><br>


<%

	Performance newP = (Performance)session.getAttribute("newP");
	if(newP == null){
%>



		<form action="InputServlet" method="post" style="display: inline">
			<p>
			<span class="iptxt">
			<label class="ef">

			カテゴリー　(どちらか一方を選択)<br>
			支出　<select name="category1">
			<option type="hidden" value="hidden">　　　</option>

<%
				ArrayList categoryList = (ArrayList) session.getAttribute("categoryList");

				int categoryID = 0;
				String categoryName = null;
				int count = 0;


				for (Object data :categoryList) {

					count += 1;

					if(count > 9){
						break;
					}

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
			</select>

			　収入　<select name="category2">
			<option type="hidden" value="hidden">　　　</option>

<%
				count = 0;

				for (Object data :categoryList) {

					count += 1;
					if(count > 9){

					Category cData = (Category)data;

						if (cData != null) {
							categoryID = cData.getCategoryID();
							categoryName = cData.getCategoryName();
%>

			<option value = <%=categoryID%>><%=categoryName%></option>
<%
						}
					}
				}
 %>


			</select>
			<br><br>
			　　金額　(半角数字)　<input type="text" name="amount"><br><br>
			　　日付　(半角数字)　<input type="text" name="date"><br>
				</label>
				</span>
				</p>

			<h4 style="color: red">${msg}<br>${msg2}<br>${msg3}<br>${msg4}</h4>

			<span class="submit"><input type="reset" value="クリア"></span>　　
			<span class="submit"><input type="submit" value="確認"></span>
		</form>



<%
}else{
%>


<form action="InputServlet" method="post" style="display: inline">
			<p>
			<span class="iptxt">
			<label class="ef">

			カテゴリー　(どちらか一方を選択)<br>
			支出　<select name="category1">
			<option type="hidden" value="hidden">　　　</option>

<%
				ArrayList categoryList = (ArrayList) session.getAttribute("categoryList");

				int categoryID = 0;
				String categoryName = null;
				int count = 0;


				for (Object data :categoryList) {

					count += 1;

					if(count > 9){
						break;
					}

					Category cData = (Category)data;


					if (cData != null) {
						categoryID = cData.getCategoryID();
						categoryName = cData.getCategoryName();

					if(newP.getCategoryID() == categoryID){
%>
						<option value = <%=categoryID%> selected><%=categoryName%></option>
<%
					}
%>

			<option value = <%=categoryID%>><%=categoryName%></option>
<%
					}
				}
%>
			</select>

			　収入　<select name="category2">
			<option type="hidden" value="hidden">　　　</option>

<%
				count = 0;

				for (Object data :categoryList) {

					count += 1;
					if(count > 9){

					Category cData = (Category)data;

						if (cData != null) {
							categoryID = cData.getCategoryID();
							categoryName = cData.getCategoryName();

							if(newP.getCategoryID() == categoryID){
								%>
														<option value = <%=categoryID%> selected><%=categoryName%></option>
								<%
													}
								%>


			<option value = <%=categoryID%>><%=categoryName%></option>
<%
						}
					}
				}
 %>


			</select>
			<br><br>
			　　金額　(半角数字)　<input type="text" name="amount" value = ${newP.amount }><br><br>
			　　日付　(半角数字)　<input type="text" name="date" value = ${newP.date }><br>
				</label>
				</span>
				</p>

			<h4 style="color: red">${msg}<br>${msg2}<br>${msg3}<br>${msg4}</h4>

			<span class="submit"><input type="reset" value="クリア"></span>　　
			<span class="submit"><input type="submit" value="確認"></span>
		</form>


<%
}
%>
		<br><br><br>
	</div>
	</div>
</body>
</html>