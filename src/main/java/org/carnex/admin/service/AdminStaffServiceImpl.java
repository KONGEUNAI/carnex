package org.carnex.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.carnex.admin.persistence.AdminStaffPersistence;
import org.carnex.admin.vo.StaffVO;
import org.carnex.goods.persistence.GoodsPersistence;
import org.carnex.user.persistence.UserMemberPersistence;
import org.carnex.util.DashBoardDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminStaffServiceImpl implements AdminStaffService {

	@Inject
	private AdminStaffPersistence adminStaffPersistence;
	
	@Inject
	private UserMemberPersistence userMemberPersistence;
	
	@Inject
	private GoodsPersistence goodsPersistence;
	
	@Override
	public void register(StaffVO svo) throws Exception {
		adminStaffPersistence.register(svo);
	}
	
	@Override
	public StaffVO getStaffOne(String staff_id) throws Exception {
		return adminStaffPersistence.getStaffOne(staff_id);
		
	}
	
	@Override
	public List<StaffVO> getStaffList() throws Exception {
		return adminStaffPersistence.getStaffList();
	}
	
	@Override
	public List<StaffVO> getStaffPartList(int staff_part) throws Exception {
		return adminStaffPersistence.getStaffPartList(staff_part);
	}
	
	@Override
	public int getCount() throws Exception {
		return adminStaffPersistence.getCount();
	}
	
	@Override
	public int getPartCount(int staff_part) throws Exception {
		return adminStaffPersistence.getPartCount(staff_part);
	}
	
	@Override
	public void modify(StaffVO svo) throws Exception {
		adminStaffPersistence.modify(svo);
	}
	
	@Override
	public void delete(String staff_id) throws Exception {
		adminStaffPersistence.delete(staff_id);
	}
	
	@Transactional
	@Override
	public DashBoardDTO getDashBoard() throws Exception {
		DashBoardDTO dbdto = new DashBoardDTO();
		int staff_count = adminStaffPersistence.getCount();
		int member_count = userMemberPersistence.getMemberCount();
		int car_comp = goodsPersistence.goodsCompCount();
		int car_ing = goodsPersistence.goodsIngCount();
		dbdto.setStaff_count(staff_count);
		dbdto.setMember_count(member_count);
		dbdto.setCar_comp(car_comp);
		dbdto.setCar_ing(car_ing);
		
        	List<Map<String, Object>> getAllCount = goodsPersistence.getAllCount();
        	List<Map<String, Object>> getUserWishCount = userMemberPersistence.getUserWishCount();

		dbdto.setCarTypeCounts(getAllCount);
		
        	dbdto.setUserWishCounts(getUserWishCount);
		
		List<Map<String, Object>> userWishPrice = userMemberPersistence.getUserWishPrice();
		System.out.println("=========="+userWishPrice);
		dbdto.setUserWishPrice(userWishPrice);

		return dbdto;
	}
	
}
