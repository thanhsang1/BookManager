<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>感想一覧</title>
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>
<body>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT impression.id,impression.comment,impression.book_id,books.name FROM books,impression WHERE books.id=? AND books.id=impression.book_id
              <sql:param value="${param.bookId}" />
	</sql:query>
	<center>
		<div id=content style="margin-right: auto; margin-left: auto">
			<div style="margin-right: 30%">
				<button>
					<a
						href="impression_insert_form.jsp?bookId=<c:out value="${param.bookId}"/>">追加</a>
				</button>
			</div>
			<div>
				<form>
					<table border="1" width="40%">
						<caption>感想の一覧</caption>
						<tr>
							<th>ID</th>
							<th>書籍名</th>
							<th>コメント</th>
							<th colspan="2">操作</th>
							<th></th>

						</tr>
						<c:forEach var="row" items="${result.rows}">
							<tr>
								<td><c:out value="${row.id}" /></td>
								<td><c:out value="${row.name}" /></td>
								<td><c:out value="${row.comment}" /></td>
								<td><button>
										<a
											href="impression_edit_form.jsp?impressId=<c:out value="${row.id}"/>&bookId=<c:out value="${param.bookId}"/>">修正</a>
									</button></td>
								<td><button>
										<a
											href="javascript:confirmGo('書籍を削除してよろしでしょうか？','impression_delete.jsp?id=<c:out value="${row.id}"/>')">削除</a>
									</button></td>
								<td><input type="hidden" value="${param.bookId}"
									name="bookId" />
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
			<button>
				<a href="index.jsp">戻る</a>
			</button>
		</div>
	</center>
</body>
</html>