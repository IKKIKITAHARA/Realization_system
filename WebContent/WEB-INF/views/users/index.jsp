<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>ユーザーリスト</h2>
        <table id="user_list">
            <tbody>
                <tr>

                    <th>ログインID</th>
                    <th>ユーザー名</th>
                    <th>編集</th>
                </tr>

                <c:forEach var="user" items="${users}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${user.code}" /></td>
                        <td><c:out value="${user.name}" /></td>
                        <td><c:choose>
                                <c:when test="${user.delete_flag ==1}">
          (ユーザー削除済み)
          </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/users/show?id=${user.id}' />">ユーザー情報を表示</a>
                                </c:otherwise>
                            </c:choose>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <div id ="pagenation">
        <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${u == page}">
                        <c:out value="${u}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${u}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/users/new' />">新規ユーザーの登録</a></p>
    </c:param>
</c:import>