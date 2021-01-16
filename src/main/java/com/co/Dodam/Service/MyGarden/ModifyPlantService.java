package com.co.Dodam.Service.MyGarden;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;

@Service
public class ModifyPlantService {
	
	@Autowired
	GardenDAO dao;

	public void modifyPlantService(String device_id, String f_name, String f_nick, String f_shape, String f_date) {
		
		dao.modifyPlantService(device_id, f_name, f_nick, f_shape, f_date);
	}


}
