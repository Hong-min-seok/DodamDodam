package com.co.Dodam.Service.Diary;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.flowerDTO;

@Service("Diary_WriteDefaultService")
public class Diary_WriteDefaultService {

	@Autowired
	DiaryDAO dao;
	




	public void flowerInfo(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		flowerDTO flowerInfo=dao.flowerInfo(request.getParameter("device_id"));
		
		model.addAttribute("flowerInfo",flowerInfo);
		
	}

}
