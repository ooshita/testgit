<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>





<c:catch var="exception">
    <% int a=2, b=0, c=a/b; %>>
</c:catch>
<p>${exception}</p>

${1+2}
<br>
${1-2}
<br>
${10.0/0.0}


<c:set var="result" value="${10/5}" />
<p>${result}</p>

<c:catch var="exception">
    <% int a=2, b=0, c=a/b; %>>
</c:catch>

<c:if test="${not empty exception}">
    <p>例外が発生しました: ${exception.message}</p>
</c:if>


<c:catch var="exception">
    <c:forEach var="item" items="${null}">
        <p>${item}</p>
    </c:forEach>
</c:catch>

<c:if test="${not empty exception}">
    <p>エラーが発生しました: ${exception.message}</p>
</c:if>

<fmt:formatNumber value="12345.6789" type="currency" />
<!-- 結果: $12,345.68 （ロケールに基づく） -->
<br>

<fmt:formatNumber value="0.875" type="percent" />
<!-- 結果: 87% -->
<br>
<fmt:formatNumber value="12345.6789" pattern="#,##0.00" />
<!-- 結果: 12,345.68 -->
<br>
2222
<br>
<fmt:formatNumber value="3265.9865" maxFractionDigits="2" />
<!-- 結果: 3265.99 -->
<br>


<fmt:formatNumber value="12345.6789" maxFractionDigits="2" var="formattedValue" />
<p>フォーマットされた値: ${formattedValue}</p>

<%
    // 現在の日時を設定
    java.util.Date now = new java.util.Date();
    request.setAttribute("now", now);
%>

<fmt:formatDate value="${now}" />
<br>
<fmt:formatDate value="${now}" type="both" />
<!-- 結果: 2024/12/23 10:30:45（ロケールによる） -->
<br>
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="short" />
<!-- 結果: 2024年12月23日 月曜日 10:30 -->
<br>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />
<!-- 結果: 2024-12-23 10:30:45 -->
<br>
<fmt:formatDate value="${now}" type="both" timeZone="Asia/Tokyo" />
<!-- 結果: タイムゾーンに基づいた日付と時刻 -->
<br>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="formattedDate" />
<p>フォーマットされた日付: ${formattedDate}</p>
<br>
<fmt:formatDate value="${null}" />
2222
<c:if test="${fn:contains('hello world', 'world')}">
    <p>含まれています。</p>
</c:if>

<c:if test="${fn:containsIgnoreCase('Hello', 'hello')}">
    <p>含まれています（大文字小文字無視）。</p>
</c:if>

<c:if test="${fn:contains('Hello', 'hello')}">
    <p>含まれています（大文字小文字）。</p>
</c:if>

<p>文字列の長さ: ${fn:length('abcdef')}</p>

<p>置換後の文字列: ${fn:replace('hello world', 'world', 'JSTL')}</p>

<p>切り出し: ${fn:substring('abcdef', 1, 4)}</p>

<%
String[] fruits = {"りんご", "みかん", "バナナ"};
pageContext.setAttribute("fruits", fruits);
%>
<p>フルーツリスト: ${fruits}</p>
${fn:join(fruits, '、')}




<%@include file="../footer.html" %>
