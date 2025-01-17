<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<p>検索したいものを入力してください。</p>
<form action="search_2" method="post">
商品名<input type="text" name="keyword">
種類<input type="text" name="kind">
価格<input type="text" name="price">
<input type="submit" value="検索">
</form>



</select>
<%@include file="../footer.html" %>