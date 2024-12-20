package org.carnex.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.carnex.admin.service.AdminConfirmService;
import org.carnex.admin.service.AdminStaffService;
import org.carnex.admin.vo.StaffVO;
import org.carnex.contract.service.ContractService;
import org.carnex.contract.vo.ContractVO;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.service.UserMemberService;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/confirm/*")
public class ConfirmController {
	
	@Inject
	private AdminConfirmService adminConfirmService;
	
	@Inject
	private ContractService contractService;
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private UserMemberService userMemberService;
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@PostMapping("/member/idcheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) throws Exception {
		String user_id = request.getParameter("user_id");
		MemberVO mvo = adminConfirmService.idCheck(user_id);
		String result = null;
		
		if (mvo != null) {
			result = "success";
		}
		
		return result;
	}
	
	@PostMapping("/member/nickcheck")
	@ResponseBody
	public String nickCheck(HttpServletRequest request) throws Exception {
		String user_nick = request.getParameter("user_nick");
		int value = 0;
		value = adminConfirmService.nickCheck(user_nick);
		String result = "success";
		
		if (value == 0) {
			result = null;
		}
		
		return result;
	}
	
	@PostMapping("/member/upnickcheck")
	@ResponseBody
	public String upnickCheck(HttpServletRequest request, MemberVO mvo) throws Exception {
		String up_user_nick = request.getParameter("user_nick");
		String user_id = request.getParameter("user_id");
		int value = 0;
		String result = "success";
		value = adminConfirmService.nickCheck(up_user_nick);
		mvo = adminConfirmService.idCheck(user_id);
		
		String user_nick = mvo.getUser_nick();
		
		if (value == 1 && user_nick.equals(up_user_nick)) {
			result = null;
		} else if (value == 0) {
			result = null;
		}
		
		return result;
	}
	
	@PostMapping("/staff/idcheck")
	@ResponseBody
	public String staffIdCheck(HttpServletRequest request) throws Exception {
		String staff_id = request.getParameter("staff_id");
		StaffVO svo = adminConfirmService.staffIdCheck(staff_id);
		String result = null;
		
		if (svo != null) {
			result = "success";
		}
		
		return result;
	}
	
	@PostMapping("/staff/login")
	public String stafflogin(StaffVO svo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		StaffVO dbsvo = adminConfirmService.stafflogin(svo);
		String url = null;
		
		if (dbsvo != null) {
			boolean passMatch = bCryptPasswordEncoder.matches(svo.getStaff_pwd(), dbsvo.getStaff_pwd());
			
			if (passMatch) {
				session.setAttribute("staffsess", dbsvo);
				url = "redirect:/admin?staff_id="+dbsvo.getStaff_id();
			} else {
				session.setAttribute("staffsess", null);
				rttr.addFlashAttribute("errorMessageStaff", "비밀번호가 다릅니다. 다시 로그인해주세요.");
				url = "redirect:/confirm";
			}
		} else {
			session.setAttribute("staffsess", null);
			rttr.addFlashAttribute("errorMessageStaff", "아이디가 다릅니다. 다시 로그인해주세요.");
			url = "redirect:/confirm";
		}
		return url;
	}
	
	@PostMapping("/member/login")
	public String login(MemberVO mvo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		MemberVO dbmvo = adminConfirmService.login(mvo);
		String url = null;
		
		if (dbmvo != null) {
			
			boolean passMatch = bCryptPasswordEncoder.matches(mvo.getUser_pwd(), dbmvo.getUser_pwd());
			
			if (passMatch) {
				session.setAttribute("session", dbmvo);
				url = "redirect:/static";
			} else {
				session.setAttribute("session", null);
				rttr.addFlashAttribute("errorMessage", "비밀번호가 다릅니다. 다시 로그인해주세요.");
				url = "redirect:/confirm";
			}
		} else { // ������ִ� ���̵� ���� ���� �α��� ����
			session.setAttribute("session", null);
			rttr.addFlashAttribute("errorMessage", "아이디가 다릅니다. 다시 로그인해주세요.");
			url = "redirect:/confirm";
		}
		return url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/contract-success")
	public void contractSuccess(@RequestParam("con_no") int con_no, Model model) throws Exception {
		ContractVO convo = contractService.getContractOne(con_no);
		int car_num = convo.getCar_num();
		String user_id = convo.getUser_id();
		String staff_id = convo.getStaff_id();
		int card_num = convo.getCard_num();
		CardVO cvo = userMemberService.getCard(card_num);
		GoodsVO gvo = goodsService.getCarOne(car_num);
		MemberVO mvo = userMemberService.mypage(user_id);
		StaffVO svo = adminStaffService.getStaffOne(staff_id);
		
		model.addAttribute("convo", convo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("svo", svo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("gvo", gvo);
	}
}
