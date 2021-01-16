package com.co.Dodam.Service.Diary;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.DiaryDTO;
import com.co.Dodam.Service.MyGarden.CalcDiffDays;

@Service("Diary_PlantOneListService")
public class Diary_PlantOneListService {
	
	@Autowired
	DiaryDAO dao;
	
	@Autowired
	CalcDiffDays calcDiffDays;

	public void plantOneList(Model model) throws ParseException {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<DiaryDTO> diaryDTOs= dao.plantOneList(request.getParameter("device_id"));
		String plantDay=dao.getPlantDay(request.getParameter("device_id"));
		String f_nick=dao.getF_nick(request.getParameter("device_id"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date plantBirth = formatter.parse(plantDay);
		
		ArrayList<Long> dDay= new ArrayList<Long>();
		
		for(DiaryDTO d: diaryDTOs) {
			Date writeDay = formatter.parse(d.getDate());
			
			long diff = writeDay.getTime() - plantBirth.getTime();
			long diffDays = diff / (24*60*60*1000);
			
			dDay.add(diffDays);
		}
		
		
		
		
		model.addAttribute("dDay", dDay);
		model.addAttribute("diaryDTOs",diaryDTOs);
		model.addAttribute("f_nick",f_nick);
		
	}

}
