package org.carnex.user.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CardVO {
	private int card_num;
	private String user_id;
	private String card_bank;
	private String card_lastname;
	private String card_firstname;
	
	@DateTimeFormat(pattern = "yyyy-MM")
	private String card_expdate;
	
	private int card_cvc;
	private int card_digit1;
	private int card_digit2;
	private int card_digit3;
	private int card_digit4;
}
