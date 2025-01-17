package secure_page;

import java.io.IOException;

import bean.Customer;
import dao.CustomerDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/secure_page/login2") // "/login" ページにアクセスする
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	
    	// エンコード 
    	response.setContentType("text/html; charset=UTF-8"); 
    	request.setCharacterEncoding("UTF-8"); 
    	response.setCharacterEncoding("UTF-8");
    	
        HttpSession session = request.getSession();
    	
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        
        try {
        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.search(login,password);

        if (customer != null) {
            
        	session.setAttribute("customer", customer);
        	response.getWriter().println("ログイン成功: 認証に成功しました");
        	
        } else {
            // 認証失敗 → エラーメッセージを返す
            response.getWriter().println("ログイン失敗: ユーザー名またはパスワードが正しくありません");
        }
        }catch(Exception e){
        	response.getWriter().println("エラーが発生しました");
        }
    }
}

