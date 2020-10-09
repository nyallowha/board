package com.board2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.board2.DTO.Board2DTO;
import com.board2.DTO.Board2Page;

public class BoardDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;

	public List<Board2DTO> seeboarddao(Board2DTO dto) {
		 List<Board2DTO> result = session.selectList("boarddate.seeboard", dto);
		return result;
	}

	public int countBoard() {
		
		return session.selectOne("boarddate.countboard");
	}
	//페이징 작업을해서 해당 페이지의 게시글을 보는 기능.
	public List<Board2DTO> selectBoard(Board2Page page) {
		 List<Board2DTO> result = session.selectList("boarddate.selectBoard", page);
		return result;
	}

	public List<Board2DTO> detailview(int boardno) {
		
		List<Board2DTO> result = session.selectList("boarddate.detailview", boardno);
		return result;
	}

	public void modiboard(Board2DTO dto) {
		
		session.update("boarddate.modiboard",dto);
	}

	public int delboard(int boardno) {
		return session.delete("boarddate.delboard",boardno);
	}

	public void writeboard(Board2DTO dto) {
		session.insert("boarddate.writeboard", dto);
	}

	public void hitplus(Board2DTO dto) {
		session.update("boarddate.hitplus",dto);
	}
	
}
