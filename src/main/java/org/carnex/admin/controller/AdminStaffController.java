package org.carnex.admin.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.carnex.admin.service.AdminStaffServiceImpl;
import org.carnex.admin.vo.StaffVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/staff/*")
public class AdminStaffController {
	
	@Inject
	private AdminStaffServiceImpl adminStaffService;
	
	@Inject
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(StaffVO svo, @RequestParam("staffImg") MultipartFile file) throws Exception {
		
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\staff";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        svo.setStaff_img("/resources/img/staff/"+fileName);
		}
		
		String staff_pwd = svo.getStaff_pwd();
		String encode_pwd = bCryptPasswordEncoder.encode(staff_pwd);
		svo.setStaff_pwd(encode_pwd);
		
		adminStaffService.register(svo);
		
		return "redirect:/admin/staff/list?num=1";
	}
	
	@GetMapping("/mypage")
	public void getStaffOne(@RequestParam("staff_id") String staff_id, Model model) throws Exception{
		StaffVO svo = adminStaffService.getStaffOne(staff_id);
		model.addAttribute("staff", svo);
	}
	
	@GetMapping("/list")
	public void getStaffList(Model model) throws Exception {
		List<StaffVO> staffList = adminStaffService.getStaffList();
		model.addAttribute("staffList", staffList);
	}
	
	@GetMapping("/partlist")
	public String getStaffPartList(Model model, @RequestParam("staff_part") int staff_part) throws Exception {
		
		List<StaffVO> staffList = adminStaffService.getStaffPartList(staff_part);
		model.addAttribute("staffList", staffList);
		
		return "/admin/staff/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("staff_id") String staff_id, Model model) throws Exception{
		StaffVO svo = adminStaffService.getStaffOne(staff_id);
		model.addAttribute("modify", svo);
	}
	
	@PostMapping("/modify")
	public String modify(StaffVO svo, HttpSession session,
			@RequestParam("staffImg") MultipartFile file) throws Exception{
		String pwd = svo.getStaff_pwd();
		String encodePwd = null;
		encodePwd = bCryptPasswordEncoder.encode(pwd);
		svo.setStaff_pwd(encodePwd);
		StaffVO sessvo = (StaffVO) session.getAttribute("staffsess");
		String id = sessvo.getStaff_id();
		String url = null;
		
		// 수정 페이지에서 업로드한 이미지가 없으면 기존 DB에 저장된 경로로 다시 저장
		if (file.isEmpty()) {
			String staff_id = svo.getStaff_id();
			StaffVO dbsvo = adminStaffService.getStaffOne(staff_id);
			String staff_img = dbsvo.getStaff_img();
			svo.setStaff_img(staff_img);
		}
		
		// 수정 페이지에서 업로드한 이미지가 있으면 DB에 새로 저장
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\staff";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        svo.setStaff_img("/resources/img/staff/"+fileName);
		}
		adminStaffService.modify(svo);
		
		if (id.equals("admin")) {
			url = "redirect:/admin/staff/list?num=1";
		} else {
			url = "redirect:/admin/staff/mypage?staff_id="+svo.getStaff_id();
		}
		
		return url;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("staff_id") String staff_id) throws Exception {
		adminStaffService.delete(staff_id);
		return "redirect:/admin/staff/list?num=1";
	}
	
}