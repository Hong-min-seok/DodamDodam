package com.co.Dodam.Service.Board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.BoardDAO;

@Service
public class BoardCommentDeleteService {

	@Autowired
	BoardDAO dao;
	
	public void boardCommentDelete(Map<String, Object> info) {
		
		int parent_index = Integer.parseInt((String)info.get("parent_index"));
		int comment_index = (Integer) info.get("comment_index");
		
		dao.boardCommentDelete(parent_index, comment_index);
	}

}
