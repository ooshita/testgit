package chapter25;

import java.util.List;

import bean.Item;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class Preview2Action extends Action {
	@SuppressWarnings("unchecked")
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session=request.getSession();

		if (session.getAttribute("customer")==null) {
			return "preview-error-login2.jsp";
		}

		List<Item> cart=(List<Item>)session.getAttribute("cart");
		if (cart==null || cart.size()==0) {
			return "preview-error-cart2.jsp";
		}

		return "purchase-in2.jsp";
	}
}
