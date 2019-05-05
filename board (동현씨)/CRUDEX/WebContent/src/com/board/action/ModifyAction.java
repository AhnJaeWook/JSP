package com.board.action;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

import java.sql.*;
import com.board.beans.board;


public class ModifyAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		board test = BoardDao.getInstance().getArticle(idx);
		int count = test.getCount();
		
		if (title =="" || title ==null) System.out.println("title이 null이다");
		if (writer == "" || writer == null ) System.out.println("writer가 null이다");
			else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
				System.out.println("이메일 형식이 아니다");
		if (content == "" || content == null) System.out.println("content가 null이다");
		
		board article = new board();
		article.setIdx(idx);
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setCount(count);
		
		BoardDao.getInstance().updateArticle(article);
		
		return "content.do?idx="+idx;
	}

}
