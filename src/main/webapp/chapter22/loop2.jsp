<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="i" begin="1" end="9">
	<c:forEach var="j" begin="1" end="9">
		${i}×${j}＝${i*j}<br>
	</c:forEach>
</c:forEach>

<%@include file="../footer.html" %>
