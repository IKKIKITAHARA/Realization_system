<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
    <c:if test = "${flush_success}">
      <div id = "flush_success">
        <c:out value = "${flush}"></c:out>
      </div>
    </c:if>

        <c:choose>
            <c:when test="${user != null}">
                <h2>ユーザー プロフィール</h2>
                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${user.name}" /></td>
                        </tr>
                        <tr>
                            <th>プロフィール</th>
                            <td><pre><c:out value="${user.profile}" /></pre></td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_user.id == user.id}">
                    <p>
                        <a
                            href="<c:url value="/profiles/edit?id=${user.id}" />">プロフィールを編集する</a>
                    </p>
                </c:if>

            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

     <p>
       <c:choose>
        <c:when test = "${myFollow == null || fn:length ( myFollow ) == 0}" >
         <a href="<c:url value = "/follows?followed_id=${user.id}" />">フォローする</a>
       </c:when>
        <c:otherwise>
                    <form method="POST" action="<c:url value = '/follows/destroy' />">
                        <input type="hidden" name="followed_id" value="${user.id}" />
                        <button type="submit"> フォローを外す</button>
                    </form>
        </c:otherwise>
        </c:choose>
        </p>
        <p><a href="<c:url value="/realizations/index" />">気付きリストに戻る</a>
        </p>
    </c:param>
</c:import>