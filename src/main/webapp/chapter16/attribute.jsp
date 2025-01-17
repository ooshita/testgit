<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%@page import="bean.Product" %>

<% Product p=(Product)request.getAttribute("product"); %>
<% String name=(String)request.getAttribute("name"); %>

<%=p.getId() %>：<%=p.getName() %>：<%=p.getPrice() %><br>
<%=name %>


<%@include file="../footer.html" %>
