package org.carnex.controller;

import java.util.List;

import javax.inject.Inject;

import org.carnex.admin.service.AdminStaffService;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.util.DashBoardDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@Inject
	private GoodsService goodsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() { return "index"; }
	
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String loginHome() { return "/confirm/login"; }
	
	@RequestMapping(value = "/static", method = RequestMethod.GET)
	public String userIndex(Model model) throws Exception {
		// SELECT * FROM goods_tbl ORDER BY car_num DESC LIMIT 6, 3;
        List<GoodsVO> secondGoods = goodsService.secondGoods();
        // SELECT * FROM goods_tbl ORDER BY car_num DESC LIMIT 6;
        List<GoodsVO> firstGoods = goodsService.firstGoods();

        // 모델에 데이터를 추가
        model.addAttribute("secondGoods", secondGoods);
        model.addAttribute("firstGoods", firstGoods);
		
		return "/static/member-index";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String staffIndex(@RequestParam("staff_id") String staff_id, Model model) throws Exception {
		DashBoardDTO dbdto = adminStaffService.getDashBoard();
		model.addAttribute("dbdto", dbdto);
		
		List<ReservationVO> revList = goodsService.getRevList(staff_id);
		for (ReservationVO rvo : revList) {
            int car_num = rvo.getCar_num();
            GoodsVO gvo = goodsService.getCarOne(car_num); 
            rvo.setGoodsVO(gvo);  
        }
        model.addAttribute("revList", revList); 
        
        
		return "/admin/index";
	}
}



















