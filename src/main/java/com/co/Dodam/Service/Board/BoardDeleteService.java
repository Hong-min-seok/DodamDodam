package com.co.Dodam.Service.Board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.BoardDAO;

@Service
public class BoardDeleteService {
	
	@Autowired
	BoardDAO dao;

	public void boardDelete(HttpServletRequest request) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		dao.boardDelete(index);
		
	}

}
