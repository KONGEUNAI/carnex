package org.carnex.contract.vo;

import java.util.Date;

import org.carnex.admin.vo.StaffVO;
import org.carnex.goods.vo.GoodsVO;

import lombok.Data;

@Data
public class ContractVO {
	private int con_no;
	private int car_num;
	private String staff_id;
	private int card_num;
	private String user_id;
	private String con_sign;
	private String con_status;
	private Date con_reg_date;
	
	private GoodsVO goodsVO;
	private StaffVO staffVO;
}
