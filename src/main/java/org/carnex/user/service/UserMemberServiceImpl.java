package org.carnex.user.service;

import java.util.List;

import javax.inject.Inject;

import org.carnex.board.vo.BoardVO;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.persistence.GoodsPersistence;
import org.carnex.user.persistence.UserMemberPersistenceImpl;
import org.carnex.user.vo.AddressVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserMemberServiceImpl implements UserMemberService {

	@Autowired
	private UserMemberPersistenceImpl persistence;
	
	@Inject
	private GoodsPersistence goodsPersistence;
	
	@Override
	public List<AddressVO> getAddrList(AddressVO addr) throws Exception {
		return persistence.getAddrList(addr);
	}
	
	@Override
	public int insertMember(MemberVO mvo) throws Exception {
		return persistence.insertMember(mvo);
	}
	
	@Override
	public void insertopMember(MemberVO mvo) throws Exception {
		persistence.insertopMember(mvo);
	}
	
	@Override
	public MemberVO mypage(String user_id) throws Exception {
		return persistence.mypage(user_id);
		
	}
	
	@Override
	public String getDBPassword(String user_id) throws Exception {
		return persistence.getDBPassword(user_id);
	}
	
	@Override
	public List<BoardVO> getMyBoard(String user_nick) throws Exception {
		return persistence.getMyBoard(user_nick);
	}
	
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		return persistence.getMemberList();
	}
	
	@Override
	public int getCount() throws Exception {
		return persistence.getCount();
	}
	
	@Override
	public int getNgCount() throws Exception {
		return persistence.getNgCount();
	}
	
	@Override
	public void modify(MemberVO mvo) throws Exception {
		persistence.modify(mvo);
	}
	
	@Override
	public void userModify(MemberVO mvo) throws Exception {
		persistence.userModify(mvo);
	}
	
	@Override
	public void delete(MemberVO mvo) throws Exception {
		persistence.delete(mvo);
	}
	
	@Override
	public List<MemberVO> getNgList() throws Exception {
		return persistence.getNgList();
	}
	
	@Override
	public int regCard(CardVO cvo) throws Exception {
		return persistence.regCard(cvo);
	}
	
	@Override
	public List<CardVO> getCardList(String user_id) throws Exception {
		return persistence.getCardList(user_id);
	}
	
	@Override
	public void cardDelete(int card_num) throws Exception {
		persistence.cardDelete(card_num);
	}
	
	@Override
	public CardVO getCard(int card_num) throws Exception {
		return persistence.getCard(card_num);
	}

	@Override
	public void cardModify(CardVO cvo) throws Exception {
		persistence.cardModify(cvo);
	}
	
	@Override
	public ReservationVO getRevOne(int rev_no) throws Exception {
		return persistence.getRevOne(rev_no);
	}

	@Override
	public void revModify (ReservationVO revvo) throws Exception {
		persistence.revModify(revvo);
	}

	@Override
	public List<ReservationVO> getRevUser(String user_id) throws Exception {
		return persistence.getRevUser(user_id);
	}
	
	@Transactional
	@Override
	public void deleteRev(String user_id, int rev_no) throws Exception {
		ReservationVO rvo = persistence.getRevOne(rev_no);
		int car_num = rvo.getCar_num();
		goodsPersistence.updateCarStatus(car_num);
		persistence.deleteRev(user_id, rev_no);
	}
}
