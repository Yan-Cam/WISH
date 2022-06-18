package open;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import openBean.registerBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet (asyncSupported = true, value = "/open/registerServlet")
public class registerServlet extends HttpServlet {
	private Connection con = null;
	private java.sql.Statement sql;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	   public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	        // TODO Auto-generated constructor stub
	    	req.setCharacterEncoding("utf-8");
	    	String username = req.getParameter("username").trim();
	    	String password = req.getParameter("password").trim();
	    	boolean boo = (username.length() > 0) && (password.length() > 0);
	    	try {
				Context context = new InitialContext();
				Context contextNeeded = (Context)context.lookup("java:comp/env");
				DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
				con = ds.getConnection();
				String condition = "insert into userinfo values(null, '"+ username +"', '"+ password +"', '0', '0', '2022-5-12','暂未填写', 'https://www.yw11.com/uploads/allimg/160321/11-1603211K61MG.jpg', '无', '无');";
				sql = con.createStatement();
				if (boo) {
					int rs = sql.executeUpdate(condition);
					if (rs > 0) {
						success(req, res, username);
						res.sendRedirect("welcome.jsp");
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
	   protected void success(HttpServletRequest req, HttpServletResponse res, String username) {
		   registerBean register = null;
		   HttpSession session = req.getSession(true);
		   try {
			   register = (registerBean)session.getAttribute("register");
			   if (register == null) {
				   register = new registerBean(username, "已注册");
				   session.setAttribute("register", register);
				   register = (registerBean)session.getAttribute("register");
			   }
			   String name = register.getUsername();
			   if (name.equals(username)) {
				   register.setUsername(username);
				   register.setBackNews("已注册");
			} else {
				   register.setUsername(username);
				   register.setBackNews("已注册");
			}
			   
			  
		} catch (Exception e) {
			// TODO: handle exception
		}

	   }
	   
	   protected void fail() {
		   
	   }
}
