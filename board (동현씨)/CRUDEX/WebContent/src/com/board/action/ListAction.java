package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;
import java.util.ArrayList;
import com.board.beans.board;

public class ListAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		
		int page = 0 ;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<board> articleList = BoardDao.getInstance().getArticleList(page);
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("page", page);
		return "list.jsp";
	}

}
