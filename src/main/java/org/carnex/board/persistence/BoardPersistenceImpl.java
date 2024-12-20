package org.carnex.board.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.board.vo.BoardVO;
import org.carnex.board.vo.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardPersistenceImpl implements BoardPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="org.carnex.mappers.board";
	

	@Override
	public void register(BoardVO bvo) throws Exception {
		sql.insert(namespace + ".register", bvo);
	}

	@Override
	public List<BoardVO> getBoardList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("displayPost", displayPost);
		map.put("postNum", postNum);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		return sql.selectList(namespace + ".getBoardList", map);
	}
	
	@Override
	public List<BoardVO> staffBoardList(String searchType, String keyword) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		return sql.selectList(namespace + ".staffBoardList", map);
	}

	@Override
	public void upCount(int bno) throws Exception {
		sql.update(namespace + ".upCount", bno);
	}

	@Override
	public BoardVO getBoardOne(int bno) throws Exception {
		return sql.selectOne(namespace + ".getBoardOne", bno);
	}

	@Override
	public void update(BoardVO bvo) throws Exception {
		sql.update(namespace + ".update", bvo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public int getCount(String searchType, String keyword) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".getCount", map);
	}

	@Override
	public Integer getBoardNum() throws Exception {
		return sql.selectOne(namespace + ".getBoardNum");
	}

	@Override
	public void upReplyCnt(ReplyVO rvo) throws Exception {
		sql.update(namespace + ".upReplyCnt", rvo);
	}

	/*
	@Override
	public void downReplyCnt(int bno, int amount) throws Exception {
		HashMap map = new HashMap();
		
		map.put("bno", bno);
		map.put("amout", amount);
		
		sql.update(namespace+".downReplyCnt", map);
		
	}
	*/
	@Override
	public void downReplyCnt(int bno) throws Exception {
		sql.update(namespace+".downReplyCnt", bno);
	}

}









