package org.carnex.contract.service;

import java.util.List;

import javax.inject.Inject;

import org.carnex.contract.persistence.ContractPersistence;
import org.carnex.contract.vo.ContractVO;
import org.carnex.goods.persistence.GoodsPersistence;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContractServiceImpl implements ContractService {

	@Inject
	private ContractPersistence contractPersistence;
	
	@Inject
	private GoodsPersistence goodsPersistence; 
	
	@Override
	public void insertCard(CardVO cardvo) throws Exception {
		contractPersistence.insertCard(cardvo);
	}
	
	@Transactional
	@Override
	public void writeContract(GoodsVO gvo, MemberVO mvo, CardVO cvo, String sign) throws Exception {
		contractPersistence.writeContract(gvo, mvo, cvo, sign);
		contractPersistence.deleteReserve(gvo);
		goodsPersistence.updateStatus(gvo);
	}
	
	@Override
	public int getCount(String Staff_id) throws Exception {
		return contractPersistence.getCount(Staff_id);
	}
	
	
	@Override
	public ContractVO getContractOne(int con_no) throws Exception {
		return contractPersistence.getContractOne(con_no);
	}
	
	@Override
	public List<ContractVO> getContractList() throws Exception {
		return contractPersistence.getContractList();
	}
	
	@Override
	public List<ContractVO>  getUserCon(String user_id) throws Exception {
		return contractPersistence.getUserCon(user_id);
	}
}
