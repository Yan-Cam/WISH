package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import openBean.essayBean;

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

import adminBean.usermBean;

/**
 * Servlet implementation class newsmServlet
 */
public class newsmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private java.sql.Statement sql;        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsmServlet() {
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
			String condition = "select * from essayinfo";
			sql = con.createStatement();
			ArrayList<essayBean> essayLists = new ArrayList();
			//if () {
			int count = 0;
				ResultSet rs = sql.executeQuery(condition);
					while (rs.next()) {
						count++;
						int essayId = rs.getInt("essayId");
						String essayDesc = rs.getString("essaydesc");
						String essayTitle = rs.getString("essaytitle");
						String essayPic = rs.getString("essaypic");
						String likes = rs.getString("likes");
						String views = rs.getString("views"); 
						String comments = rs.getString("comments");
						String classfication = rs.getString("classfication");
						String essayUrl = rs.getString("essayurl");
						Timestamp publishDate = rs.getTimestamp("publishDate");
						essayBean essay = new essayBean(essayId, essayDesc, essayTitle, essayPic, likes, views, comments, classfication, essayUrl, publishDate);
						essayLists.add(essay);
					}
					String total = "{\"total\":"+count+",\"rows\":";
					String json = JSON.toJSONString(essayLists);
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