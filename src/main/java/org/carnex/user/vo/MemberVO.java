package org.carnex.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_nick;
	private String user_birth;
	private String user_gender;
	private String user_tel;
	private String user_zipcode;
	private String user_address;
	private String user_mail;
	private String user_wishcar;
	private String user_wishprice;
	private String user_path;
	private int user_type;
	private String user_drop;
	private String user_img;
	private String user_intro;
	private Date user_reg_date;
	private Date user_up_date;
}
