<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="i" begin="101" end="200">
	<c:choose>
		<c:when test="${i%10==1}">(${i},</c:when>
		<c:when test="${i%10==0}">${i})<br></c:when>
		<c:otherwise>${i},</c:otherwise>
	</c:choose>
</c:forEach>

<c:choose>
    <c:when test="${userRole == 'admin'}">
        <p>管理者用メニューを表示します。</p>
    </c:when>
    <c:when test="${userRole == 'editor'}">
        <p>編集者用メニューを表示します。</p>
    </c:when>
     <c:when test="${userRole != 'editor' && userRole != 'admin'}">
        <p>一般ユーザー用メニューを表示します。</p>
    </c:when>
    
    <c:otherwise>
        <p>一般ユーザー用メニューを表示します。</p>
    </c:otherwise>
    </c:choose>


<%@include file="../footer.html" %>
