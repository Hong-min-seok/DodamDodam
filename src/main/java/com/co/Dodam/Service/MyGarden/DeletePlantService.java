package com.co.Dodam.Service.MyGarden;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.memberDTO;

@Service
public class DeletePlantService {
	
	@Autowired
	GardenDAO dao;
	
	public void deletePlantService(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		
		String userid = user.getUserid();
		String device_id = request.getParameter("device_id");
		
		dao.deletePlantService(userid, device_id);
	}

}
