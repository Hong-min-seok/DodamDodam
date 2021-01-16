package com.co.Dodam.Service.Board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.BoardDAO;

@Service
public class BoardHitUpService {

	@Autowired
	BoardDAO dao;

	public void hitUp(HttpServletRequest request) {

		int index = Integer.parseInt(request.getParameter("index"));
		
		dao.hitUp(index);
		
	}
}
