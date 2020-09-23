<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                ユーザーIDかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${general_flush != null}">
            <div id="general_flush_success">
                <c:out value="${general_flush}"></c:out>
            </div>
        </c:if>
        <h2>ログイン</h2>
        <form method="POST" action="<c:url value='/login' />">
            <label for="code">ユーザーID</label><br />
            <input type="text" name="code" value="${code}" />
            <br /><br />

            <label for="password">パスワード</label><br />
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit">ログイン</button>
        </form>

     <p><a href = "<c:url value = "/users/new?general_user=${general_user}" />">ユーザー新規登録はこちらから</a></p>
    </c:param>
</c:import>