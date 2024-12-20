package org.carnex.goods.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	private int car_num;
	private String staff_id;
	private String car_brand;
	private String car_type;
	private String car_model;
	private int car_price;
	private String car_title;
	private String car_subtitle;
	private String car_content;
	private int	car_accident;
	private String car_zone;
	private String car_thumbimg;
	private String car_img;
	private String car_status;
	private Date car_reg_date;
	private Date car_up_date;
}
