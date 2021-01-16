package com.co.Dodam.Service.MyGarden;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.DeviceDTO;
import com.mongodb.util.JSON;

@Service
public class WaterCalendarService {
	
	@Autowired
	GardenDAO dao;

	public void waterCalendarService(HttpServletRequest request, Model model) {
		
		String device_id = request.getParameter("device_id");
		DeviceDTO device_info = dao.getDeviceInfo(device_id);
		String[] water = device_info.getWater();
		
		List waterlist = new ArrayList();
		Map<String, String> watermap = new HashMap<String, String>();
		
		try {
			
			Arrays.sort(water, Collections.reverseOrder());
			for(int i=0; i < water.length; i++) {
				watermap.put("title", "¹°À» Áá¾î¿ä!");
				watermap.put("start", water[i]);
				
				waterlist.add(watermap);
				watermap = new HashMap<String, String>();
			}
			
			model.addAttribute("water", water[0]);
			
		} catch (Exception e) {}
		
		
		
		
		model.addAttribute("info", device_info);	
		model.addAttribute("waterlist", JSON.serialize(waterlist));
		
	}

	
}
