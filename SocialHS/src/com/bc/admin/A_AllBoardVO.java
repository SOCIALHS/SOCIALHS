package com.bc.admin;

public class A_AllBoardVO {
	private int bb_idx;
	private String id, title, regdate, bbs_name;
	
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	
	@Override
	public String toString() {
		return "A_AllBoardVO [bb_idx=" + bb_idx + ", id=" + id + ", title=" + title + ", regdate=" + regdate
				+ ", bbs_name=" + bbs_name + "]";
	}
	
	

}
