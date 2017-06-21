<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 書籍の編集</title>
</head>
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from books where id=?;
            <sql:param value="${param.bookId}" />
	</sql:query>
	<form action="book_edit_db.jsp" method="post">
		<table border="0" width="40%">
			<caption>書籍の編集</caption>

		
			<c:forEach var="row" items="${result.rows}">
				<tbody>
					<tr>
						<td><input type="hidden" value="${param.bookId}" name="bookId" />
					</tr>
					<tr>
						<td><label>書籍名</label></td>
						<td><input type="text" value="${row.name}" name="pname" /></td>
					</tr>
					<tr>
						<td><label>出版社</label></td>
						<td><input type="text" value="${row.publisher}" name="qty" /></td>
					</tr>
					<tr>
						<td><label>ページ数</label></td>
						<td><input type="number" value="${row.page}" name="page" /></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="submit" value="編集" /></td>

					</tr>

				</tbody>

			</c:forEach>
		</table>
		<button>
		<a href="book_list.jsp">戻る</a>
		</button>
	</form>
</body>
</html>