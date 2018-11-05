package com.bc.study.dao;

public class PagingVO {
	private int nowPage = 1; 
	private int nowBlock = 1;
	private int numPerPage = 10;
	private int pagePerBlock = 5;
	private int totalRecord = 0;
	private int totalPage = 0;
	private int totalBlock = 0;
	private int beginContent = 0; //현재 페이지 첫 글번호
	private int endContent = 0; //현재 페이지 끝 글번호
	private int beginPage = 0;
	private int endPage = 0;
	
	public void setTotalPage() { 
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) totalPage++;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBeginContent() {
		return beginContent;
	}

	public void setBeginContent(int beginContent) {
		this.beginContent = beginContent;
	}

	public int getEndContent() {
		return endContent;
	}

	public void setEndContent(int endContent) {
		this.endContent = endContent;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	
	
}
