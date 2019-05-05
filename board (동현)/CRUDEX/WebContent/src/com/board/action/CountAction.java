package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

import java.util.ArrayList;
import com.board.beans.board;


public class CountAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int idx = Integer.parseInt(request.getParameter("idx"));

		board article = BoardDao.getInstance().getArticle(idx);
		String regip = request.getRemoteAddr();
		
	
		
		if(!regip.equals(article.getRegip())){
			int count = article.getCount();
			count++;
			article.setCount(count);
			BoardDao.getInstance().setArticleCount(article);
		}
		
		request.setAttribute("url", "content.do?idx="+idx);
		
		System.out.println(article.getRegip());
		System.out.println(regip);
		return "redirect2.jsp";
	}

}
