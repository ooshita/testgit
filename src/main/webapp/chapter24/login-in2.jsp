<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@include file="../chapter25/menu.jsp" %>


 <style>    
     .error-message {
        color: #e74c3c;
        font-size: 0.9em;
        margin-top: 5px;
        display: none;
      }
      .success-message {
        color: #e74c3c;
        font-size: 0.9em;
        margin-top: 5px;
        display: none;
      }
 </style>   
<form id="validationForm" method="post">
<label for="loginI">ログイン名</label>
<input type="text" id="login" name="login"></p>
<div class="error-message" id="loginError">
  有効なログイン名を入力してください。
 </div>
<label for="passI">パスワード</label>
<input type="password" id="password" name="password"></p>
<div class="error-message" id="passError">
  有効なパスワードを入力してください。
 </div>
<p><input type="submit" value="ログイン"></p>
<div class="success-message" id="successMessage">
  すべての入力が有効です！
  </div>
</form>

    <!-- CDNを使ってValidator.jsを追加 scriptのすぐ上に書くこと -->
    <script src="https://cdn.jsdelivr.net/npm/validator@13.9.0/validator.min.js"></script>

<script>
	//ページ読み込み後に実行できるようにここに書く
	const form = document.getElementById("validationForm");
	
	// フォーム送信時のイベントリスナーを登録
    
        form.addEventListener("submit", function (event) {
            // 入力値を取得
            
            const loginInput = form.querySelector('input[name="login"]');
            const passInput = form.querySelector('input[name="password"]');
            const login = loginInput.value.trim();
            const pass = passInput.value.trim();

            
         // エラーメッセージ要素を取得
            const loginError = document.getElementById("loginError");
            const passError = document.getElementById("passError");

         // 初期化
         let isValid = true;
         loginError.style.display = "none";
         passError.style.display = "none";

         // ログイン名・nullの検証
         if (validator.isEmpty(login)) {
           loginError.style.display = "block";
           isValid = false;
         } else {
         // ログイン名・英数字のみの検証
    		if (!validator.isAlphanumeric(login)) {
    		loginError.style.display = "block";
         	isValid = false;}
         }
         // パスワード・nullの検証
         if (validator.isEmpty(pass)){
      	    passError.style.display = "block";
           isValid = false;
         } else {
         // パスワード・英数字のみの検証
	       if (!validator.isAlphanumeric(pass))
	       {passError.style.display = "block";
	         isValid = false;}
	       }

         // 検証結果に応じて処理を分岐
         if (isValid) {
           successMessage.style.display = "block";
           // フォームを送信する
           // `this` はフォーム要素を指す
           this.submit();
         } else {
           // 検証に失敗した場合、フォームの送信を防ぐ
           event.preventDefault();
         }

     });
 </script>

<%@include file="../footer.html" %>
