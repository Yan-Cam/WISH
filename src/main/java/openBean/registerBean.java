package openBean;

public class registerBean {
	private String username;
	private String backNews = "未注册";;
	public registerBean(String username, String backNews) {
		this.username = username;
		this.backNews = backNews;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBackNews() {
		return backNews;
	}
	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
}
