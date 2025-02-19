package chapter25;

import java.util.List;

import bean.Item;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class CartRemove2Action extends Action {
	@SuppressWarnings("unchecked")
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session=request.getSession();

		int id=Integer.parseInt(request.getParameter("id"));

		List<Item> cart=(List<Item>)session.getAttribute("cart");

		for (Item i : cart) {
			if (i.getProduct().getId()==id) {
				cart.remove(i);
				break;
			}
		}

		return "cart2.jsp";
	}
}
