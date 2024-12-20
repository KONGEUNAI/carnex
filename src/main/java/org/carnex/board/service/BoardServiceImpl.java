package org.carnex.board.service;

import java.util.List;

import javax.inject.Inject;

import org.carnex.board.persistence.BoardAttachPersistence;
import org.carnex.board.persistence.BoardPersistence;
import org.carnex.board.persistence.ReplyPersistence;
import org.carnex.board.vo.BoardAttachVO;
import org.carnex.board.vo.BoardVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardPersistence boardPersistence;
	
	@Inject
	private BoardAttachPersistence attachPersistence;
	
	@Inject
	private ReplyPersistence replyPersistence;
	

	@Transactional
	@Override
	public void register(BoardVO bvo) throws Exception {
		boardPersistence.register(bvo);
		if (bvo.getAttachList() == null || bvo.getAttachList().size() <= 0) { return; }

		bvo.getAttachList().forEach(attach -> {
			attach.setBno(bvo.getBno());
			attachPersistence.insert(attach);
		});
	}

	@Override
	public List<BoardVO> getBoardList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return boardPersistence.getBoardList(displayPost, postNum, searchType, keyword);
	}
	
	@Override
	public List<BoardVO> staffBoardList(String searchType, String keyword) throws Exception {
		return boardPersistence.staffBoardList(searchType, keyword);
	}

	@Override
	public void upCount(int bno) throws Exception {
		boardPersistence.upCount(bno);
	}

	@Override
	public BoardVO getBoardOne(int bno) throws Exception {
		return boardPersistence.getBoardOne(bno);
	}

	@Transactional
	@Override
	public void update(BoardVO bvo) throws Exception {
		List<BoardAttachVO> attachList = bvo.getAttachList();
		
		if (attachList != null && !attachList.isEmpty() && attachList.size() > 0) {
			attachPersistence.deleteAll(bvo.getBno());
			boardPersistence.update(bvo);
			bvo.getAttachList().forEach(attach -> {
				attach.setBno(bvo.getBno());
				attachPersistence.insert(attach);
			});
		} else {
			boardPersistence.update(bvo);
		}
	}

	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		replyPersistence.boardReplyDelete(bno);
		attachPersistence.deleteAll(bno);
		boardPersistence.delete(bno);
	}

	@Override
	public int getCount(String searchType, String keyword) throws Exception {
		return boardPersistence.getCount(searchType, keyword);
	}

	@Override
	public Integer getBoardNum() throws Exception {
		return boardPersistence.getBoardNum();
	}

	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		return attachPersistence.findByBno(bno);
	}

}



