package org.carnex.board.persistence;

import java.util.List;

import org.carnex.board.vo.BoardAttachVO;

public interface BoardAttachPersistence {

	public void insert(BoardAttachVO bavo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(int bno);

	public void deleteAll(int bno);

	public List<BoardAttachVO> getOldFiles( );
	
}
