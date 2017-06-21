<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感想の編集</title>
</head>
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from impression where id=?;
            <sql:param value="${param.impressId}" />
	</sql:query>
	<form action="impression_edit_db.jsp" method="post">
		<table border="0" width="40%">
			<caption>感想の編集</caption>


			<c:forEach var="row" items="${result.rows}">
				<tbody>
					<tr>
						<td><input type="hidden" value="${param.bookId}" name="bookId" />
						<td><input type="hidden" value="${param.impressId}" name="impressId" />
					</tr>
					<tr>
						<td><label> コメント </label></td>
						<td><input type="text" value="${row.comment}" name="pname" /></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="編集" /></td>

					</tr>

				</tbody>

			</c:forEach>
		</table><button>
		<a href="impression_list.jsp">戻る</a></button>
	</form>
</body>
</html>