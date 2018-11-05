package com.bc.study.dao;

public class Paging {
	private int totalCount; //전체 게시물 갯수
	private int pageNum; //현재 페이지 번호
	private int contentNum = 10; //한 페이지에 들어갈 게시물 갯수
	
	private int currentBlock; //현재 블록
	private int lastBlock; //마지막 블록
	
	private int startPage = 1; //현재 블록의 첫 페이지
	private int endPage = 5; //현재 블록의 마지막 페이지
	
	private boolean next; //다음페이지로 (->)
	private boolean prev = false; //이전페이지로 (<-)
	
	
	public void PrevNext(int pageNum) {
		if(pageNum > 0 && pageNum < 6) {
			setPrev(false);
			setNext(true);
		} else if (getCurrentBlock() == getLastBlock()) {
			setPrev(true);
			setNext(false);
		} else {
			setPrev(true);
			setNext(true);

		}
	}
	
	
	//전체 페이지 수 계산
	public int calcPage(int totalCount, int countNum) {
		int totalPage = totalCount / contentNum;
		if (totalCount%countNum > 0) {
			totalPage++;
		}
		return totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getContentNum() {
		return contentNum;
	}

	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int pageNum) {
		this.currentBlock = pageNum / 5;
		if (pageNum%5 > 0) {
			this.currentBlock++;
		}
	}

	public int getLastBlock() {
		return lastBlock;
	}

	public void setLastBlock(int totalCount) {
		this.lastBlock = totalCount / (5 * this.totalCount);
		if (totalCount %(5 * this.totalCount) > 0) {
			this.lastBlock++;
		}
	}

	public int getStartPage() {
		return (currentBlock * 5) - 4;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int getLastBlock, int getCurrentBlock) {
		if (getLastBlock == getCurrentBlock) {
			this.endPage = calcPage(getTotalCount(), getContentNum());
		} else { this.endPage = getStartPage()+4; }
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	
	
	
	
	
	
	
}
