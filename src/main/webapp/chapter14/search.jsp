<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<p>検索商品名・検索IDを入力してください。</p>
<form action="search" method="post">
商品名<input type="text" name="keyword">
ID<input type="text" name="id">
価格<input type="text" name="price">
<input type="submit" value="検索">
</form>

<%@include file="../footer.html" %>
