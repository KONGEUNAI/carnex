package org.carnex.goods.controller;

import java.util.List;

import javax.inject.Inject;

import org.carnex.admin.service.AdminStaffService;
import org.carnex.admin.vo.StaffVO;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.service.UserMemberService;
import org.carnex.user.vo.CardVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/static/goods/*")
public class GoodsController {
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@Inject
	private UserMemberService userMemberService;
	
	@GetMapping("/list")
	public void goodsList(Model model,
			@RequestParam(required=false, defaultValue="") String keyword) throws Exception {
		List<GoodsVO> glist = goodsService.getGoodsList(keyword);
		model.addAttribute("glist", glist);
	}
	
	@PostMapping("/infiniteScrollDown")
    public @ResponseBody List<GoodsVO> infiniteScroll(@RequestBody GoodsVO gvo,
    		@RequestParam(value="keyword", required=false, defaultValue="") String keyword) throws Exception {
		int cnoToStart = gvo.getCar_num();
		System.out.println(cnoToStart);
		System.out.println(keyword);
		
        return goodsService.infiniteScroll(cnoToStart, keyword);
    }
	
	@GetMapping("/view")
	public void getCarOne(@RequestParam("car_num") int car_num, Model model) throws Exception {
		GoodsVO gvo = goodsService.getCarOne(car_num);
		String staff_id = gvo.getStaff_id();
		StaffVO svo = adminStaffService.getStaffOne(staff_id);
		String car_img = gvo.getCar_img();
		if (car_img != null) {
			String[] carImg = car_img.split(";");
			model.addAttribute("carimg", carImg);
			System.out.println(carImg);
		}
		model.addAttribute("gvo", gvo);
		model.addAttribute("svo", svo);
	}
	
	@PostMapping("/view")
	public String makeRev(ReservationVO revvo) throws Exception {
		goodsService.makeRev(revvo);
		
	    ReservationVO dbrevvo = goodsService.getRevOne(revvo);
	    
		return "redirect:/static/goods/rev-success?revno="+dbrevvo.getRev_no();
	}
	
	@GetMapping("/rev-success")
	public void getRevOne(@RequestParam("revno") int rev_no, Model model) throws Exception {
		ReservationVO revvo = goodsService.revSuccess(rev_no);
		model.addAttribute("revvo", revvo);
		
		int car_num = revvo.getCar_num();
		GoodsVO gvo = goodsService.getCarOne(car_num);
		model.addAttribute("gvo", gvo);
		
		String staff_id = revvo.getStaff_id();
		StaffVO svo = adminStaffService.getStaffOne(staff_id);
		model.addAttribute("svo", svo);
	}
	
	@GetMapping("/card-storage")
	public void cardStorage(@RequestParam("user_id") String user_id, Model model) throws Exception {	
		List<CardVO> cList = userMemberService.getCardList(user_id);
		model.addAttribute("cList", cList);
	}
}
