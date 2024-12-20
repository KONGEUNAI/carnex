package org.carnex.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.admin.vo.StaffVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminConfirmPersistenceImpl implements AdminConfirmPersistence {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "org.admin.mappers.confirm";
	
	@Override
	public MemberVO login(MemberVO mvo) throws Exception {
		return sql.selectOne(namespace+".login", mvo);
	}

	@Override
	public StaffVO stafflogin(StaffVO svo) throws Exception {
		return sql.selectOne(namespace+".stafflogin", svo);
	}
	
	@Override
	public MemberVO idCheck(String user_id) throws Exception {
		return sql.selectOne(namespace+".idcheck", user_id);
	}
	
	@Override
	public int nickCheck(String user_nick) throws Exception {
		int result = sql.selectOne(namespace+".nickcheck", user_nick);
		return result;
	}
	
	@Override
	public StaffVO staffIdCheck(String staff_id) throws Exception {
		return sql.selectOne(namespace+".staffidcheck", staff_id);
	}
}
