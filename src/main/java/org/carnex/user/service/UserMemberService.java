package org.carnex.user.service;

import java.util.List;

import org.carnex.board.vo.BoardVO;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.user.vo.AddressVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;

public interface UserMemberService {
	
	public List<AddressVO> getAddrList(AddressVO addr) throws Exception;
	
	public int insertMember(MemberVO mvo) throws Exception;
	
	public void insertopMember(MemberVO mvo) throws Exception;
	
	public MemberVO mypage(String user_id) throws Exception;
	
	public String getDBPassword(String user_id) throws Exception;
	
	public List<BoardVO> getMyBoard(String user_nick) throws Exception;
	
//	public List<OrderVO> getMyOrder(String user_id) throws Exception;
	
	public List<MemberVO> getMemberList() throws Exception;
	
	public int getCount() throws Exception;
	
	public int getNgCount() throws Exception;
	
	public void modify(MemberVO mvo) throws Exception;
	
	public void userModify(MemberVO mvo) throws Exception;
	
	public void delete(MemberVO mvo) throws Exception;
	
	public List<MemberVO> getNgList() throws Exception;
	
	public int regCard(CardVO cvo) throws Exception;
	
	public List<CardVO> getCardList(String user_id) throws Exception;
	
	public void cardDelete (int card_num) throws Exception;
	
	public CardVO getCard(int card_num) throws Exception;
	
	public void cardModify (CardVO cvo) throws Exception;
	
	public ReservationVO getRevOne(int rev_no) throws Exception;
	   
	public void revModify(ReservationVO revvo) throws Exception;

	public List<ReservationVO> getRevUser(String user_id) throws Exception;
	
	public void deleteRev(String user_id, int rev_no) throws Exception;
}
