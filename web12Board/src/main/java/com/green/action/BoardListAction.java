package com.green.action;

import java.io.IOException;
import java.util.List;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실질적으로 게시물 목록을 가져와서 출력하는 기능을 수행하기 위한 메서드
//		String url = "board/boardList.jsp";
//		
//		BoardDao dao = BoardDao.getInstance();
//		List<BoardVo> lists = dao.selectAllBoards();
//		request.setAttribute("lists", lists);
//		
//		request.getRequestDispatcher(url).forward(request, response);
		
// ----------------------------------------------------------------------------------------------------
		// 페이징 이후 변경 내용
		String url = "board/boardList.jsp";
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null)? "1" : _section);
		int pageNum = Integer.parseInt((_section == null)? "1" : _pageNum);
		
		BoardDao dao = BoardDao.getInstance();
		int totalCnt = dao.selectAllNum();
		List<BoardVo> lists = dao.selectTargetBoards(section, pageNum);
		
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("section", section);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("lists", lists);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}