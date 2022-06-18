package open;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import openBean.registerBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

@WebServlet (asyncSupported = true, value = "/open/welcomeServlet")
public class welcomeServlet extends HttpServlet {
	private Connection con = null;
	private java.sql.Statement sql;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	   public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	        // TODO Auto-generated constructor stub
		   req.setCharacterEncoding("utf-8");
	    	String str = req.getParameter("recommendList").trim();
	    	boolean boo = (str.length() > 0);
	    	try {
	    		String username = ((registerBean)req.getSession().getAttribute("register")).getUsername();
				Context context = new InitialContext();
				Context contextNeeded = (Context)context.lookup("java:comp/env");
				DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
				con = ds.getConnection();
				String condition = "update userinfo set recommendlist = '"+str+"' where username = '"+username+"'";
				sql = con.createStatement();
				if (boo) {
					int rs = sql.executeUpdate(condition);
					if (rs > 0) {
						res.sendRedirect("login.jsp");
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
			}
	    } 
	   protected void fail() {
		   
	   }
	   }