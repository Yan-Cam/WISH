package adminBean;

public class adminmBean {
	private String username;
	private String password;
	private int uid;
	public adminmBean(String username,String password,int uid) {
		this.username = username;
		this.password = password;
		this.uid = uid;
	}
	public int getUid() {
		return uid;
	}
	public String getPassword() {
		return password;
	}
	public String getUsername() {
		return username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
