package org.carnex.contract.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.contract.vo.ContractVO;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class ContractPersistenceImpl implements ContractPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.contract.mappers.goods";
	
	@Override
	public void insertCard(CardVO cardvo) throws Exception {
		sql.insert(namespace+".insertCard", cardvo);
	}

	@Override
	public void writeContract(GoodsVO gvo, MemberVO mvo, CardVO cvo, String sign) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gvo", gvo);
		map.put("mvo", mvo);
		map.put("cvo", cvo);
		map.put("sign", sign);
		sql.insert(namespace+".writeContract", map);
	}
	
	@Override
	public int getCount(String Staff_id) throws Exception {
		return sql.selectOne(namespace+".getCount", Staff_id);
	}
	
	@Override
	public ContractVO getContractOne(int con_no) throws Exception {
		return sql.selectOne(namespace+".getContractOne", con_no);
	}
	
	@Override
	public List<ContractVO> getContractList() throws Exception {
		return sql.selectList(namespace+".getContractList");
	}
	
	@Override
	public void deleteReserve(GoodsVO gvo) throws Exception {
		sql.delete(namespace+".deleteReserve", gvo);
	}
	
	@Override
	public List<ContractVO> getUserCon(String user_id) throws Exception {
		return sql.selectList(namespace+".getUserCon", user_id);
	}
}
