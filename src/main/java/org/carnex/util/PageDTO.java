package org.carnex.util;

import lombok.Data;

@Data
public class PageDTO {
	
	private int num; 
	private int count;
	
	private int displayPost; 
	private int postNum = 12; 
	
	private int pageNum; 
	private int pageNumCnt = 5; 
	private int startPageNum;
	private int endPageNum; 
	
	private boolean prev; 
	private boolean next; 
	
	private String searchType;
	private String keyword;
	private String searchTypeKeyword;
	
	public void setSearchTypeKeyword(String searchType, String keyword) {
		if (searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		} else {
			searchTypeKeyword = "&amp;searchType="+searchType+"&amp;keyword="+keyword;
		}
	}
	
	public String getSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType="+searchType+"&keyword="+keyword;
		}
	}

	
	public void setCount(int count) {
		this.count = count;
		pageCalc();
	}
	
	private void pageCalc() {
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt)) * pageNumCnt;

		startPageNum = endPageNum - (pageNumCnt-1);

		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		
		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp; // 15를 저장하고 있는 endPageNum에 13을 저장
		}

		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= count ? false : true;
		
		displayPost = (num -1) * postNum;
	}
}
