package org.carnex.contract.vo;

import java.util.Date;

import org.carnex.admin.vo.StaffVO;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.vo.MemberVO;

import lombok.Data;

@Data
public class ReservationVO {
	private int rev_no;
	private String user_id;
	private String staff_id;
	private int car_num;
	private String rev_status;
	private String rev_time;
	private String rev_date;
	private Date rev_reg_date;
	
	private GoodsVO goodsVO;
	private StaffVO staffVO;
	private MemberVO memberVO;
}