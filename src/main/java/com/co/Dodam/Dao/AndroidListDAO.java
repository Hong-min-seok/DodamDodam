package com.co.Dodam.Dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.co.Dodam.Dto.AndroidMemberDTO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.flowerDTO;
import com.co.Dodam.Dto.memberDTO;
import com.co.Dodam.Dto.member_deviceDTO;

public class AndroidListDAO {
	
	@Autowired
	MongoTemplate mongoTemplate;

	public member_deviceDTO[] getDevice(String userid) {
		
		
		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(userid)));

		return mongoTemplate.findOne(query, memberDTO.class, "member").getDevice();
		
	}

	public flowerDTO getFlower(String device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		return mongoTemplate.findOne(query, DeviceDTO.class, "device").getFlower();
		
	}

}
