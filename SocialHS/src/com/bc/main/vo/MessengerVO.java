package com.bc.main.vo;

public class MessengerVO {
	
	private String title, content, send_id, recv_id;
	private int ms_idx, chk;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public int getMs_idx() {
		return ms_idx;
	}
	public void setMs_idx(int ms_idx) {
		this.ms_idx = ms_idx;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	@Override
	public String toString() {
		return "MessengerVO [title=" + title + ", content=" + content + ", send_id=" + send_id + ", recv_id=" + recv_id
				+ ", ms_idx=" + ms_idx + ", chk=" + chk + "]";
	}
	
	
	
}
