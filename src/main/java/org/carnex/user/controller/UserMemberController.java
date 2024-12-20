package org.carnex.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.carnex.admin.service.AdminStaffService;
import org.carnex.admin.vo.StaffVO;
import org.carnex.board.service.ReplyService;
import org.carnex.board.vo.BoardVO;
import org.carnex.board.vo.ReplyVO;
import org.carnex.contract.service.ContractService;
import org.carnex.contract.vo.ContractVO;
import org.carnex.contract.vo.ReservationVO;
import org.carnex.goods.service.GoodsService;
import org.carnex.goods.vo.GoodsVO;
import org.carnex.user.service.UserMemberServiceImpl;
import org.carnex.user.vo.AddressVO;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/static/member/*")
public class UserMemberController {
	
	@Autowired
	private UserMemberServiceImpl service;
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private AdminStaffService adminStaffService;
	
	@Inject
	private ContractService contractService;
	
	@Inject
	private ReplyService replyService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
			url = "redirect:/static/member/insert-op?user_id="+mvo.getUser_id();
		} else {
			url = "/static/member/insertEx";
		}
		
		return url;
	}
	
	@GetMapping("/insert-op")
	public void insertop(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("insertop", mvo);
	};
	
	@PostMapping("/insert-op")
	public String insertopMember(HttpServletRequest request, MemberVO mvo,
			@RequestParam("userImg") MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\user";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        mvo.setUser_img("/resources/img/user/"+fileName);
		}
		
		String user_id = request.getParameter("user_id");
		service.insertopMember(mvo);
			
		return "redirect:/static/member/insert-success?user_id="+user_id;
	}
	
	@GetMapping("/insert-success")
	public void insertSuccess(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("member", mvo);
	}
	
	
	
	@GetMapping("/mypage")
	public void mypage2 (@RequestParam("user_id") String user_id,HttpServletRequest request, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		String user_nick = mvo.getUser_nick();
		String user_birth = mvo.getUser_birth();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date birth = sdf.parse(user_birth);  
            model.addAttribute("user_birth", birth);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List <ContractVO> conList = contractService.getUserCon(user_id);
        for (ContractVO convo:conList) {
        	String staff_id = convo.getStaff_id();
        	StaffVO svo = adminStaffService.getStaffOne(staff_id);
        	convo.setStaffVO(svo);
        	int car_num =convo.getCar_num();
        	GoodsVO gvo = goodsService.getCarOne(car_num); 
        	convo.setGoodsVO(gvo);
        }
		
		List<BoardVO> bList = service.getMyBoard(user_nick);
		List<ReplyVO> rList = replyService.getUserReplyAll(user_id);
		List<CardVO> cList = service.getCardList(user_id);
		
		List<ReservationVO> revList = service.getRevUser(user_id);
	    for (ReservationVO rvo : revList) {
	        int carNum = rvo.getCar_num();
	        GoodsVO gvo = goodsService.getCarOne(carNum); 
	        rvo.setGoodsVO(gvo);  
	        String staffId = rvo.getStaff_id();
	        StaffVO svo = adminStaffService.getStaffOne(staffId);
	        rvo.setStaffVO(svo);
	        try {
	            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	            Date revTime = timeFormat.parse(rvo.getRev_time());
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            Date revDate = dateFormat.parse(rvo.getRev_date());
	            request.setAttribute("rev_time", revTime);
	            request.setAttribute("rev_date", revDate);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

        
	    List<GoodsVO> secondGoods = goodsService.secondGoods();
	    List<GoodsVO> firstGoods = goodsService.firstGoods();
	    
	    model.addAttribute("firstGoods", firstGoods); 
	    model.addAttribute("secondGoods", secondGoods); 
	    model.addAttribute("rList", rList); 
		model.addAttribute("conList", conList);
		model.addAttribute("revList", revList);
		model.addAttribute("member", mvo); 
		model.addAttribute("bList", bList); 	
		model.addAttribute("cList", cList);
	}
	
	@GetMapping("/pwd-check")
	public void pwdCheck(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("mvo", mvo);
	}
	
	@PostMapping("/pwd-check")
	public String pwdCheck(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = null;
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
        String DBPassword =  service.getDBPassword(user_id);

        boolean passwordMatch = bCryptPasswordEncoder.matches(user_pwd, DBPassword);

        if (passwordMatch) {
            url = "redirect:/static/member/modify?user_id="+user_id;
        } else {
    	    rttr.addFlashAttribute("errorMessage", "비밀번호가 다릅니다. 다시 본인인증해주세요.");
            url =  "redirect:/static/member/pwd-check?user_id="+user_id;
        }
        return url;
    }
	
	@GetMapping("/modify")
	public void modify(@RequestParam("user_id") String user_id, Model model) throws Exception{
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("modify", mvo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, @RequestParam("userImg") MultipartFile file) throws Exception{
		String pwd = mvo.getUser_pwd();
		String encodePwd = null;
		encodePwd = bCryptPasswordEncoder.encode(pwd);
		mvo.setUser_pwd(encodePwd);
		
		// 수정 페이지에서 업로드한 이미지가 없으면 기존 DB에 저장된 경로로 다시 저장
		if (file.isEmpty()) {
			String user_id = mvo.getUser_id();
			MemberVO dbmvo = service.mypage(user_id);
			String user_img = dbmvo.getUser_img();
			mvo.setUser_img(user_img);
		}
		
		// 수정 페이지에서 업로드한 이미지가 있으면 DB에 새로 저장
		if (!file.isEmpty()) {
			String uploadFolder = "D:\\carnex\\workspace\\carnex\\src\\main\\webapp\\resources\\img\\user";
			String originalFileName = file.getOriginalFilename();
			String fileName = UUID.randomUUID() + "_" + originalFileName.replace(" ", "_");
	        File saveFile = new File(uploadFolder, fileName);
	        if(saveFile.exists() == false) {
				saveFile.mkdirs();
			}
	        file.transferTo(saveFile);
	        mvo.setUser_img("/resources/img/user/"+fileName);
		}
		service.userModify(mvo);
		
		return "redirect:/static/member/mypage?user_id="+mvo.getUser_id();
	}
	
	@GetMapping("/delete")
	public void delete(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("delete", mvo);
	}
	
	@PostMapping("/delete")
	public String delete(MemberVO mvo) throws Exception {
		service.delete(mvo);
		
		return "redirect:/confirm";
	}
	
	@GetMapping("/reg-card")
	public void regCard(@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		model.addAttribute("member", mvo);
	}

	@PostMapping("/reg-card")
	public String regCard(HttpServletRequest request, CardVO cvo, Model model) throws Exception {
		String user_id = request.getParameter("user_id");
		cvo.setUser_id(user_id);
		int result = service.regCard(cvo);
		String url = null;
		if (result == 1) {
			url = "redirect:/static/member/mypage?user_id="+user_id;
		} else {
			url = "redirect:/static/member/reg-card";
		}
		return  url;
	}
	
	@GetMapping("/delete-card")
	public String cardDelete(@RequestParam("card_num")int card_num, @RequestParam("user_id") String user_id) throws Exception {
		service.cardDelete(card_num);
		return "redirect:/static/member/mypage?user_id="+user_id;
	}
	
	@GetMapping("/modify-card")
	public void cardModify(@RequestParam("card_num") int card_num,
			@RequestParam("user_id") String user_id, Model model) throws Exception {
		MemberVO mvo = service.mypage(user_id);
		CardVO cvo = service.getCard(card_num);
		model.addAttribute("cvo", cvo);
		model.addAttribute("member", mvo);
	}
	
	@PostMapping("/modify-card")
	public String cardModify(HttpServletRequest request, CardVO cvo) throws Exception {
		String user_id = request.getParameter("user_id");
		service.cardModify(cvo);
		
		return "redirect:/static/member/mypage?user_id="+user_id;
	}
	
	@GetMapping("/card-storage")
	public void myCardStorage(@RequestParam("user_id") String user_id,
			@RequestParam("car_num") int car_num, Model model) throws Exception {
		List<CardVO> cList = service.getCardList(user_id);
		GoodsVO gvo = goodsService.getCarOne(car_num);
		
		model.addAttribute("cList", cList);
		model.addAttribute("gvo", gvo);
	}
	
	@GetMapping("/revModify")
	public void revModify (@RequestParam("rev_no") int rev_no, Model model) throws Exception {
		ReservationVO revvo = service.getRevOne(rev_no);
		model.addAttribute("rvo", revvo);
	}
	
	@PostMapping("/revModify")
	public String revModify (ReservationVO revvo) throws Exception {
		 service.revModify(revvo);
			

		return "redirect:/static/member/mypage?user_id="+revvo.getUser_id();
	}

	@GetMapping("/delete-rev")
	public String deleteRev(@RequestParam("rev_no") int rev_no) throws Exception {
		ReservationVO rvo =service.getRevOne(rev_no);
        String user_id = rvo.getUser_id();
	    
        service.deleteRev(user_id, rev_no);
        
        
		return "redirect:/static/member/mypage?user_id="+user_id;
	}
}
