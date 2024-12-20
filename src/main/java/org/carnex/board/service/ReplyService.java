package org.carnex.board.service;

import java.util.List;

import org.carnex.board.vo.ReplyVO;

public interface ReplyService {
	
	public void write(ReplyVO rvo) throws Exception;
	
	public List<ReplyVO> getReplyList(int bno) throws Exception;
	
	public ReplyVO getReplyOne(ReplyVO rvo) throws Exception;
	
	public void modify(ReplyVO rvo) throws Exception;
	
	public void delete(ReplyVO rvo) throws Exception;
	
	public List<ReplyVO> getUserReplyAll(String user_id) throws Exception;

}
