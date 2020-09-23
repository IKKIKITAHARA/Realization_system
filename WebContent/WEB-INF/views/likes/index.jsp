<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h3>【いいね一覧】</h3>
        <table id="likes_list">
            <tbody>
                <tr>
                    <th class="realization_name">氏名</th>
                    <th class="realization_date">日付</th>
                    <th class="realization_title">タイトル</th>
                    <th class="realization_evalution">有益度</th>
                    <th class="realization_fixation">定着度</th>
                </tr>
                <c:forEach var = "myLike" items="${myLikes}" varStatus = "status">
                <tr>
                    <td class="realization_name"><c:out value="${myLike.user.name}" /></td>
                    <td class="realization_date"><fmt:formatDate value="${myLike.realization.realization_date}" pattern='yyyy-MM-dd' /></td>
                    <td class="realization_title">${myLike.realization.title}</td>
                    <td class="realization_fixation"><c:choose>
                            <c:when test="${myLike.realization.evalution==0}">☆
                            </c:when>
                            <c:when test="${myLike.realization.evalution==1}">☆☆
                            </c:when>
                            <c:otherwise>☆☆☆</c:otherwise>
                        </c:choose></td>
                    <td class="realization_title"><c:choose>
                            <c:when test="${myLike.realization.fixation==0}">★
                           </c:when>
                            <c:when test="${myLike.realization.fixation==1}">★★
                           </c:when>
                            <c:otherwise>★★★</c:otherwise>
                        </c:choose>
        <td class="realization_action"><a
                        href="<c:url value='/realizations/show?id=${myLike.realization.id}' />">詳細を見る</a></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>
        <p>
            <a href="<c:url value='/realizations/new' />">新しい気付きの登録</a>
        </p>
    </c:param>
</c:import>