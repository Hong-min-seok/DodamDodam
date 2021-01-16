package com.co.Dodam.Service.Diary;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DeviceDataDTO;

@Service("Diary_WriteService")
public class Diary_WriteService {

	@Autowired
	DiaryDAO dao;


	public void Dwrite(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		System.out.println(request.getParameter("device_id"));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String nowTime = format1.format(time);
		

		Map<String, Object> diary = new HashMap<String, Object>();
		int index=0;

		ArrayList<Integer> indexArr = dao.getIndex();
		if(!indexArr.isEmpty()) {
			index=indexArr.get(0)+1;
		}
		
		DeviceDataDTO deviceDataDTO= dao.getDeviceData(request.getParameter("device_id"));
		
		
		diary.put("index", index);
		diary.put("date", nowTime);
		diary.put("device_id", request.getParameter("device_id"));
		diary.put("nick", request.getParameter("nick"));
		diary.put("userid", request.getParameter("userid"));
		diary.put("f_name", request.getParameter("f_name"));
		diary.put("f_nick", request.getParameter("f_nick"));
		diary.put("title", request.getParameter("title"));
		diary.put("img", request.getAttribute("img"));
		diary.put("content", request.getParameter("content"));
		diary.put("review", request.getParameter("review"));
		diary.put("like", new ArrayList<String>());
		diary.put("hit", 0);
		diary.put("temp", deviceDataDTO.getTemp());
		diary.put("humi", deviceDataDTO.getHumi());
		diary.put("mois", deviceDataDTO.getMois());
		
		
		System.out.println("deviceDataDTO"+deviceDataDTO.getDate()+"/"+deviceDataDTO.getTime()+"/"+deviceDataDTO.getHumi()+"/"+deviceDataDTO.getTemp());
		
		dao.DWrite(diary);

	}
}
