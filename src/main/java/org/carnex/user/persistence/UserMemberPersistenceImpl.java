package org.carnex.user.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.board.vo.BoardVO;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.user.vo.AddressVO;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserMemberPersistenceImpl implements UserMemberPersistence {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.user.mappers.member";
	
	@Override
	public List<BoardVO> getMyBoard(String user_nick) throws Exception {

		return sql.selectList(namespace+".getMyBoard", user_nick);
	}
	
//	@Override
//	public List<OrderVO> getMyOrder(String user_id) throws Exception {
//		System.out.println("user_id"+user_id);
//		return sql.selectList(namespace+".getMyOrder", user_id);
//	}
	
	@Override
	public String getDBPassword(String user_id) throws Exception {
		return sql.selectOne(namespace+".getDBPassword", user_id);
	}
	
	@Override
	public List<AddressVO> getAddrList(AddressVO addr) throws Exception {
		return sql.selectList(namespace+".address", addr);
	}
	
	@Override
	public int insertMember(MemberVO mvo) throws Exception {
		return sql.insert(namespace+".register", mvo);
	}
	
	@Override
	public void insertopMember(MemberVO mvo) throws Exception {
		sql.update(namespace+".insertop", mvo);
	}
	
	@Override
	public MemberVO mypage(String user_id) throws Exception {
		return sql.selectOne(namespace+".mypage", user_id);
	}
	
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		
		return sql.selectList(namespace+".memberlist");
	}
	
	@Override
	public int getCount() throws Exception {
		return sql.selectOne(namespace + ".getCount");
	}
	
	@Override
	public int getNgCount() throws Exception {
		return sql.selectOne(namespace + ".getNgCount");
	}
	
	@Override
	public void modify(MemberVO mvo) throws Exception {
		sql.update(namespace+".modify", mvo);
	}
	
	@Override
	public void userModify(MemberVO mvo) throws Exception {
		sql.update(namespace+".userModify", mvo);
	}
	
	@Override
	public void delete(MemberVO mvo) throws Exception {
		sql.delete(namespace+".delete", mvo);
	}
	
	@Override
	public List<MemberVO> getNgList() throws Exception {
		return sql.selectList(namespace+".nglist");
	}
	
	@Override
	public int regCard(CardVO cvo) throws Exception {
	    int result = 0;
	    result = sql.insert(namespace + ".regCard", cvo);
	    return result;
	}

	@Override
	public List<CardVO> getCardList(String user_id) throws Exception {
		return sql.selectList(namespace+".cardList", user_id);
	}
	
	@Override
	public void cardDelete(int card_num) throws Exception {
		sql.delete(namespace+".cardDelete", card_num);
	}
	
	@Override
	public CardVO getCard(int card_num) throws Exception {
		return sql.selectOne(namespace+".getCard", card_num);
	}
	
	@Override
	public void cardModify(CardVO cvo) throws Exception {
		sql.update(namespace+".cardModify", cvo);
	}
	
	@Override
	public int getMemberCount() throws Exception {
		return sql.selectOne(namespace+".getMemberCount");
	}
	
	@Override
	public List<Map<String, Object>> getUserWishCount() throws Exception {
		return sql.selectList(namespace+".getUserWishCount");
	}
	
	@Override
	public List<Map<String, Object>> getUserWishPrice() throws Exception {
		return sql.selectList(namespace+".getUserWishPrice");
	}
	
	@Override
	public ReservationVO getRevOne(int rev_no) throws Exception {
		return sql.selectOne(namespace+".getRevOne", rev_no);
	}

	@Override
	public void revModify(ReservationVO revvo) throws Exception {
		sql.update(namespace+".revModify", revvo);
	}
	
	@Override
	public List<ReservationVO> getRevUser(String user_id) throws Exception {
		return sql.selectList(namespace+".getRevUser", user_id);
	}
	
	@Override
	public void deleteRev(String user_id, int rev_no) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_id", user_id);
		map.put("rev_no", rev_no);
		sql.delete(namespace+".deleteRev", map);
	}
}
