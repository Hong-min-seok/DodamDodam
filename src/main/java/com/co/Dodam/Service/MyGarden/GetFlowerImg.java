package com.co.Dodam.Service.MyGarden;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;

@Service
public class GetFlowerImg {
	
	@Autowired
	GardenDAO dao;
	
	public String getFlowerImg(String f_name) {
		return dao.getFlowerImg(f_name);
	}

}
