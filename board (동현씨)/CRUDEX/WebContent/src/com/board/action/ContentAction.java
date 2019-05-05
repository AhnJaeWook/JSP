package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

import java.util.ArrayList;
import com.board.beans.board;


public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int idx = Integer.parseInt(request.getParameter("idx"));

		board article = BoardDao.getInstance().getArticle(idx);
		
		request.setAttribute("article", article);
		
		return "content.jsp";
	}

}
