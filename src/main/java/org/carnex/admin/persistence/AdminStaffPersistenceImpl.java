package org.carnex.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.admin.vo.StaffVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminStaffPersistenceImpl implements AdminStaffPersistence {

	@Inject
	private SqlSession sql;
	
	private static String namespace="org.admin.mappers.staff";
	
	@Override
	public void register(StaffVO svo) throws Exception {
		sql.insert(namespace+".register", svo);
	}
	
	@Override
	public StaffVO getStaffOne(String staff_id) throws Exception {
		return sql.selectOne(namespace+".getStaffOne", staff_id);
	}
	
	@Override
	public List<StaffVO> getStaffList() throws Exception {
		return sql.selectList(namespace+".getStaffList");
	}
	
	@Override
	public List<StaffVO> getStaffPartList(int staff_part) throws Exception {
		return sql.selectList(namespace+".getStaffPartList", staff_part);
	}
	
	@Override
	public int getCount() throws Exception {
		return sql.selectOne(namespace + ".getCount");
	}
	
	@Override
	public int getPartCount(int staff_part) throws Exception {
		return sql.selectOne(namespace + ".getPartCount", staff_part);
	}
	
	@Override
	public void modify(StaffVO svo) throws Exception {
		sql.update(namespace+".modify", svo);
	}
	
	@Override
	public void delete(String staff_id) throws Exception {
		sql.delete(namespace+".delete", staff_id);
	}
}