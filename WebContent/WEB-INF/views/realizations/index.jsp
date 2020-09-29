<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>気付きリスト</h2>
        <table id="realizations_list">
            <tbody>
                <tr>
                    <th class="realization_name">投稿者名</th>
                    <th class="realization_date">日付</th>
                    <th class="realization_title">タイトル</th>
                    <th class="realization_evalution">有益度</th>
                    <th class="realization_fixation">定着度</th>
                    <th class="realization_action">編集</th>
                </tr>
                <c:forEach var="realization" items="${realizations}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class ="realization_name"><a href = "<c:url value = '/profiles/show?id=${realization.user.id}' />">${realization.user.name}</a></td>
                        <td class="realization_date"><fmt:formatDate value='${realization.realization_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="realization_title">${realization.title}</td>
                        <td class="realization_evalution">
                        <c:choose>
                           <c:when test="${realization.evalution==0}">☆
                           </c:when>
                           <c:when test="${realization.evalution==1}">☆☆
                           </c:when>
                           <c:otherwise>☆☆☆</c:otherwise>
                           </c:choose>
                           </td>
                        <td class="realization_fixation">
                        <c:choose>
                           <c:when test="${realization.fixation==0}">★
                           </c:when>
                           <c:when test="${realization.fixation==1}">★★
                           </c:when>
                           <c:otherwise>★★★</c:otherwise>
                           </c:choose>
                           </td>
                        <td class="realization_action"><a href="<c:url value='/realizations/show?id=${realization.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${realizations_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((realizations_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/realizations/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/realizations/new' />">新しい気付きの登録</a></p>

    </c:param>
</c:import>