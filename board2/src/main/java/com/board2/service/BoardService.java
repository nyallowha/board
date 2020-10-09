package com.board2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board2.DTO.Board2DTO;
import com.board2.DTO.Board2Page;
import com.board2.dao.BoardDAO;

@Service
public class BoardService {
	@Autowired BoardDAO dao;

	public List<Board2DTO> seeboardService(Board2DTO dto) {
		List<Board2DTO> result = dao.seeboarddao(dto);
		return result;
	}

	public int countBoard() {
		return dao.countBoard();
	}
	public List<Board2DTO> selectBoard(Board2Page page){
		 List<Board2DTO> result = dao.selectBoard(page);
		return result;
		 
	}

	public List<Board2DTO> detailview(int boardno) {
		
		List<Board2DTO> result = dao.detailview(boardno);
		return result;
	}

	public void modiboard(Board2DTO dto) {
		dao.modiboard(dto);
	}

	public int delboard(int boardno) {
		return dao.delboard(boardno);
		
	}

	public void writeboard(Board2DTO dto) {
		dao.writeboard(dto);
	}

	public void hitplus(Board2DTO dto) {
		dao.hitplus(dto);
	}
	
}
