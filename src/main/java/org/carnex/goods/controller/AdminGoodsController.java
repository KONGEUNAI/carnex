package org.carnex.goods.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.carnex.contract.service.ContractService;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/goods/*")
public class AdminGoodsController {
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private ContractService contractService;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(GoodsVO gvo, @RequestParam("uploadFile") MultipartFile file, @RequestParam("carImage") MultipartFile[] carImage) throws Exception {
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\goods";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        gvo.setCar_thumbimg("/resources/img/goods/"+fileName);
		}
		
		if (carImage != null && carImage.length>0) {
			String detailFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\goods\\detail";
			List<String> detailImagePaths = new ArrayList<>();
			
			for (MultipartFile image : carImage) {
				if (!image.isEmpty()) {
					String detailFileName = image.getOriginalFilename();
					String detailName = UUID.randomUUID() + "_" + detailFileName.replace(" ", "_");
					File saveDetail = new File(detailFolder, detailName);
					
					if(saveDetail.exists() == false) {
						saveDetail.mkdirs();
					}
					image.transferTo(saveDetail);
					
					detailImagePaths.add("/resources/img/goods/detail/" + detailName);
				}
			}
			if (!detailImagePaths.isEmpty()) {
	            gvo.setCar_img(String.join(";", detailImagePaths)); // 예: 여러 이미지를 세미콜론으로 구분하여 저장
	        }
		}
		
		goodsService.register(gvo);
		
		return "redirect:/admin/goods/register";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("car_num") int car_num, Model model) throws Exception{
		GoodsVO gvo = goodsService.getCarOne(car_num);
		model.addAttribute("modify", gvo); //���̵� �ش��ϴ� mvo�� ����ó����
	}
	
	@PostMapping("/modify")
	public String modify(HttpServletRequest request, GoodsVO gvo,
			@RequestParam("uploadFile") MultipartFile file, @RequestParam("carImage") MultipartFile[] carImage) throws Exception{
		int car_num = Integer.parseInt(request.getParameter("car_num"));
		
		// 수정 페이지에서 업로드한 이미지가 없으면 기존 DB에 저장된 경로로 다시 저장
		if (file.isEmpty()) {
			GoodsVO dbgvo = goodsService.getCarOne(car_num);
			String thumbimg = dbgvo.getCar_thumbimg();
			gvo.setCar_thumbimg(thumbimg);
		}
		
		// 수정 페이지에서 업로드한 이미지가 있으면 DB에 새로 저장
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\goods";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        gvo.setCar_thumbimg("/resources/img/goods/"+fileName);
		}
		
		System.out.println(carImage.length);
		// 수정페이지에서 업로드한 이미지들이 없으면 기존 DB에 저장된 경로들로만 다시 저장
		if (carImage.length == 1) {
			GoodsVO dbgvo = goodsService.getCarOne(car_num);
			String img = dbgvo.getCar_img();
			gvo.setCar_img(img);
		}
		
		// 수정페이지에서 업로드한 이미지들이 있으면 DB에 새로 저장
		if (carImage.length>1) {
			String detailFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\goods\\detail";
			List<String> detailImagePaths = new ArrayList<>();
			
			for (MultipartFile image : carImage) {
				if (!image.isEmpty()) {
					String detailFileName = image.getOriginalFilename();
					String detailName = UUID.randomUUID() + "_" + detailFileName.replace(" ", "_");
					File saveDetail = new File(detailFolder, detailName);
					
					if(saveDetail.exists() == false) {
						saveDetail.mkdirs();
					}
					image.transferTo(saveDetail);
					
					detailImagePaths.add("/resources/img/goods/detail/" + detailName);
				}
			}
			if (!detailImagePaths.isEmpty()) {
				gvo.setCar_img(String.join(";", detailImagePaths)); // 예: 여러 이미지를 세미콜론으로 구분하여 저장
			}
		}
		
		goodsService.modify(gvo);
		
		return "redirect:/admin/goods/goodsList?carType=&keyword=&car_status=";
	}
	
	@GetMapping("/view")
	public void goodsListAll(@RequestParam("car_num") int car_num, Model model) throws Exception {
		GoodsVO gvo = goodsService.getCarOne(car_num);
		String car_img = gvo.getCar_img();
		if (car_img != null) {
			
			String[] carImg = car_img.split(";");
			model.addAttribute("carimg", carImg);
		}
		model.addAttribute("gvo", gvo);
	}
	
	@GetMapping("/goodsList")
	public void goodsListtAll(Model model,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="carType", required=false) String carType,
			@RequestParam(value="car_status", required=false) String car_status) throws Exception {
		
		List<GoodsVO> goodsList = goodsService.goodsPartList(car_status, keyword, carType);
		model.addAttribute("goodsList", goodsList);
	}
	
	@GetMapping("/delete")
	public String deleteCarOne(@RequestParam("car_num") int car_num) throws Exception {
		goodsService.delete(car_num);
		return "redirect:/admin/goods/goodsList?carType=&keyword=&car_status=";
	}
	
	@GetMapping("/deleteReserve")
	public String deleteReserve(@RequestParam("car_num") int car_num) throws Exception {
		goodsService.deleteReserve(car_num);
		goodsService.updateCarStatus(car_num);
		return "redirect:/admin/goods/goodsList?carType=&keyword=&car_status=";
	}

}
