package org.carnex.board.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String user_id;
	private String staff_id;
	private int viewcnt;
	private int replycnt;
	private Date reg_date;
	private Date up_date;
	
	private List<BoardAttachVO> attachList;

}
