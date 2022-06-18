package open;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import openBean.loginBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Servlet implementation class addListServlet
 */
public class addListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private java.sql.Statement sql;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

    	boolean boo = (request.getParameter("essayId").length() > 0);
    	try {
			Context context = new InitialContext();
			Context contextNeeded = (Context)context.lookup("java:comp/env");
			DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
			con = ds.getConnection();
			sql = con.createStatement();
			if (boo) {
	    		int id = Integer.valueOf(request.getParameter("essayId"));
	    		loginBean user = (loginBean)request.getSession().getAttribute("user");
	    		int uid = user.getUid();
	    		String condition = "insert into listinfo values("+id+","+uid+",null);";
				int rs = sql.executeUpdate(condition);
				if (rs > 0) {
				} else {
					
				}
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// TODO: handle finally clause
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
