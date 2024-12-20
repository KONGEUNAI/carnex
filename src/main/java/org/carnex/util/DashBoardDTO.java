package org.carnex.util;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class DashBoardDTO {
	
	private int staff_count;
	private int member_count;
	private int car_comp;
	private int car_ing;
	private List<Map<String, Object>> carTypeCounts;
	private List<Map<String, Object>> userWishCounts;
	private List<Map<String, Object>> userWishPrice;
	
}
