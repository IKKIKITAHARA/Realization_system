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
                     <c:forEach var = "myFollow" items="${myFollows}" varStatus = "status">
                <tr class ="row${status.count % 2 }">
                 <td class="realization_name"><a href = "<c:url value = '/profiles/show?id=${myFollow.followed.id}' />">${myFollow.followed.name}</a></td>
                <td class="realization_date"><fmt:formatDate value="${myFollow.followed.id.likedRealization.realization_date}" pattern='yyyy-MM-dd' /></td>

</tr>
</c:forEach>
 </tbody>
        </table>

        <div id = "pagination">
        (全 ${followed_count} 件) <br />
        <c:forEach var = "i" begin = "1" end="${((followed_count - 1) / 15) + 1}" step = "1">
            <c:choose>
                <c:when test = "${l == page}">
                <c:out value = "${l}" />&nbsp;
                </c:when>
             <c:otherwise>
               <a href="<c:url value='/follows/index?page=${l}' />"><c:out value="${i}" /></a>&nbsp;
             </c:otherwise>
           </c:choose>
         </c:forEach>
        </div>

        <p>
            <a href="<c:url value='/realizations/new' />">新しい気付きの登録</a>
        </p>
    </c:param>
</c:import>