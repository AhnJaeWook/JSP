package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

import java.sql.*;
import java.util.regex.Pattern;
import com.board.beans.board;
public class InsertAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int count = 0;
		String regip = request.getRemoteAddr();
		
		if(title == "" || title ==null) System.out.println("title이 null이다");
		
		if(writer == "" || writer == null ) System.out.println("writer가 null이다");
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
			System.out.println("이메일 형식이 아니다");
		
		if(content =="" || content == null) System.out.println("content가 null이다 ");
		
		board article = new board();
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setCount(count);
		article.setRegip(regip);
		BoardDao.getInstance().insertArticle(article);
		
		
		return "list.do";
	}

}
