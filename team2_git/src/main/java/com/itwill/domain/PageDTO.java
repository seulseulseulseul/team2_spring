package com.itwill.domain;

public class PageDTO {
	//한 화면에 보여줄 글 개수 설정
	private int pageSize;
	private String pageNum;
	private int currentPage;
	//시작하는 행번호 구하기
	private int startRow;
	private int endRow;
	
	//게시판 전체 글 개수
	private int count;
	
	//한페이지에 보여줄 페이지 개수 설정
	private int pageBlock;
	//시작하는 페이지 번호
	private int startPage;
	//끝나는 페이지 번호
	private int endPage;
	private int pageCount;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		//페이지 설정 메서드 호출
		init();
	}
	public void init() {
		//한페이지에 보여줄 페이지 개수 설정
		pageBlock=10;
		//시작하는 페이지 번호
		startPage = (currentPage-1)/pageBlock*pageBlock+1;
		//끝나는 페이지 번호
		endPage = startPage+pageBlock-1;
		pageCount = count/pageSize+(count%endPage==0?0:1);
		if(endPage>pageCount){
			//끝나는 페이지번호 = 전체 글 페이지 수
		 	endPage=pageCount;
		}
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}
