package org.carnex.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rno;
	private int bno;
	private String content;
	private String writer;
	private Date reg_date;
	private Date up_date;
	private String user_id;
	private String staff_id;
}
