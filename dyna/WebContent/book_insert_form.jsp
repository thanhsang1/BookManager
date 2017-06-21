<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>書籍の登録</title>
    </head>
    <body>
        <form action="book_insert_db.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">書籍の登録</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>書籍名</label></td>
                        <td><input type="text" name="bookname"/></td>
                    </tr>
                    <tr>
                        <td><label>出版社</label></td>
                        <td><input type="text" name="bookqty"/></td>
                    </tr>
                    <tr>
                        <td><label>ページ数</label></td>
                        <td><input type="number" name="bookpage" maxlength="1 "/></td>
                    </tr>
                    <tr><td></td>
                        <td><input type="submit" value="送信" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
           <button> <a href="index.jsp">戻る</a></button>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
           <button> <a href="book_list.jsp">戻る</a></button>
        </c:if></font>
 
    </body>
</html>