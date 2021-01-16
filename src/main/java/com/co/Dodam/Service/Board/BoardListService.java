package com.co.Dodam.Service.Board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.BoardDAO;
import com.co.Dodam.Dto.BoardDTO;

@Service
public class BoardListService {

	@Autowired
	   BoardDAO boardDAO;

	   public ArrayList<BoardDTO> getboardlist(HttpServletRequest request) {
	      
		  int page = Integer.parseInt(request.getParameter("page"));
	      ArrayList<BoardDTO> list = boardDAO.getboardlist(page);
	      
	      return list;
	   }
}
