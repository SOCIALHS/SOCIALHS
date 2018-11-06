package com.bc.main.vo;

public class CommentVO {
	
	private int bbc_idx, bb_idx, chk;
	private String id, content, pw, regdate, title;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBbc_idx() {
		return bbc_idx;
	}
	public void setBbc_idx(int bbc_idx) {
		this.bbc_idx = bbc_idx;
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
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	@Override
	public String toString() {
		return "CommentVO [bbc_idx=" + bbc_idx + ", bb_idx=" + bb_idx + ", chk=" + chk + ", id=" + id + ", content="
				+ content + ", pw=" + pw + ", regdate=" + regdate + ", title=" + title + "]";
	}
	
	
	
	
}
