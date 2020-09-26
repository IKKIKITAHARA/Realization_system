<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>いいね一覧</h2>
        <table id="likes_list">
            <tbody>
                <tr>
                    <th class="realization_name"> 投稿者名</th>
                    <th class="realization_date">日付</th>
                    <th class="realization_title">タイトル</th>
                    <th class="realization_evalution">有益度</th>
                    <th class="realization_fixation">定着度</th>
                    <th class="realization_action">編集</th>
                </tr>
                <c:forEach var = "myLike" items="${myLikes}" varStatus = "status">
                <tr class ="row${status.count % 2 }">
                    <td class="realization_name"><c:out value="${myLike.likedRealization.user.name}" /></td>
                    <td class="realization_date"><fmt:formatDate value="${myLike.likedRealization.realization_date}" pattern='yyyy-MM-dd' /></td>
                    <td class="realization_title">${myLike.likedRealization.title}</td>
                    <td class="realization_evalution"><c:choose>
                            <c:when test="${myLike.likedRealization.evalution==0}">☆
                            </c:when>
                            <c:when test="${myLike.likedRealization.evalution==1}">☆☆
                            </c:when>
                            <c:otherwise>☆☆☆</c:otherwise>
                        </c:choose></td>
                    <td class="realization_fixation"><c:choose>
                            <c:when test="${myLike.likedRealization.fixation==0}">★
                           </c:when>
                            <c:when test="${myLike.likedRealization.fixation==1}">★★
                           </c:when>
                            <c:otherwise>★★★</c:otherwise>
                        </c:choose>
                    <td class="realization_action"><a href="<c:url value='/realizations/show?id=${myLike.likedRealization.id}' />">詳細を見る</a></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>

        <div id = "pagination">
        (全 ${likes_count} 件) <br />
        <c:forEach var = "i" begin = "1" end="${((realizations_count - 1) / 15) + 1}" step = "1">
            <c:choose>
              <c:when test = "${i == page}">
                <c:out value = "${i}" />&nbsp;
             </c:when>
             <c:otherwise>
             <a href="<c:url value='/likes/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
             </c:otherwise>
             </c:choose>
             </c:forEach>
        </div>
        <p>
            <a href="<c:url value='/realizations/new' />">新しい気付きの登録</a>
        </p>
    </c:param>
</c:import>