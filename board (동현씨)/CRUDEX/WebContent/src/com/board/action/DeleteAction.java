package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

import java.sql.*;

public class DeleteAction implements CommandAction{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws SQLException{
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDao.getInstance().deleteArticle(idx);
		
		return "list.do";
	}
	
}
