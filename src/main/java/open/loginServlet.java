package open;

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
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet (asyncSupported = true, value = "/open/loginServlet")
public class loginServlet extends HttpServlet {
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
				String condition = "select * from userinfo where username = '"+ username +"' and password = '"+ password +"';";
				sql = con.createStatement();
				if (boo) {
					ResultSet rs = sql.executeQuery(condition);
						int uid = 0;
						String posts = null;
						String fans = null;
						Timestamp birth = null;
						String phone = null;
						String face = null;
						String sex = null;
						String recommendlist = null;
						while (rs.next()) {
							uid = rs.getInt("uid");
							fans = rs.getString("fans");
							birth = rs.getTimestamp("birth");
							phone = rs.getString("phone");
							face = rs.getString("face");
							sex = rs.getString("sex");
							posts = rs.getString("posts");
							recommendlist = rs.getString("recommendlist");
							System.out.println(0);
						}
						success(req, res, username, uid, posts, fans, birth, phone, face, sex, recommendlist);
						res.sendRedirect("main.jsp");
					} else {
						System.out.println("出错");
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
	   protected void success(HttpServletRequest req, HttpServletResponse res, String username, int uid, String posts, String fans, Timestamp birth, String phone, String face, String sex, String recommendlist) {
		   loginBean user = null;
		   HttpSession session = req.getSession(true);
		   try {
			   user = (loginBean)session.getAttribute("user");
			   if (user == null) {
				   user = new loginBean(uid, "已登陆", username, posts, fans, birth, phone, face, sex, recommendlist);
				   session.setAttribute("user", user);
				   user = (loginBean)session.getAttribute("user");
			   }
			   String name = user.getUsername();
			   if (name.equals(username)) {
				   user.setBackNews("已登陆");
				   user.setUid(uid);
				   user.setUsername(username);
				   user.setFans(fans);
				   user.setPosts(posts);
				   user.setBirth(birth);
				   user.setFace(face);
				   user.setPhone(phone);
				   user.setRecommendlist(recommendlist);
			} else {
				   user.setBackNews("已登陆");
				   user.setUid(uid);
				   user.setUsername(username);
				   user.setFans(fans);
				   user.setPosts(posts);
				   user.setBirth(birth);
				   user.setFace(face);
				   user.setPhone(phone);
				   user.setRecommendlist(recommendlist);
			}
			   
			  
		} catch (Exception e) {
			// TODO: handle exception
		}

	   }
	   
	   protected void fail() {
		   
	   }
}
