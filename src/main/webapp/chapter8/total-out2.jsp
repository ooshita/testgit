<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html"%>

<%@page errorPage="total-error2.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
String priceParam = request.getParameter("price");
String countParam = request.getParameter("count");

if (priceParam == null || priceParam.equals("") || countParam == null || countParam.equals("")) {
	throw new NullPointerException();
}

int price = Integer.parseInt(priceParam);
int count = Integer.parseInt(countParam);
%>

<%=price%>円×<%=count%>個＝<%=price * count%>円

<%@include file="../footer.html"%>

