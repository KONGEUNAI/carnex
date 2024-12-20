package org.carnex.board.controller;

import javax.inject.Inject;

import org.carnex.board.service.ReplyService;
import org.carnex.board.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/reply/*")
public class AdminReplyController {
	
	@Inject
	private ReplyService replyService;
	
	@PostMapping("/write")
	public String write(ReplyVO rvo) throws Exception {
		replyService.write(rvo);
		return "redirect:/admin/board/view?bno="+rvo.getBno();
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") int bno, @RequestParam("rno") int rno, Model model) throws Exception {
		ReplyVO rvo = new ReplyVO();
		rvo.setBno(bno);
		rvo.setRno(rno);
		
		ReplyVO reply = replyService.getReplyOne(rvo);
		model.addAttribute("reply", reply);
	}
	
	@PostMapping("/modify")
	public String modify(ReplyVO rvo) throws Exception {
		replyService.modify(rvo);
		return "redirect:/admin/board/view?bno="+rvo.getBno();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, @RequestParam("rno") int rno) throws Exception {
		ReplyVO rvo = new ReplyVO();
		rvo.setBno(bno);
		rvo.setRno(rno);
		replyService.delete(rvo);
		return "redirect:/admin/board/view?bno="+rvo.getBno();
	}
	
}


