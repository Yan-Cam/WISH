package openBean;

import java.sql.Timestamp;

public class essayBean {
	private int essayId; 
	private String essayDesc ;
	private String essayTitle; 
	private String essayPic ;
	private String likes;
	private String views; 
	private String comments;
	private String classfication;
	private String essayUrl;
	private Timestamp publishDate;
	public essayBean(int essayId, String essayDesc, String essayTitle, String essayPic, String likes, String views,String comments,String classfication,String essayUrl,Timestamp publishDate) {
		this.essayId = essayId;
		this.essayTitle = essayTitle;
		this.essayPic = essayPic;
		this.likes = likes;
		this.views = views;
		this.comments = comments;
		this.classfication = classfication;
		this.essayUrl = essayUrl;
		this.publishDate = publishDate;
		this.essayDesc = essayDesc;
	}
	public String getClassfication() {
		return classfication;
	}
	public void setClassfication(String classfication) {
		this.classfication = classfication;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getEssayDesc() {
		return essayDesc;
	}
	public void setEssayDesc(String essayDesc) {
		this.essayDesc = essayDesc;
	}
	public int getEssayId() {
		return essayId;
	}
	public void setEssayId(int essayId) {
		this.essayId = essayId;
	}
	public String getEssayPic() {
		return essayPic;
	}
	public void setEssayPic(String essayPic) {
		this.essayPic = essayPic;
	}
	public String getEssayTitle() {
		return essayTitle;
	}
	public void setEssayTitle(String essayTitle) {
		this.essayTitle = essayTitle;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	public String getEssayUrl() {
		return essayUrl;
	}
	public void setEssayUrl(String essayUrl) {
		this.essayUrl = essayUrl;
	}
	public Timestamp getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}
}
