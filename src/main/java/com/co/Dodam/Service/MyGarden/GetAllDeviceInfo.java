package com.co.Dodam.Service.MyGarden;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.DeviceDTO;

@Service
public class GetAllDeviceInfo {
	
	@Autowired
	GardenDAO dao;

	public List<DeviceDTO> getAllDeviceInfo(String f_name) {
		
		return dao.getAllDeviceInfo(f_name);

	}

}
