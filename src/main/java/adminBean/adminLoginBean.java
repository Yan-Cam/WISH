package adminBean;

public class adminLoginBean {
	private String username;
	private int uid;
	private String backNews = "未登陆";
	public adminLoginBean(int uid, String backNews, String username) {
		this.uid = uid;
		this.backNews = backNews;
		this.username = username;
	}
	public String getBackNews() {
		return backNews;
	}
	public int getUid() {
		return uid;
	}
	public String getUsername() {
		return username;
	}
	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
