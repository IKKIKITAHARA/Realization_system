<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>新規ユーザー登録ページ</h2>

        <form method="POST" action="<c:url value='/users/create' />">
            <c:import url="_form.jsp" />
        </form>

        <c:choose>
        <c:when test="${general_user == null}">
        <p><a href="<c:url value='/users/index' />">一覧に戻る</a></p>
        </c:when>
        <c:otherwise>
        <p><a href = "<c:url value = '/login' />">ログイン画面に戻る</a></p>
        </c:otherwise>
        </c:choose>
    </c:param>
</c:import>