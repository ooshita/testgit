<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%-- <p>${product.id}：${product.name}：${product.price}</p> --%>

<p>${sessionScope.product.id}：${sessionScope.product.name}：${sessionScope.product.price}</p>

<%@include file="../footer.html" %>
