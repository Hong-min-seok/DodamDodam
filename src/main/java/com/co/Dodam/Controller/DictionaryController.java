package com.co.Dodam.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Service.Dictionary.dictionaryDetailService;
import com.co.Dodam.Service.Dictionary.dictionaryListService;

@Controller
public class DictionaryController {

	@Autowired
	dictionaryListService dictionaryListService;
	@Autowired
	dictionaryDetailService dictionaryDetailService;

	// 식물도감 목록
	@RequestMapping("/dictionarylist")
	public String dictionaryList(HttpServletRequest request, Model model) {

		int page;
		String init = null;

		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		init = request.getParameter("init");
		
		
		List<dictionaryDTO> plantslist = dictionaryListService.getDictionaryList(init, page);
		List<dictionaryDTO> searchlist = dictionaryListService.getDictionaryList();

		model.addAttribute("searchlist", searchlist);
		model.addAttribute("plants", plantslist);
		
		int count = dictionaryListService.getListCount(request);
		
		model.addAttribute("init", init);
		model.addAttribute("maxpage", count);
		model.addAttribute("currentpage", page);
		
		

		return "Dictionary/dictionaryList";
	}


	// ajax로 검색한 식물 목록
	@RequestMapping(value = "/dictionarysearch", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> searchList(@RequestBody Map<String, Object> searchData) {

		Map<String, Object> data = new HashMap<String, Object>();

		List<dictionaryDTO> list = dictionaryListService.getDictionaryList(searchData);

		data.put("data", list);
		return data;
	}

	@RequestMapping(value="/dictionarydetail", method = RequestMethod.POST, produces = { "application/json" })
	   public @ResponseBody Map<String, Object> dictionaryDetail(@RequestBody Map<String, Object> fname){
	      
	      Map<String, Object> detail = new HashMap<String, Object>();
	      
	      List<dictionaryDTO> list = dictionaryDetailService.getdictionarDetail(fname);
	      
	      System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	      System.out.println("list In DictionaryController" + list);
	      System.out.println("list.toString() In dictionaryDetail()" + list.toString());
	      System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");

	      detail.put("detail", list);
	      return detail;      
	   }

}