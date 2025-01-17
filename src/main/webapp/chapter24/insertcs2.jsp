<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@include file="../chapter25/menu2.jsp" %>

<p>追加するカスタマー情報を入力してください。</p>
<form action="Insertcs2.action" method="post">
ログイン名<input type="text" name="login">
パスワード<input type="password" name="password">
<input type="submit" value="追加">
</form>

<%@include file="../footer.html" %>
