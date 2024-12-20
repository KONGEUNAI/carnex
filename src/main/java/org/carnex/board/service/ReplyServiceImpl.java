package org.carnex.board.service;

import java.util.List;

import javax.inject.Inject;

import org.carnex.board.persistence.BoardPersistence;
import org.carnex.board.persistence.ReplyPersistence;
import org.carnex.board.vo.ReplyVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyPersistence replyPersistence;
	
	@Inject
	private BoardPersistence boardPersistence;

	
	@Transactional
	@Override
	public void write(ReplyVO rvo) throws Exception {
		boardPersistence.upReplyCnt(rvo);
		replyPersistence.write(rvo);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		return replyPersistence.getReplyList(bno);
	}

	@Override
	public ReplyVO getReplyOne(ReplyVO rvo) throws Exception {
		return replyPersistence.getReplyOne(rvo);
	}

	@Override
	public void modify(ReplyVO rvo) throws Exception {
		replyPersistence.modify(rvo);
	}

	@Transactional
	@Override
	public void delete(ReplyVO rvo) throws Exception {
		//boardPersistence.downReplyCnt(rvo.getBno(), -1);
		boardPersistence.downReplyCnt(rvo.getBno());
		replyPersistence.delete(rvo);
	}
	
	@Override
	public List<ReplyVO> getUserReplyAll(String user_id) throws Exception {
		return replyPersistence.getUserReplyAll(user_id);
	}
}


