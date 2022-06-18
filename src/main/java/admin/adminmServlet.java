package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.alibaba.fastjson.JSON;

import adminBean.adminmBean;
import adminBean.usermBean;

/**
 * Servlet implementation class adminmServlet
 */
public class adminmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private java.sql.Statement sql;         
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

    	try {
			Context context = new InitialContext();
			Context contextNeeded = (Context)context.lookup("java:comp/env");
			DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
			con = ds.getConnection();
			String condition = "select * from admininfo";
			sql = con.createStatement();
			ArrayList<adminmBean> userLists = new ArrayList();
			//if () {
			int uid = 0;
			int count = 0;
			String username = null;
			String password = null;
				ResultSet rs = sql.executeQuery(condition);
					while (rs.next()) {
						count++;
						uid = rs.getInt("uid");
						username = rs.getString("username");
						password = rs.getString("password");
						adminmBean user = new adminmBean(username, password,uid);
						userLists.add(user);
					}
					String total = "{\"total\":"+count+",\"rows\":";
					String json = JSON.toJSONString(userLists);
					json = total + json + "}";
			
				        res.setCharacterEncoding("utf-8");
				        res.setContentType("application/json");
				        res.getWriter().write(json);
				        
				//} else {
					//System.out.println("出错");
				//}

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

}