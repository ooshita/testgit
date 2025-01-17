<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="p" items="${list}">
	${p.id}：${p.name}：${p.price}<br>
</c:forEach>

<table>
    <c:forEach var="entry" items="${capitals}">
        <tr>
            <td>${entry.key}</td>
            <td>${entry.value}</td>
        </tr>
    </c:forEach>
</table>



<c:if test="${empty value}">
    <p>値がありません。</p>
</c:if>


<c:if test="${value ==null}">
    <p>値がありません。</p>
</c:if>


<%@include file="../footer.html" %>
