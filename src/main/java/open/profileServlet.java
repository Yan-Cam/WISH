package open;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import openBean.essayBean;
import openBean.loginBean;

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

/**
 * Servlet implementation class profileServlet
 */
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private java.sql.Statement sql;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	try {
    		req.setCharacterEncoding("utf-8");
    		String condition = null;
    		String select = req.getParameter("select").trim();
    		loginBean user = (loginBean)req.getSession().getAttribute("user");
    		int uid = user.getUid();
    		if (select.equals("历史")) {
				condition = "select a.essayId, a.essayDesc, a.essayTitle, a.essayPic, a.likes, a.views, a.comments, a.classfication, a.essayUrl, a.publishDate from essayinfo a, historyinfo b where a.essayid = b.essayid and b.uid = "+uid+"";
			} 
    		else if(select.equals("最近的"))
			{
    			condition = "select * from essayinfo order by publishdate desc";
			} else {
				condition = "select a.essayId, a.essayDesc, a.essayTitle, a.essayPic, a.likes, a.views, a.comments, a.classfication, a.essayUrl, a.publishDate from essayinfo a, likeinfo b where a.essayid = b.essayid and b.uid = "+uid+"";
			}
			Context context = new InitialContext();
			Context contextNeeded = (Context)context.lookup("java:comp/env");
			DataSource ds = (DataSource)contextNeeded.lookup("newssystem");
			con = ds.getConnection();
			sql = con.createStatement();
			ArrayList<essayBean> essayLists = new ArrayList();
			//if () {
				ResultSet rs = sql.executeQuery(condition);
					while (rs.next()) {
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
					String json = JSON.toJSONString(essayLists);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
