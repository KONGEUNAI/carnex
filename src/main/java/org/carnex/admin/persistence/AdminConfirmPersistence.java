package org.carnex.admin.persistence;

import org.carnex.admin.vo.StaffVO;
import org.carnex.user.vo.MemberVO;

public interface AdminConfirmPersistence {
	
	public MemberVO login(MemberVO mvo) throws Exception;
	
	public StaffVO stafflogin(StaffVO svo) throws Exception;
	
	public MemberVO idCheck(String user_id) throws Exception;
	
	public int nickCheck(String user_nick) throws Exception;
	
	public StaffVO staffIdCheck(String staff_id) throws Exception;
}
