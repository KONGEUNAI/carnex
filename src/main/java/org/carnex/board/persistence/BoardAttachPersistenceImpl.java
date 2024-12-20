package org.carnex.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.carnex.board.vo.BoardAttachVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardAttachPersistenceImpl implements BoardAttachPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="org.carnex.mappers.boardAttachMapper";

	@Override
	public void insert(BoardAttachVO bavo) {
		sql.insert(namespace + ".insert", bavo);
	}

	@Override
	public void delete(String uuid) {
		sql.delete(namespace + ".delete", uuid);
	}

	@Override
	public List<BoardAttachVO> findByBno(int bno) {
		return sql.selectList(namespace + ".findByBno", bno);
	}

	@Override
	public void deleteAll(int bno) {
		sql.delete(namespace + ".deleteAll", bno);
	}

	@Override
	public List<BoardAttachVO> getOldFiles() {
		return null;
	}

}
