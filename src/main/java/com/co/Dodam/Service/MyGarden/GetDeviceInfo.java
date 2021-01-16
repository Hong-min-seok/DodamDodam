package com.co.Dodam.Service.MyGarden;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.DeviceDTO;

@Service
public class GetDeviceInfo {

	@Autowired
	GardenDAO dao;
	
	public DeviceDTO getDeviceInfo(String device_id) {
		
		return dao.getDeviceInfo(device_id);
	}

}
