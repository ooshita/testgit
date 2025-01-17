<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<p>検索価格帯を選んでください。</p>
<form action="select1" method="post">
 <select name=price>
            <option disabled>選んでね</option>
            <option value ="100">100</option>
            <option value ="150">150</option>
            <option value ="200">200</option>
             <option value ="300,800">300-800</option>
          </select>
<input type="submit" value="送信">
</form>

<%@include file="../footer.html" %>