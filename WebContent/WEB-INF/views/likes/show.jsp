<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <h2>いいね！したユーザー</h2>
    <p>＜ユーザー名＞</p>
<c:forEach var = "likedUsers" items="${likedUsers}" >
${likedUsers.likedUser.name}
</c:forEach>

    <p><a href="<c:url value='/realizations/show?id=${realization.id}' />">気付き詳細に戻る</a></p>

    </c:param>
</c:import>