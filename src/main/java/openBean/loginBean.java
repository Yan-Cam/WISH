package openBean;

import java.sql.Timestamp;

public class loginBean {
	private String username;
	private int uid;
	private String posts;
	private String fans;
	private Timestamp birth;
	private String phone;
	private String face;
	private String sex;
	private String recommendlist;
	private String backNews = "未登陆";
	public loginBean(int uid, String backNews, String username, String posts, String fans, Timestamp birth, String phone, String face, String sex, String recommendlist) {
		this.uid = uid;
		this.posts = posts;
		this.fans = fans;
		this.birth = birth;
		this.phone = phone;
		this.face = face;
		this.sex = sex;
		this.recommendlist = recommendlist;
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
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public String getFans() {
		return fans;
	}
	public void setFans(String fans) {
		this.fans = fans;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPosts() {
		return posts;
	}
	public void setPosts(String posts) {
		this.posts = posts;
	}
	public String getRecommendlist() {
		return recommendlist;
	}
	public void setRecommendlist(String recommendlist) {
		this.recommendlist = recommendlist;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}
