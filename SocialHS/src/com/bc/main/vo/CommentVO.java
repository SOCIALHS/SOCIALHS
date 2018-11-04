package com.bc.main.vo;

public class CommentVO {
	
	private int bbc_idx, bbs_idx;
	private String id, content, pw, regdate;
	
	
	
	public int getBbc_idx() {
		return bbc_idx;
	}
	public void setBbc_idx(int bbc_idx) {
		this.bbc_idx = bbc_idx;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "CommentVO [bbc_idx=" + bbc_idx + ", bbs_idx=" + bbs_idx + ", id=" + id + ", content=" + content
				+ ", pw=" + pw + ", regdate=" + regdate + "]";
	}
	
}
