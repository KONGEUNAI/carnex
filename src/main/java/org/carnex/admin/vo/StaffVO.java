package org.carnex.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class StaffVO {
	private String staff_id;
	private String staff_pwd;
	private String staff_name;
	private String staff_phone;
	private int staff_part;
	private int staff_type;
	private String staff_img;
	private String staff_intro;
	private Date staff_reg_date;
	private Date staff_up_date;
	private Date staff_out_date;
}