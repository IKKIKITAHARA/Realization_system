<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${realization != null}">
                <h2>気付き 詳細ページ</h2>
                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${realization.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${realization.realization_date}"
                                    pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${realization.title}" /></td>
                        </tr>
                        <tr>
                            <th>内容</th>
                            <td><pre><c:out value="${realization.content}" /></pre></td>
                        </tr>

                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${realization.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${realization.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>有益度</th>
                            <td><c:choose>
                                    <c:when test="${realization.evalution==0}">☆
                           </c:when>
                                    <c:when test="${realization.evalution==1}">☆☆
                           </c:when>
                                    <c:otherwise>☆☆☆</c:otherwise>
                                </c:choose>
                        </tr>
                        <tr>
                            <th>定着度</th>
                            <td><c:choose>
                                    <c:when test="${realization.fixation==0}">★
                           </c:when>
                                    <c:when test="${realization.fixation==1}">★★
                           </c:when>
                                    <c:otherwise>★★★</c:otherwise>
                                </c:choose>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_user.id == myLikes.user.id}">
                    <p>
                        <a
                            href="<c:url value="/realizations/edit?id=${realization.id}" />">この気付きを編集する</a>
                    </p>
                </c:if>

            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p>
            <c:choose>
                <c:when test="${myLike == null || fn:length ( myLike ) == 0}">
                    <a
                        href="<c:url value="/realizations/like?likeaction=${realization.id}" />">いいね！</a>
                </c:when>
                <c:otherwise>
                    <p>
                    <form method="POST" action="<c:url value = '/likes/destroy' />">
                        <input type="hidden" name="realization_id" value="${realization.id}" />
                        <button type="submit">いいね取り消し</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </p>
        <p><a href="<c:url value="/realizations/index" />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>