package org.carnex.admin.service;

import javax.inject.Inject;

import org.carnex.admin.persistence.AdminConfirmPersistence;
import org.carnex.admin.vo.StaffVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class AdminConfirmServiceImpl implements AdminConfirmService {

	@Inject
	private AdminConfirmPersistence adminConfirmPersistence;
	
	@Override
	public MemberVO login(MemberVO mvo) throws Exception {
		
		return adminConfirmPersistence.login(mvo);
	}
	
	@Override
	public StaffVO stafflogin(StaffVO svo) throws Exception {
		return adminConfirmPersistence.stafflogin(svo);
	}
	
	@Override
	public MemberVO idCheck(String user_id) throws Exception {
		System.out.println("===== Service"+user_id);
		return adminConfirmPersistence.idCheck(user_id);
	}
	
	@Override
	public int nickCheck(String user_nick) throws Exception {
		System.out.println("===== Service"+user_nick);
		
		return adminConfirmPersistence.nickCheck(user_nick);
	}
	
	@Override
	public StaffVO staffIdCheck(String staff_id) throws Exception {
		return adminConfirmPersistence.staffIdCheck(staff_id);
	}
}
