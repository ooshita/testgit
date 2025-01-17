<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="message" value="Hello" />
<p>message : ${message}</p>

<c:set var="message2">Welcome</c:set>
<p>message2 : ${message2}</p>

<c:set var="result" value="${1+2}" />
<p>result : ${result}</p>

<jsp:useBean id="product" class="bean.Product" />
<c:set target="${product}" property="name" value="さんま" />
<p>product.name : ${product.name}</p>

<!--
下記のuseBeanに対するEclipseの警告を消すためには、
[ウィンドウ]メニュー->[設定]->[Java]->[コンパイラー]->[エラー/警告]->[総称型]->[raw型の使用]
を[無視]に設定してください。
-->
<jsp:useBean id="map" class="java.util.HashMap" />
<c:set target="${map}" property="apple" value="りんご" />
<p>map.apple : ${map.apple}</p>

<c:out value="${userName}" default="Guest" />
<p></p>
<c:out value="<b>bold text</b>" />
<p></p>
<c:out value="<b>bold text</b>" escapeXml="false" />
<p></p>

<c:set var="message" value="a<b && a>c" />
<c:out value="${message}"/>
<p></p>

<c:out value="a<b && a>c"/>
<p></p>

<c:out value="a<b && a>c" escapeXml="false"/>
<p></p>


<c:forTokens items="red,green,blue" delims="," var="color" varStatus="status">
    <p>${status.index}: ${color}</p>
</c:forTokens>

<c:forTokens items="dog;cat:bird,pig" delims=";:," var="animal">
    <p>${animal}</p>
</c:forTokens>

<c:forTokens items="red,green,blue" delims="," var="color" varStatus="status">
    <p>${status.count}: ${color}</p>
</c:forTokens>

<c:url value="jstl.jsp" var="loginUrl" >
 	<c:param name="query" value="JSTL" />
    <c:param name="page" value="1" />
</c:url>
<a href="${loginUrl}">Login</a>

<c:url value="https://www.google.com/finance/quote/7203:TYO" var="externalUrl">
    <c:param name="hl" value="ja" />
    
</c:url>
<a href="${externalUrl}">External Search</a>


<c:import url ="import.jsp" />
<c:import url ="https://www.google.co.jp/" />

<%-- <c:redirect url ="jstl.jsp" /> --%>




<%@include file="../footer.html" %>
