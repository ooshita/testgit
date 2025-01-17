package chapter14;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.stream.Stream;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet(urlPatterns={"/chapter14/select1"})
public class Select1 extends HttpServlet {
	public void doPost (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup(
				"java:/comp/env/jdbc/book");
			Connection con=ds.getConnection();

			String price=request.getParameter("price");
			String [] prices;
			PreparedStatement st;
			ResultSet rs;
			
			String[] sql= {
					"select * from product where price =?;",
					"select * from product where price between ? and ?;"
					};
			
			
			if(!(price.contains(","))) {
				int iPrice = Integer.parseInt(price);
				
				
				st=con.prepareStatement(sql[0]
						);
				
				st.setInt(1, iPrice);
				
				rs=st.executeQuery();
							
				while (rs.next()) {
					out.println(rs.getInt("id"));
					out.println("：");
					out.println(rs.getString("name"));
					out.println("：");
					out.println(rs.getInt("price"));
					out.println("<br>");
				}
				
				st.close();}		
		
			
		
			else {
				prices = price.split(",");
				int[] iPrices = Stream.of(prices).mapToInt(Integer::parseInt).toArray();
				
				st=con.prepareStatement(sql[1]);
				st.setInt(1, iPrices[0]);
				st.setInt(2, iPrices[1]);
				
				rs=st.executeQuery();
				
				while (rs.next()) {
					out.println(rs.getInt("id"));
					out.println("：");
					out.println(rs.getString("name"));
					out.println("：");
					out.println(rs.getInt("price"));
					out.println("<br>");
				}
				
				st.close();}
				
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}
