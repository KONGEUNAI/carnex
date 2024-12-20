package org.carnex.contract.service;

import java.util.List;

import org.carnex.contract.vo.ContractVO;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;

public interface ContractService {
	
	public void insertCard(CardVO cardvo) throws Exception;
	
	public void writeContract(GoodsVO gvo, MemberVO mvo, CardVO cvo, String sign) throws Exception;
	
	public int getCount(String Staff_id) throws Exception;
	
	public ContractVO getContractOne(int con_no) throws Exception;
	
	public List<ContractVO> getContractList() throws Exception;
	
	public List<ContractVO>  getUserCon (String user_id) throws Exception;
}
