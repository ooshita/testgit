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

@WebServlet(urlPatterns={"/chapter14/all"})
public class All extends HttpServlet {
	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Page.header(out);
		try {
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup(
				"java:/comp/env/jdbc/book");
			Connection con=ds.getConnection();

			PreparedStatement st=con.prepareStatement(
			"SELECT * FROM PRODUCT where id!=10");
			ResultSet rs=st.executeQuery();

			while (rs.next()) {
				out.println(rs.getInt("id"));
				out.println("：");
				out.println(rs.getString("name"));
				out.println("：");
				out.println(rs.getInt("price"));
				out.println("<br>");
			}

			
//			st=con.prepareStatement(
//					"SELECT * FROM CUSTOMER");
//			rs=st.executeQuery();
//
//			 while (rs.next()) {
//					out.println(rs.getInt("id"));
//					out.println("：");
//					out.println(rs.getString("LOGIN"));
//					out.println("：");
//					out.println(rs.getString("password"));
//					out.println("<br>");
//				}
	
			
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		
	
		
		Page.footer(out);
	}
}
