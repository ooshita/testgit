package chapter24;

import bean.Customer;
import dao.CustomerDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class Insertcs2Action extends Action {
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		String login=request.getParameter("login");
		String password=request.getParameter("password");

		Customer c=new Customer();
		c.setLogin(login);
		c.setPassword(password);
		CustomerDAO dao=new CustomerDAO();
		dao.insert(c);
		request.setAttribute("customer", c);
		return "registered2.jsp";

		
	}
}
