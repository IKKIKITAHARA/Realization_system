<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user !=null }">
                <h2> ${user.name}さんのプロフィールページ 編集ページ</h2>
                <form method="POST" action="<c:url value='/profiles/update' />">
                    <br />
                    <label for="profile">プロフィール</label><br />
                    <textarea name = "profile" rows="10" cols="50">${user.profile}</textarea>
                    <br />
                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit">登録</button>
                </form>
                <p><a href="<c:url value='/realizations/index' />">気付きリストに戻る</a></p>
            </c:when>
            <c:otherwise>
            <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>