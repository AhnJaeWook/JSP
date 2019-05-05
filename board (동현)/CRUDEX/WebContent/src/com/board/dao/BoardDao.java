package com.board.dao;


import java.sql.SQLException;
import java.util.ArrayList;	 
import com.board.beans.board;


public class BoardDao extends CommonDao {
	    public static BoardDao getInstance() {
	        BoardDao _instance = new BoardDao();
	        _instance.SetDB();
	        return _instance;
	    }
	    
	    
	    @SuppressWarnings("unchecked")
		public ArrayList<board>getArticleList(int page) throws SQLException{ //리스트 
	    	return (ArrayList<board>)GetDB().queryForList("getArticleList", null, page, 10);
	    }
		
	    @SuppressWarnings("unchecked")
		public board getArticle(int idx) throws SQLException{ // 콘텐츠 
	    	return (board)GetDB().queryForObject("getArticle", idx);
	    }
		
		@SuppressWarnings("unchecked")
		public void deleteArticle(int idx) throws SQLException{ // 딜리트 
			GetDB().delete("deleteArticle", idx);
			return ;
		}
		public void updateArticle(board article) throws SQLException{ // 수정 
			GetDB().update("updateArticle" , article);
			return ;
		}
		
		public void insertArticle(board article) throws SQLException{ // 작성 
			GetDB().insert("insertArticle", article);
			return ;
		}
		
		public void setArticleCount(board article) throws SQLException{ //count 증가
			GetDB().update("setArticleCount", article);
			return ;
		}
}
