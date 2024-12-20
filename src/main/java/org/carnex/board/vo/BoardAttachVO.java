package org.carnex.board.vo;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid; // UUID
	private String uploadPath; // 업로드 경로
	private String fileName; // 원본 파일의 이름
	private String fileType; // 파일의 유형
	private int bno; // 게시물 번호
	
}
