package org.carnex.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.carnex.board.service.BoardService;
import org.carnex.board.service.ReplyService;
import org.carnex.board.vo.BoardAttachVO;
import org.carnex.board.vo.BoardVO;
import org.carnex.board.vo.ReplyVO;
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
@RequestMapping("/admin/board/*")
public class AdminBoardController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
	@GetMapping(value ="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno) {
		return new ResponseEntity<>(boardService.getAttachList(bno), HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public void getBoardstaffList(Model model,
			@RequestParam(value="searchType", required=false, defaultValue="title") String searchType,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword) throws Exception {
		
		
		List<BoardVO> list = boardService.staffBoardList(searchType, keyword);
		
		if (list.size() != 0) {
			Map<Integer, List<ReplyVO>> replyMap = new HashMap<>();
			for (int i=0; i<list.size(); i++) {
				BoardVO bvo = list.get(i);
		        int bno = bvo.getBno();
		        List<ReplyVO> rlist = replyService.getReplyList(bno);
		        replyMap.put(bno, rlist);  // bno를 키로 하고 댓글 리스트를 저장
			}
			model.addAttribute("replyMap", replyMap); // bno를 키로 하여 모델에 추가
		}
		
		model.addAttribute("boardList", list);
	}
	
	@GetMapping("/register")
	public void staffRegister() throws Exception {}
	
	// �Խù� ��� ������ ó��
	@PostMapping("/register")
	public String staffRegister(BoardVO bvo) throws Exception {
		if (bvo.getAttachList() != null) {
			bvo.getAttachList().forEach(attach -> System.out.println(attach));
		}
		
		int bno = boardService.getBoardNum() + 1;
		bvo.setBno(bno);
		
		
		boardService.register(bvo);
		return "redirect:/admin/board/list";
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
	
	@GetMapping("/modify")
	public void staffModify(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO bvo = boardService.getBoardOne(bno);
		model.addAttribute("modify", bvo);
	}
	
	@PostMapping("/modify")
	public String staffModify(BoardVO bvo) throws Exception {
		boardService.update(bvo);
		return "redirect:/admin/board/view?bno="+bvo.getBno();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno) throws Exception {
		boardService.delete(bno);
		return "redirect:/admin/board/list";
	}
	
	@GetMapping("/view")
	public void view(@RequestParam("bno") int bno, Model model) throws Exception {
		boardService.upCount(bno);
		BoardVO bvo = boardService.getBoardOne(bno);
		List<ReplyVO> rvo =replyService.getReplyList(bno);
		if (rvo != null && rvo.isEmpty()) {
	        rvo	 = null;
	    }
		model.addAttribute("bvo", bvo);
		model.addAttribute("rvo", rvo);
	}

}