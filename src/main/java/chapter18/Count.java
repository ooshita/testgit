package chapter18;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet(urlPatterns={"/chapter18/count"})
public class Count extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);

		Cookie[] cookies=request.getCookies();

		Integer count=null;
		int count2;

		if (cookies!=null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("count")) {
					count=Integer.valueOf(cookie.getValue());
					break;
				}
			}
		}
		


		if (count==null) count=0;
		count++;

		Cookie cookie=new Cookie("count", count.toString());
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);

		out.println(count);
		Page.footer(out);
	}
}
