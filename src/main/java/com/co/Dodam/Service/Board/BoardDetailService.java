package com.co.Dodam.Service.Board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.BoardDAO;
import com.co.Dodam.Dto.BoardDTO;

@Service
public class BoardDetailService {

	@Autowired
	BoardDAO dao;
	
	public void boardDetail(HttpServletRequest request, Model model) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		BoardDTO board = dao.getBoardDetail(index);
		
		model.addAttribute("BoardDTO", board);
		
	}

}
