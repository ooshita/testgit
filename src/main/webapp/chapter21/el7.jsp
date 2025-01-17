<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<ul>
    <c:forEach var="name" items="${names}">
        <li>${name}</li>
    </c:forEach>
</ul>

<table>
    <c:forEach var="fruit" items="${fruits}">
        <tr><td>${fruit}</td></tr>
    </c:forEach>
</table>

<c:forEach var="i" begin="1" end="5">
    <p>Number: ${i}</p>
</c:forEach>


<table>
    <c:forEach var="entry" items="${capitals}">
        <tr>
            <td>${entry.key}</td>
            <td>${entry.value}</td>
        </tr>
    </c:forEach>
</table>

<c:if test="${isAdmin}">
    <p>管理者メニューが表示されます。</p>
</c:if>



<%@include file="../footer.html" %>
