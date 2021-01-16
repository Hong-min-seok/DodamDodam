package com.co.Dodam.Service.Diary;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DiaryDTO;


@Service("Diary_DetailService")
public class Diary_DetailService {
	@Autowired
	DiaryDAO dao;
	


	public void DGet(Model model) throws ParseException {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int index=Integer.parseInt(request.getParameter("index"));
		dao.hitUp(index);
		
		DiaryDTO diaryDTO=dao.DGet(index);
		
		
		try {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			String plantDay=dao.getPlantDay(diaryDTO.getDevice_id());
			
			Date plantBirth = formatter.parse(plantDay);
			Date writeDay = formatter.parse(diaryDTO.getDate());
			
			long diff = writeDay.getTime() - plantBirth.getTime();
			long diffDays = diff / (24*60*60*1000);
			model.addAttribute("Dday", diffDays+1);
			
		} catch (Exception e) {
			model.addAttribute("Dday", -99);
		}
		
		model.addAttribute("diaryDTO", diaryDTO);
	}

}
