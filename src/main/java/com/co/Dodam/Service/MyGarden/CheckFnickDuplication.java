package com.co.Dodam.Service.MyGarden;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.member_deviceDTO;

@Service
public class CheckFnickDuplication {
	
	@Autowired
	GardenDAO dao;

	public boolean checkFnickDuplication(member_deviceDTO[] deviceList, String nowdevice, String f_nick) {
		// TODO Auto-generated method stub
		return dao.checkFnickDuplication(deviceList, nowdevice, f_nick);
	}


}
