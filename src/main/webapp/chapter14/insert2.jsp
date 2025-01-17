
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.html"%>
<p>追加する商品を入力してください。</p>
<form action="insert" method="post" id="insertForm">
	商品名<input type="text" name="name"> 価格 <input type="text" name="price"> <input type="submit" value="追加">
</form>


<p>削除する商品IDを入力してください。</p>
<form action="delete" method="post" id="deleteForm">
    商品ID<input type="text" name="id"> <input type="submit" value="削除">
</form>

<p>更新する商品の情報を入力してください。</p>
<form action="update" method="post" id="updateForm">
    商品ID<input type="text" name="id">
    新しい商品名<input type="text" name="name">
        新しい金額<input type="text" name="price">
    <input type="submit" value="更新">
</form>

<p>更新する商品の情報を入力してください。</p>
<form action="update_tr" method="post" id="updateForm2">
    商品ID<input type="text" name="id">
    新しい商品名<input type="text" name="name">
        新しい金額<input type="text" name="price">
    <input type="submit" value="更新">
</form>

<script>
let array = new Array(4);
array = ["insertForm","deleteForm","updateForm","updateForm2"];
for(i = 0; i <array.length; i++){
document.getElementById(array[i]).addEventListener('submit', function(event) {
  var keyword = document.getElementById('keyword').value;
  if (keyword.trim().length > 10) {
    alert('キーワードは10文字以内で入力してください。');
    event.preventDefault();  // フォームの送信を防止
  }}
});

<%@include file="../footer.html"%>

