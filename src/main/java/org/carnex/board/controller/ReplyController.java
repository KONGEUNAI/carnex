package org.carnex.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.carnex.board.service.ReplyService;
import org.carnex.board.vo.ReplyVO;
import org.carnex.user.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/static/reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	@PostMapping("/write")
	public String write(ReplyVO rvo) throws Exception {
		replyService.write(rvo);
		return "redirect:/static/board/view?bno="+rvo.getBno();
	}
	
//	@GetMapping("/modify")
//	public void modify(@RequestParam("bno") int bno, @RequestParam("rno") int rno, Model model) throws Exception {
//		ReplyVO rvo = new ReplyVO();
//		rvo.setBno(bno);
//		rvo.setRno(rno);
//		
//		ReplyVO reply = replyService.getReplyOne(rvo);
//		model.addAttribute("reply", reply);
//	}
	
	@PostMapping("/modify")
	public String modify(ReplyVO rvo) throws Exception {
		replyService.modify(rvo);
		return "redirect:/static/board/view?bno="+rvo.getBno();
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") int bno, @RequestParam("rno") int rno, Model model) throws Exception {
		ReplyVO rvo = new ReplyVO();
		rvo.setBno(bno);
		rvo.setRno(rno);
		
		ReplyVO reply = replyService.getReplyOne(rvo);
		model.addAttribute("rvo", reply);
	}
	
	
	
	
	
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, @RequestParam("rno") int rno, HttpSession session, HttpServletRequest request) throws Exception {
		MemberVO mvo = (MemberVO)session.getAttribute("session");
		String id = mvo.getUser_id();
		String referer = request.getHeader("Referer");
		ReplyVO rvo = new ReplyVO();
		rvo.setBno(bno);
		rvo.setRno(rno);
		replyService.delete(rvo);
	    if (referer != null && referer.contains("/board")) {
	        return "redirect:/static/board/view?bno="+rvo.getBno(); 
	    } else {
	        return "redirect:/static/member/mypage?user_id="+id; 
	    }
	}
	
}


