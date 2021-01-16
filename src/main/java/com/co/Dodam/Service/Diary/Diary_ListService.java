package com.co.Dodam.Service.Diary;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DiaryDTO;

@Service("Diary_ListService")
public class Diary_ListService{

	@Autowired
	DiaryDAO dao;


	public void DList(HttpServletRequest request, Model model) {
		
		System.out.println("Diary_ListService�엯�옣");
		
		int count;
		int page;

		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		List<DiaryDTO> diaryDTOs= dao.DList(page);
		count = dao.getListCount();
		
		if (diaryDTOs.size() == 0) model.addAttribute("exist", false);
		else model.addAttribute("exist", true);
		
		model.addAttribute("maxpage", count);
		model.addAttribute("diaryDTOs", diaryDTOs);
	
	}


	public void delete(HttpServletRequest request) {
		
		String index = request.getParameter("index");
		dao.deleteDiary(index);
		
	}


public void modify(HttpServletRequest request, Model model) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		DiaryDTO diaryDTO = dao.DGet(index);
		System.out.println("제목: "+diaryDTO.getTitle());
		System.out.println("관찰내용: "+diaryDTO.getContent());
		System.out.println("리뷰: "+diaryDTO.getReview());
		
		model.addAttribute("diaryDTO", diaryDTO);
		
	}


	public void DList(HttpServletRequest request, Model model, String searchtext, String searchcriteria) {
		
		
		int page;

		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		List<DiaryDTO> diaryDTOs= dao.DList(page, searchtext, searchcriteria);
		
		if (diaryDTOs.size() == 0) model.addAttribute("exist", false);
		else model.addAttribute("exist", true);
		
		model.addAttribute("diaryDTOs", diaryDTOs);
	}

}
