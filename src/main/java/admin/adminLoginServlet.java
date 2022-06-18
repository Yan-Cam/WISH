package admin;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import openBean.loginBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import adminBean.adminLoginBean;

@WebServlet (asyncSupported = true, value = "/admin/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
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
	    	System.out.println(req);
	    	boolean boo = (username.length() > 0) && (password.length() > 0);
	    	try {
				Context context = new InitialContext();
				Context contextNeeded = (Context)context.lookup("java:comp/env");
				DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
				con = ds.getConnection();
				String condition = "select uid from admininfo where username = '"+ username +"' and password = '"+ password +"'";
				sql = con.createStatement();
				if (boo) {
					ResultSet rs = sql.executeQuery(condition);
					boolean isNotNull = rs.next();
					if (isNotNull == true) {
						int uid = 0;
						while (rs.next()) {
							uid = rs.getInt("uid");
						}
						success(req, res, username, uid);
						res.sendRedirect("index.jsp");
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
	   protected void success(HttpServletRequest req, HttpServletResponse res, String username, int uid) {
		   adminLoginBean adminUser = null;
		   HttpSession session = req.getSession(true);
		   try {
			   adminUser = (adminLoginBean)session.getAttribute("adminUser");
			   if (adminUser == null) {
				   adminUser = new adminLoginBean(uid, "已登陆", username);
				   session.setAttribute("user", adminUser);
				   adminUser = (adminLoginBean)session.getAttribute("adminUser");
			   }
			   String name = adminUser.getUsername();
			   if (name.equals(username)) {
				   adminUser.setBackNews("已登陆");
				   adminUser.setUid(uid);
				   adminUser.setUsername(username);
			} else {
				adminUser.setBackNews("已登陆");
				adminUser.setUid(uid);
				adminUser.setUsername(username);
			}
			   
			  
		} catch (Exception e) {
			// TODO: handle exception
		}

	   }
	   
	   protected void fail() {
		   
	   }

}
