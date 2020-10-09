package com.board2.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.board2.DTO.Board2DTO;
import com.board2.DTO.Board2Page;
import com.board2.service.BoardService;

@Controller
public class board2Controller {
	@Autowired 
	BoardService service;
	
	
	@RequestMapping("/board")
	public ModelAndView seeboardController(ModelAndView mv,Board2DTO dto,Board2Page page
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		//페이징
		int total = service.countBoard();
		System.out.println("total의 값: "+total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		page = new Board2Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(page);
		//페이징 끝
		//List<Board2DTO> dtolist = service.seeboardService(dto);
		List<Board2DTO> dtolist2 = service.selectBoard(page);
		mv.addObject("dtolist",dtolist2);
		mv.addObject("page", page);
		mv.setViewName("board");
		return mv;
	}
	@RequestMapping("/board.com/detailview")
	public ModelAndView detailview(ModelAndView mv, Board2DTO dto,int boardno) {
		//System.out.println("detailview 페이지 진입하였습니다.");
		//System.out.println("boardno의 값 : "+boardno);
		List<Board2DTO> boardlist = service.detailview(boardno);	
		int hit = boardlist.get(0).getHit();
				int hit2 = hit+1;
				dto.setHit(hit2);
				System.out.println("dto의 값"+dto);
					service.hitplus(dto);
		mv.addObject("boardlist", boardlist);
		mv.setViewName("detailview");
		return mv;
	}
	@RequestMapping("/board.com/modiboard")
	public ModelAndView modiboard(ModelAndView mv, Board2DTO dto,int boardno) {
		System.out.println("modiboard진입");
		List<Board2DTO> boardlist = service.detailview(boardno);	
		mv.addObject("boardlist", boardlist);
		mv.setViewName("modiboard");
		return mv;
	}
	@RequestMapping("/board.com/boardmodifin")
	public ModelAndView modifin(ModelAndView mv,HttpServletRequest req,Board2DTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("modifin진입");
		int boardno     = Integer.parseInt(req.getParameter("boardno"));
		String title 	    = req.getParameter("title");
		String content  = req.getParameter("content");
		dto.setTitle(title);
		dto.setContent(content);
		dto.setBoardno(boardno);
		service.modiboard(dto);
		RedirectView rv = new RedirectView("/board");
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/board.com/delboard")
	public ModelAndView delboard (ModelAndView mv,Board2DTO dto,HttpServletRequest req) {
		//삭제하는 기능
		int boardno =  Integer.parseInt(req.getParameter("boardno"));
		int resultno = service.delboard(boardno);
		System.out.println("삭제시 결과값 int로 나옴" +resultno);
		if(resultno==0) {
			resultno = 2;
		}
		if(resultno==1) {
			resultno =3;
		}
		mv.addObject("resultno", resultno);
		//리다이렉션
		RedirectView rv = new RedirectView ("/board");
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/board.com/writePage")
	public ModelAndView writeboard(ModelAndView mv) {
		
		mv.setViewName("writePage");
		return mv;
	}
	@RequestMapping("board.com/writefin")
		public ModelAndView writefin(ModelAndView mv,Board2DTO dto,HttpServletRequest req) {
			
		String boardtitle = req.getParameter("boardtitle");
		String boardcontent = req.getParameter("boardcontent");
		
		dto.setTitle(boardtitle);
		dto.setContent(boardcontent);
		service.writeboard(dto);
		//리다이렉션
		RedirectView rv = new RedirectView ("/board");
		mv.setView(rv);
		return mv;
		}
	
	
}
