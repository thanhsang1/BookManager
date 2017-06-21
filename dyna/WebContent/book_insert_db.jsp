<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>書籍登録</title>
</head>
<body>
	<c:if test="${ empty param.bookname or empty param.bookqty or empty param.bookpage}">
		<c:redirect url="book_insert_form.jsp">
			<c:param name="errMsg" value="please input database" />
		</c:redirect>

	</c:if>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO books (name,publisher, page) VALUES (?,?,?);
            <sql:param value="${param.bookname}" />
		<sql:param value="${param.bookqty}" />
		<sql:param value="${param.bookpage}" />

	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'>書籍登録が完了しました.</font>

		<c:redirect url="book_list.jsp">
			<c:param name="susMsg"
				value="Congratulations ! Data inserted
            successfully." />
		</c:redirect>
	</c:if>


</body>
</html>