package org.carnex.board.vo;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName; // 원본 파일의 이름
	private String uploadPath; // 업로드 경로
	private String uuid; // UUID
	private boolean image; // 이미지 여부

}
