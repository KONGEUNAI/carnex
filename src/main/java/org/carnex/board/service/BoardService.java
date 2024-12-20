package org.carnex.board.service;

import java.util.List;

import org.carnex.board.vo.BoardAttachVO;
import org.carnex.board.vo.BoardVO;

public interface BoardService {
	
	public void register(BoardVO bvo) throws Exception;
	
	public List<BoardVO> getBoardList(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	public List<BoardVO> staffBoardList(String searchType, String keyword) throws Exception;
	
	public void upCount(int bno) throws Exception;
	
	public BoardVO getBoardOne(int bno) throws Exception;
	
	public void update(BoardVO bvo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public int getCount(String searchType, String keyword) throws Exception;
	
	public Integer getBoardNum() throws Exception;
	
	public List<BoardAttachVO> getAttachList(int bno);

}


