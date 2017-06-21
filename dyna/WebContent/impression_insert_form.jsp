<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感想の登録</title>
</head>
<body>
	<form action="impression_insert_db.jsp" method="post">
		<table border="0" cellspacing="2" cellpadding="5">
			<thead>
				<tr>
					<th colspan="2">感想の登録</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<tr>
					<td><input type="hidden" value="${param.bookId}" name="bookId" />
				</tr>
				<tr>
					<td><label> コメント</label></td>
					<td><input type="text" name="bookcomment" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="送信" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<font color="red"><c:if test="${not empty param.errMsg}">
			<c:out value="${param.errMsg}" />
			<button>
				<a href="index.jsp">戻る</a>
			</button>
		</c:if></font>

</body>
</html>