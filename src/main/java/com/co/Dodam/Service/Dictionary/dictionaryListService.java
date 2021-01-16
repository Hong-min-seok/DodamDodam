package com.co.Dodam.Service.Dictionary;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.listDAO;
import com.co.Dodam.Dto.dictionaryDTO;

@Service
public class dictionaryListService {

	@Autowired
	listDAO dao;

	public List<dictionaryDTO> getDictionaryList() {
		System.out.println("plantsListService");
		List<dictionaryDTO> plantslist = dao.getDictionaryList();
		System.out.println("****serivce-list" + plantslist);
		return plantslist;
	}

	public List<dictionaryDTO> getDictionaryList(String init, int page) {
		System.out.println("plantsListService");
		List<dictionaryDTO> plantslist = dao.getDictionaryList(init, page);
		System.out.println("****serivce-list" + plantslist);
		return plantslist;
	}

	// ajax
	public List<dictionaryDTO> getDictionaryList(Map<String, Object> searchData) {
		System.out.println("[ajax] Service");

		List<dictionaryDTO> list = dao.getDictionaryList(searchData);


		return list;
	}

	/*
	public List<dictionaryDTO> dictionaryInit(HttpServletRequest request, Model model) {

		int page;

		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		String init = request.getParameter("init");
		
		System.out.println("init:" + init);
		List<dictionaryDTO> list = dao.getDictionaryInit(init, page);

		System.out.println("dictionaryInit list:" + list);
		
		model.addAttribute("currentpage", page);

		return list;
	}
	*/

	public int getListCount(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return dao.getListCount(request);
	}


}
