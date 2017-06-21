<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="count">
            UPDATE books SET name = ?, publisher=?, page=?
            WHERE id='${param.bookId}'
            <sql:param value="${param.pname}" />
		<sql:param value="${param.qty}" />
		<sql:param value="${param.page}" />

	</sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data updated
			successfully.</font>
		<a href="book_list.jsp">戻る</a>
		
		
	</c:if>
</body>
</html>