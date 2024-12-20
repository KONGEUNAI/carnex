package org.carnex.admin.persistence;

import java.util.List;

import org.carnex.admin.vo.StaffVO;

public interface AdminStaffPersistence {
	
	public void register(StaffVO svo) throws Exception;
	
	public StaffVO getStaffOne(String staff_id) throws Exception;
	
	public List<StaffVO> getStaffList() throws Exception;
	
	public List<StaffVO> getStaffPartList(int staff_part) throws Exception;
	
	public int getCount() throws Exception;
	
	public int getPartCount(int staff_part) throws Exception;
	
	public void modify(StaffVO svo) throws Exception;
	
	public void delete(String staff_id) throws Exception;
	
}
