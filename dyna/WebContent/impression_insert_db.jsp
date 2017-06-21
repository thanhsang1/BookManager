<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>JINSERT Operation</title>
</head>
<body>
	<c:if test="${ empty param.bookcomment}">
		<c:redirect url="impression_insert_form.jsp">
			<c:param name="errMsg" value="コメントを入力してください" />
		</c:redirect>

	</c:if>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/bookmanager" user="root" password="" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO impression(comment, book_id) VALUES (?,?);
            
				<sql:param value="${param.bookcomment}" />
		<sql:param value="${param.bookId}" />


	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'> Congratulations ! Data inserted
			successfully.</font>

		<c:redirect url="impression_list.jsp">		
			<c:param name="bookId"
				value="${param.bookId}" />
		</c:redirect>
	</c:if>


</body>
</html>