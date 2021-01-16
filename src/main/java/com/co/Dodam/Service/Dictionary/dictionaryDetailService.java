package com.co.Dodam.Service.Dictionary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.listDAO;
import com.co.Dodam.Dto.dictionaryDTO;

@Service
public class dictionaryDetailService {
	
	@Autowired
	listDAO dao;
	
	public List<dictionaryDTO> getdictionarDetail(Map<String, Object> fname) {
	      
	      List<dictionaryDTO> list = dao.getdictionaryDetail(fname);
	      System.out.println("list In dictionaryDetailService: " + list);
	      
	      return list;
	   }
	
	public dictionaryDTO getGrowingInfo(String fname) {
		return dao.getGrowingInfo(fname);
	}
	   
}
