package org.carnex.util;

import lombok.Data;

@Data
public class PageDTO {
	
	private int num; // 현재 페이지 번호 (pageCalc() 내 공식으로 사용하므로 값을 설정해야함, 현재 페이지 번호를 얻어서 설정해야함)
	
	private int count; // 총 게시물 개수 (pageCalc() 내 공식으로 사용하므로 값을 설정해야함, 게시물 총 개수를 얻어서 설정해야함)
	
	private int displayPost; // 페이지 내 게시물의 시작 순번 (limit 술어의 첫번째 값 Controller에서 Persistence까지 전달필요)
	private int postNum = 12; // 페이지 내 게시물 개수 (limit 술어의 두번째 값 Controller에서 Persistence까지 전달필요)
	
	private int pageNum; // 블럭 페이지 번호 (1~5인지 6~10인지)
	private int pageNumCnt = 5; // 한 블럭페이지 내 페이징처리 개수 (이전과 다음 사이 숫자 개수)
	private int startPageNum; // 블럭 페이지에 첫번째 페이지 번호 (1, 6, ...)
	private int endPageNum; // 블럭 페이지에 마지막 페이지 번호 (5, 10, ...)
	
	private boolean prev; // 이전 버튼 표시 여부
	private boolean next; // 다음 버튼 표시 여부
	
	// 검색 유형과 검색어
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
		// 마지막 블럭 페이지 번호를 먼저 구하면 시작 블럭 페이지 번호를 쉽게 구할수 있음
		// 마지막 블럭 페이지 번호 = 현재 페이지 번호 / 블럭페이지에 표시할 페이지 개수 X 블럭 페이지에 표시할 페이지 개수
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt)) * pageNumCnt;
		
		// 시작 블럭페이지의 페이지 번호
		startPageNum = endPageNum - (pageNumCnt-1);
		
		// 게시물이 132개이상 180개 이하일 때 블럭 페이지 3개가 필요함 (1~12, 13~24, 25~36, 37~48, 49~60, ..., ~120, 121~132, ...~180)
		
		// 마지막 블럭 페이지 번호 재계산
		// 게시물 번호가 150번일 때 페이지 번호는 12.5개가 필요함 (올림처리)
		// endPageNum은 15이고 endPageNum_tmp는 13임 (11 ~ 15)
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		
		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp; // 15를 저장하고 있는 endPageNum에 13을 저장
		}
		
		// 이전, 다음 버튼 표시 여부 (조건을 만족하면 미표시하기 위해 false를 반환)
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * postNum >= count ? false : true;
		
		// 각 페이지에 출력할 '게시물 시작 번호'를 얻음
		displayPost = (num -1) * postNum;
	}
}