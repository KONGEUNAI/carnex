package org.carnex.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.carnex.board.service.BoardService;
import org.carnex.user.service.UserMemberServiceImpl;
import org.carnex.user.vo.AddressVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin/member/*")
public class AdminMemberController {
	
	@Autowired
	private UserMemberServiceImpl service;
	
	@Inject
	private BoardService boardService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/register")
	public void join() throws Exception {}
	
	@GetMapping("/reg-address")
	public void getAddrList() throws Exception {}
	
	
	@PostMapping("/reg-address")
	public void getAddrList(AddressVO addr, Model model) throws Exception {
		List<AddressVO> addrList= service.getAddrList(addr);
		model.addAttribute("addrList", addrList);
	}
	
	@PostMapping("/register")
	public String insertMember(MemberVO mvo) throws Exception {
		String pwd = mvo.getUser_pwd();
		String encodePwd = bCryptPasswordEncoder.encode(pwd);
		mvo.setUser_pwd(encodePwd);
		String url = null;
		int result = service.insertMember(mvo);
		
		if (result == 1) {
			url = "redirect:/admin/member/register";
		} else {
			url = "/admin/member/insertEx";
		}
		
		return url;
	}
	
	@GetMapping("/memberinfo")
	public void memberinfo(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		
		model.addAttribute("member", mvo); 
	}
	
	@GetMapping("/list")
	public void getMemberList(Model model) throws Exception {
		
		List<MemberVO> mbList = service.getMemberList();
		model.addAttribute("mbList", mbList);
	}
	
	@GetMapping("/user-search")
	public void searchUser(Model model) throws Exception {
		
		
		List<MemberVO> mbList = service.getMemberList();
		model.addAttribute("mbList", mbList);
	}
	
	@GetMapping("/nglist")
	public void getNgList(Model model) throws Exception {
		
		List<MemberVO> ngList = service.getNgList();
		System.out.println(ngList);
		model.addAttribute("ngList", ngList);
	}
	
	@GetMapping("/modify")
	public void staffmodify(@RequestParam("user_id") String user_id, Model model) throws Exception{
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("modify", mvo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo) throws Exception{
		String pwd = mvo.getUser_pwd();
		String encodePwd = null;
		encodePwd = bCryptPasswordEncoder.encode(pwd);
		mvo.setUser_pwd(encodePwd);
		service.modify(mvo);
		
		return "redirect:/admin/member/memberinfo?user_id="+mvo.getUser_id();
	}
	
	@GetMapping("/delete")
	public String adminDelete(@RequestParam("user_id") String user_id) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		service.delete(mvo);
		
		return "redirect:/admin/member/list";
	}
	
	@GetMapping("/reg-card")
	public void regCard(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("member", mvo);
	}

}
