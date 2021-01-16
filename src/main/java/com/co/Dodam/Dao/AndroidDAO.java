package com.co.Dodam.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.co.Dodam.Dto.AndroidMemberDTO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.DeviceDataDTO;
import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Dto.flowerDTO;
import com.co.Dodam.Dto.memberDTO;
import com.co.Dodam.Dto.member_deviceDTO;

public class AndroidDAO {

	@Autowired
	MongoTemplate mongoTemplate;

	public AndroidMemberDTO getMember(String userid, String pw) {
		// TODO Auto-generated method stub

		AndroidMemberDTO member = new AndroidMemberDTO();

		Query query = new Query(
				new Criteria().andOperator(Criteria.where("userid").is(userid), Criteria.where("pw").is(pw)));

		member = mongoTemplate.findOne(query, AndroidMemberDTO.class, "member");

		if (member == null) {

			return null;

		}

		System.out.println("id : " + member.getUserid() + ", pw : " + member.getPw());

		return member;
	}

	public DeviceDTO getDeviceData(String device_id) {
		ArrayList<DeviceDTO> list = new ArrayList<DeviceDTO>();

		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		return mongoTemplate.findOne(query, DeviceDTO.class, "device");
	}
	
	///Èñ°æ Ãß°¡---------
	public dictionaryDTO getFlowerInfo(String f_name) {
		Query query = new Query();
		query.addCriteria(Criteria.where("f_name").is(f_name));
		
		return mongoTemplate.findOne(query, dictionaryDTO.class, "dictionary");
	}
	//-------------
	
	public void addDevice(String device_id, String user_id) {

	      addMemberDevice(device_id, user_id);
	      addDeviceDevice(device_id);

	   }

	   public void addMemberDevice(String device_id, String user_id) {

	      Query query = new Query();
	      query.addCriteria(Criteria.where("userid").is(user_id));

	      Update update = new Update();

	      memberDTO member = mongoTemplate.findOne(query, memberDTO.class, "member");
	      member_deviceDTO[] devices = member.getDevice();

	      Map<String, Object> map = new HashMap<String, Object>();

	      boolean flag = false;

	      for (int i = 0; i < devices.length; i++) {

	         if (devices[i].getDevice_id().equals(device_id)) {

	            flag = true;

	         }

	      }
	      
	      if(!flag) {
	         
	         map.put("device_id", device_id);
	         map.put("register", false);
	         
	         update.push("device", map);
	         mongoTemplate.updateFirst(query, update, "member");
	         
	      }

	   }

	   public void addDeviceDevice(String device_id) {
	      System.out.println("addDeviceDevice");

	      Query query = new Query();
	      query.addCriteria(Criteria.where("device_id").is(device_id));
	      System.out.println(device_id);


	      if (mongoTemplate.findOne(query, DeviceDTO.class, "device") == null) {
	         Map<String, Object> device = new HashMap<String, Object>();
	         device.put("device_id", device_id.trim());
	         device.put("data", new ArrayList<DeviceDataDTO>());
	         device.put("flower", new flowerDTO());
	         device.put("water", new ArrayList<String>());

	         mongoTemplate.insert(device, "device");
	      }

	   }

}
