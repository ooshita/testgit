package chapter25;

import java.util.ArrayList;
import java.util.List;

import bean.Item;
import bean.Product;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class CartAdd2Action extends Action {

	@SuppressWarnings("unchecked")
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session=request.getSession();

		int id=Integer.parseInt(request.getParameter("id"));
		int number=Integer.parseInt(request.getParameter("number"));
		
		List<Item> cart=(List<Item>)session.getAttribute("cart");
		if (cart==null) {
			cart=new ArrayList<Item>();
			session.setAttribute("cart", cart);
		}

		for (Item i : cart) {
			if (i.getProduct().getId()==id) {
				i.setCount(i.getCount()+number);
				return "cart2.jsp";
			}
		}

		List<Product> list=(List<Product>)session.getAttribute("list");
		for (Product p : list) {
			if (p.getId()==id) {
				Item i=new Item();
				i.setProduct(p);
				i.setCount(number);
				cart.add(i);
			}
		}
		return "cart2.jsp";
	}
}
