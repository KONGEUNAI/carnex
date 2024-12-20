package org.carnex.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.persistence.GoodsPersistence;
import org.carnex.goods.vo.GoodsVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	private GoodsPersistence goodsPersistence;
	
	@Override
	public void register(GoodsVO gvo) throws Exception {
		goodsPersistence.register(gvo);
	}
	
	@Override
	public List<GoodsVO> getGoodsList(String keyword) throws Exception {
		return goodsPersistence.getGoodsList(keyword);
	}
	
	@Override
	public List<GoodsVO> infiniteScroll(int cnoToStart, String keyword) throws Exception {
		return goodsPersistence.infiniteScroll(cnoToStart, keyword);
	}
	
	@Override
	public List<GoodsVO> goodsPartList(String car_status, String keyword, String car_type) throws Exception {
		return goodsPersistence.goodsPartList(car_status, keyword, car_type);
	}
	
	@Override
	public int goodsCount() throws Exception {
		return goodsPersistence.goodsCount();
	}
	
	@Override
	public int goodsCompCount() throws Exception {
		return goodsPersistence.goodsCompCount();
	}
	
	@Override
	public int goodsIngCount() throws Exception {
		return goodsPersistence.goodsIngCount();
	}
	
	@Override
	public int goodsTypeCount(String car_type) throws Exception {
		return goodsPersistence.goodsTypeCount(car_type);
	}
	
	@Override
	public GoodsVO getCarOne(int car_num) throws Exception {
		return goodsPersistence.getCarOne(car_num);
	}
	
	@Override
	public GoodsVO getCarMine(int car_num) throws Exception {
		return goodsPersistence.getCarMine(car_num);
	}
	
	@Override
	public void modify(GoodsVO gvo) throws Exception {
		goodsPersistence.modify(gvo);
	}
	
	@Override
	public void delete(int car_num) throws Exception {
		goodsPersistence.delete(car_num);
	}
	
	@Transactional
	@Override
	public void makeRev(ReservationVO revvo) throws Exception {
		goodsPersistence.makeRev(revvo);
		goodsPersistence.updateRevStatus(revvo.getCar_num());
	}
	
	@Override
	public ReservationVO getRevOne(ReservationVO revvo) throws Exception {
		return goodsPersistence.getRevOne(revvo);
	}
	
	@Override
	public ReservationVO revSuccess(int rev_no) throws Exception {
		return goodsPersistence.revSuccess(rev_no);
	}
	
	@Override
    public List<ReservationVO> getRevList(String staff_id) throws Exception {
        return goodsPersistence.getRevList(staff_id);
    }
	
	@Override
	public void deleteReserve(int car_num) throws Exception {
		goodsPersistence.deleteReserve(car_num);
	}
	
	@Override
	public void updateCarStatus(int car_num) throws Exception {
		goodsPersistence.updateCarStatus(car_num);
	}
	
	@Override
	public List<GoodsVO> firstGoods() throws Exception {
		return goodsPersistence.firstGoods();
	}
	
	@Override
	public List<GoodsVO> secondGoods() throws Exception {
		return goodsPersistence.secondGoods();
	}
}
