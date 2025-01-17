package chapter21;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/chapter21/el7"})
public class EL2 extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {

		request.setAttribute("names", new String[]{"Alice", "Bob", "Charlie"});
		
		List<String> fruits = Arrays.asList("Apple", "Banana", "Cherry");
		request.setAttribute("fruits", fruits);

		Map<String, String> capitals = new HashMap<>();
		capitals.put("Japan", "Tokyo");
		capitals.put("USA", "Washington, D.C.");
		capitals.put("France", "Paris");
		request.setAttribute("capitals", capitals);
		
		request.setAttribute("isAdmin", true);



		request.getRequestDispatcher("el7.jsp")
			.forward(request, response);
	}
}
