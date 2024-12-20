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
		// 차 하나 받아와서 자동 입력
		GoodsVO gvo = goodsService.getCarOne(car_num);
		model.addAttribute("gvo", gvo);
		
		// 유저 세션이 있으면 구매자 정보 자동 입력 (온라인 고객)
		// 오프라인 고객 = 직접 입력
//		if (session.getAttribute("session") != null) {
//			MemberVO mvo = (MemberVO) session.getAttribute("session");
//			model.addAttribute("mvo", mvo);
//		}
		
		// 카드 번호 받아서 카드정보가 있으면 카드 정보 자동 입력
		// 없으면 0 빈값을 대입
//		CardVO cardvo = (CardVO) userMemberService.getCard(card_num);
//		if (cardvo != null) {
//			model.addAttribute("cardvo", cardvo);
//		} else {
//			CardVO excardvo = new CardVO();
//			excardvo.setCard_num(0);
//			model.addAttribute("cardvo", excardvo);
//		}
		
		// 현재 날짜 가져오기
        LocalDate today = LocalDate.now();

        // 날짜 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 형식에 맞게 변환
        String date = today.format(formatter);
        model.addAttribute("date", date);
	}
	
	@PostMapping("/contract")
	public String contract(HttpServletRequest request, GoodsVO gvo, MemberVO mvo, CardVO cvo) throws Exception {
//		int card_num = Integer.parseInt(request.getParameter("card_num"));
		String sign = request.getParameter("con_sign");
//		if (card_num != 0) {
//			// card_num으로 카드 찾기
//			CardVO cardvo = (CardVO) userMemberService.getCard(card_num);
//			// card_num 있을때 cardvo는 따로 service 태워서 insert 
//			contractService.insertCard(cardvo);
//		}
		// cardVO 제외 gvo mvo 서명 데이터 매퍼로 전달
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
	
//	@GetMapping("/delete")
//	public void delete(@RequestParam("car_num") int car_num) throws Exception {
//		ContractVO convo = contractService.deleteContract(car_num);
//		
//	}

}
