package chapter14;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Page;

@WebServlet(urlPatterns={"/chapter14/search_2"})
public class Search_2 extends HttpServlet {
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

			String keyword=request.getParameter("keyword");
			String kind =request.getParameter("kind");
			String price=request.getParameter("price");
			String[] sql= {
					"select * from product_2 where (name like ? or kind like ?) and price>?",
					"select * from product_2 where (name like ? and kind like ?) and price=?"};
			String[] branch= {"円より高い商品は：","円と同じ価格の商品は："};

//			PreparedStatement st=con.prepareStatement(
//				"select * from product_2 where name like ? or kind like ? or price=?");
			
//			PreparedStatement st=con.prepareStatement(
//					"select * from product_2 where (name like ? or kind like ?) and price<=?");
//			
			for(int i=0;i <2;i++) {
			PreparedStatement st=con.prepareStatement(sql[i]
					);
			
			st.setString(1, "%"+keyword+"%");
			st.setString(2, "%"+kind+"%");
			st.setString(3, price);
			ResultSet rs=st.executeQuery();
			
			out.println(keyword +"　を含む商品もしくは"+kind+"　を含む種類で、"+price+branch[i]);
			out.println("<br>");
			

			while (rs.next()) {
				out.println(rs.getInt("id"));
				out.println("：");
				out.println(rs.getString("name"));
				out.println("：");
				out.println(rs.getInt("price"));
				out.println("<br>");
			}
			
			out.println("<br>");
			
			
			st.close();}
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}
}
