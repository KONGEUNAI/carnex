package org.carnex.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.board.vo.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyPersistenceImpl implements ReplyPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="org.carnex.mappers.reply";

	
	@Override
	public void write(ReplyVO rvo) throws Exception {
		sql.insert(namespace+".write", rvo);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		return sql.selectList(namespace+".getReplyList", bno);
	}

	@Override
	public ReplyVO getReplyOne(ReplyVO rvo) throws Exception {
		return sql.selectOne(namespace+".getReplyOne", rvo);
	}
	
	@Override
	public void boardReplyDelete(int bno) throws Exception {
	    sql.delete(namespace + ".boardReplyDelete", bno);
	}

	@Override
	public void modify(ReplyVO rvo) throws Exception {
		sql.update(namespace + ".modify", rvo);
	}

	@Override
	public void delete(ReplyVO rvo) throws Exception {
		sql.delete(namespace + ".delete", rvo);
	}

	@Override
	public List<ReplyVO> getUserReplyAll(String user_id) throws Exception {
		return sql.selectList(namespace+".getUserReplyAll", user_id);
	}

}
