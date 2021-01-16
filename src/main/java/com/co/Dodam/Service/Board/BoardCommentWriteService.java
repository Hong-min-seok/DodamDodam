package com.co.Dodam.Service.Board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.BoardDAO;
import com.co.Dodam.Dto.CommentDTO;

@Service
public class BoardCommentWriteService {

	@Autowired
	BoardDAO dao;
	
	public Map<String, Object> boardCommentWrite(Map<String, Object> info) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date time = new Date();
		String nowTime = format1.format(time);
		
		Map<String, Object> comment = new HashMap<String, Object>();
		
		int parent_index = Integer.parseInt((String)info.get("index"));
		int index = dao.getCommentIndex(parent_index);
		
		comment.put("index", index);
		comment.put("userid", info.get("userid"));
		comment.put("nick", info.get("nick"));
		comment.put("date", nowTime);
		comment.put("content", info.get("content"));
		
		dao.boardCommentWrite(comment, parent_index);
		
		return comment;
	
	}

}
