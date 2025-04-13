package org.carnex.contract.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.carnex.admin.service.AdminStaffService;
import org.carnex.contract.service.ContractService;
import org.carnex.contract.vo.ContractVO;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.service.UserMemberService;
import org.carnex.user.vo.CardVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/contract/*")
public class ContractController {
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private UserMemberService userMemberService;
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@Inject
	private ContractService contractService;
	
	@GetMapping("/contract")
	public void contract(@RequestParam("car_num") int car_num, Model model) throws Exception {

		GoodsVO gvo = goodsService.getCarOne(car_num);
		model.addAttribute("gvo", gvo);

        	LocalDate today = LocalDate.now();

        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        String date = today.format(formatter);
	        model.addAttribute("date", date);
	}
	
	@PostMapping("/contract")
	public String contract(HttpServletRequest request, GoodsVO gvo, MemberVO mvo, CardVO cvo) throws Exception {

		String sign = request.getParameter("con_sign");

		contractService.writeContract(gvo, mvo, cvo, sign);
		String staff_id = gvo.getStaff_id();
		int con_no = contractService.getCount(staff_id);
		return "redirect:/confirm/contract-success?con_no="+con_no;
	}
	
	@GetMapping("/list")
	public void getContractList(Model model) throws Exception {
		
		List<ContractVO> conList = contractService. getContractList();
		model.addAttribute("cvo", conList);
	}
}
