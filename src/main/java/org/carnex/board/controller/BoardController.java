package org.carnex.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.carnex.board.service.BoardService;
import org.carnex.board.service.ReplyService;
import org.carnex.board.vo.BoardAttachVO;
import org.carnex.board.vo.BoardVO;
import org.carnex.board.vo.ReplyVO;
import org.carnex.user.vo.MemberVO;
import org.carnex.util.PageDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/static/board/*")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
	@GetMapping("/list")
	public void getBoardList(Model model,
			@RequestParam("num") int num,
			@RequestParam(value="searchType", required=false, defaultValue="title") String searchType,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword) throws Exception {
		
		PageDTO page = new PageDTO();
		page.setNum(num);
		page.setCount(boardService.getCount(searchType, keyword));
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = boardService.getBoardList(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("boardList", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	
	@GetMapping(value ="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno) {
		return new ResponseEntity<>(boardService.getAttachList(bno), HttpStatus.OK);
	}
	
	@GetMapping("/register")
	public void register() throws Exception {}
	
	@PostMapping("/register")
	public String register(BoardVO bvo) throws Exception {
		if (bvo.getAttachList() != null) {
			bvo.getAttachList().forEach(attach -> System.out.println(attach));
		}
		
		int bno = boardService.getBoardNum() + 1;
		bvo.setBno(bno);
		
		boardService.register(bvo);
		return "redirect:/static/board/list?num=1";
	}
	
	@RequestMapping(value="/ckUpload", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			          
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/board"); // 저장경로
			            System.out.println("uploadPath:"+uploadPath);
			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			           
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			           
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/board/" +fileName2 +fileName; // url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
	
	@GetMapping("/view")
	public void getBoardOne(@RequestParam("bno") int bno, Model model) throws Exception {
		boardService.upCount(bno);
		BoardVO bvo = boardService.getBoardOne(bno);
		
		List<ReplyVO> replyList = replyService.getReplyList(bno);
		if (replyList != null && replyList.isEmpty()) {
	        replyList = null;
	    }
		model.addAttribute("bvo", bvo);
		model.addAttribute("replyList", replyList);
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO bvo = boardService.getBoardOne(bno);
		model.addAttribute("modify", bvo);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) throws Exception {
		boardService.update(bvo);
		return "redirect:/static/board/view?bno="+bvo.getBno();
	}
	
//	@GetMapping("/delete")
//	public String delete(@RequestParam("bno") int bno) throws Exception {
//		boardService.delete(bno);
//		return "redirect:/static/board/list?num=1";
//	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, HttpSession session, HttpServletRequest request) throws Exception {
		MemberVO mvo = (MemberVO)session.getAttribute("session");
		String id =mvo.getUser_id();
		String referer = request.getHeader("Referer");
		boardService.delete(bno);
	    if (referer != null && referer.contains("/board")) {
	        return "redirect:/static/board/list?num=1"; 
	    } else {
	        return "redirect:/static/member/mypage?user_id="+id; 
	    }
	}
}