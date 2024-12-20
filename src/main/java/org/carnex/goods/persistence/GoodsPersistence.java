package org.carnex.goods.persistence;

import java.util.List;
import java.util.Map;

import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.vo.GoodsVO;

public interface GoodsPersistence {
	public void register(GoodsVO gvo) throws Exception;
	
	public List<GoodsVO> getGoodsList(String keyword) throws Exception;
	
	public List<GoodsVO> infiniteScroll(int cnoToSTart, String keyword) throws Exception;
	
	public List<GoodsVO> goodsPartList(String car_status, String keyword, String car_type) throws Exception;

	public GoodsVO getCarOne(int car_num) throws Exception;
	
	public GoodsVO getCarMine(int car_num) throws Exception;
	
	public void modify(GoodsVO gvo) throws Exception;
	
	public void delete(int car_num) throws Exception;
	
	public void updateStatus(GoodsVO gvo) throws Exception;
	
	public int goodsCount() throws Exception;
	
	public int goodsCompCount() throws Exception;
	
	public int goodsIngCount() throws Exception;
	
	public int goodsTypeCount(String car_type) throws Exception;
	
	public List<Map<String, Object>> getAllCount() throws Exception;
	
	public void makeRev(ReservationVO revvo) throws Exception;
	
	public void updateRevStatus(int car_num) throws Exception;
	
	public ReservationVO getRevOne(ReservationVO revvo) throws Exception;
	
	public ReservationVO revSuccess(int rev_no) throws Exception;
	
	public List<ReservationVO> getRevList(String staff_id) throws Exception;
	
	public void deleteReserve(int car_num) throws Exception;
	
	public void updateCarStatus(int car_num) throws Exception;
	
	public List<GoodsVO> firstGoods() throws Exception;
	
	public List<GoodsVO> secondGoods() throws Exception;
}
