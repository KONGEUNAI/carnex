package org.carnex.goods.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.vo.GoodsVO;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsPersistenceImpl implements GoodsPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.admin.mappers.goods";
	
	@Override
	public void register(GoodsVO gvo) throws Exception {
		sql.insert(namespace+".register", gvo);
	}
	
	@Override
	public List<GoodsVO> getGoodsList(String keyword) throws Exception {
		return sql.selectList(namespace+".getGoodsList", keyword);
	}
	
	@Override
	public List<GoodsVO> infiniteScroll(int cnoToStart, String keyword) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cnoToStart", cnoToStart);
		map.put("keyword", keyword);
		return sql.selectList(namespace+".infiniteScroll", map);
	}
	
	@Override
	public List<GoodsVO> goodsPartList(String car_status, String keyword, String car_type) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("car_type", car_type);
		map.put("car_status", car_status);
		
		return sql.selectList(namespace+".goodsPartList", map);
	}
	
	@Override
	public GoodsVO getCarOne(int car_num) throws Exception {
		return sql.selectOne(namespace+".getCarOne", car_num);
	}
	
	@Override
	public GoodsVO getCarMine(int car_num) throws Exception {
		return sql.selectOne(namespace+".getCarMine", car_num);
	}
	
	@Override
	public void modify(GoodsVO gvo) throws Exception {
		sql.update(namespace+".modify", gvo);
	}
	
	@Override
	public void delete(int car_num) throws Exception {
		sql.delete(namespace+".delete", car_num);
	}
	
	@Override
	public void updateStatus(GoodsVO gvo) throws Exception {
		sql.update(namespace+".updateStatus", gvo);
	}
	
	@Override
	public int goodsCount() throws Exception {
		return sql.selectOne(namespace+".goodsCount");
	}
	
	@Override
	public int goodsCompCount() throws Exception {
		return sql.selectOne(namespace+".goodsCompCount");
	}
	
	@Override
	public int goodsIngCount() throws Exception {
		return sql.selectOne(namespace+".goodsIngCount");
	}
	
	@Override
	public int goodsTypeCount(String car_type) throws Exception {
		return sql.selectOne(namespace+".goodsTypeCount", car_type);
	}
	
	@Override
	public List<Map<String, Object>> getAllCount() throws Exception {
		return sql.selectList(namespace+".getAllCount");
	}
	
	@Override
	public void makeRev(ReservationVO revvo) throws Exception {
		sql.insert(namespace+".makeRev", revvo);
	}
	
	@Override
	public void updateRevStatus(int car_num) throws Exception {
		sql.update(namespace+".updateRevStatus", car_num);
	}
	
	@Override
	public ReservationVO getRevOne(ReservationVO revvo) throws Exception {
		return sql.selectOne(namespace+".getRevOne", revvo);
	}
	
	@Override
	public ReservationVO revSuccess(int rev_no) throws Exception {
		return sql.selectOne(namespace+".revSuccess", rev_no);
	}
	
	@Override
	public List<ReservationVO> getRevList(String staff_id) throws Exception {
        return sql.selectList(namespace+".getRevList", staff_id);
    }
	
	@Override
	public void deleteReserve(int car_num) throws Exception {
		sql.delete(namespace+".deleteReserve", car_num);
	}
	
	@Override
	public void updateCarStatus(int car_num) throws Exception {
		sql.update(namespace+".updateCarStatus", car_num);
	}
	
	@Override
	public List<GoodsVO> firstGoods() throws Exception {
		return sql.selectList(namespace+".firstGoods");
	}
	
	@Override
	public List<GoodsVO> secondGoods() throws Exception {
		return sql.selectList(namespace+".secondGoods");
	}
}
