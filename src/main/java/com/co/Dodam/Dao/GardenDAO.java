package com.co.Dodam.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Dto.member_deviceDTO;

public class GardenDAO {

	@Autowired
	MongoTemplate mongoTemplate;

	public DeviceDTO getDeviceInfo(String device_id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("device_id").is(device_id));

		DeviceDTO info = mongoTemplate.findOne(query, DeviceDTO.class, "device");
		return info;
	}

	public String getFlowerImg(String f_name) {

		Query query = new Query();
		query.addCriteria(Criteria.where("f_name").is(f_name));

		String img = mongoTemplate.findOne(query, dictionaryDTO.class, "dictionary").getF_img();
		return img;
	}

	public void deletePlantService(String userid, String device_id) {

		Query query = new Query();
		Query query1 = new Query();
		Update update = new Update();
		Update update1 = new Update();

		System.out.println(userid);
		System.out.println(device_id);

		query.addCriteria(Criteria.where("userid").is(userid));
		query.addCriteria(Criteria.where("device.device_id").is(device_id));

		update.set("device.$.register", false);

		mongoTemplate.updateFirst(query, update, "member");

		query1.addCriteria(Criteria.where("device_id").is(device_id));
		update1.unset("flower");

		mongoTemplate.updateFirst(query1, update1, "device");

	}

	public List<DeviceDTO> getAllDeviceInfo(String f_name) {

		Query query = new Query();
		query.addCriteria(Criteria.where("flower.f_name").is(f_name));
		return mongoTemplate.find(query, DeviceDTO.class, "device");
	}

	public void modifyPlantService(String device_id, String f_name, String f_nick, String f_shape, String f_date) {
		Query query = new Query();
		Update update = new Update();

		query.addCriteria(Criteria.where("device_id").is(device_id));
		update.set("flower.f_name", f_name);
		update.set("flower.f_nick", f_nick);
		update.set("flower.f_shape", f_shape);
		update.set("flower.f_date", f_date);

		mongoTemplate.updateFirst(query, update, "device");
	}

	public boolean checkFnickDuplication(member_deviceDTO[] deviceList, String nowdevice, String f_nick) {

		Query query;

		for (member_deviceDTO device : deviceList) {

			String device_id = device.getDevice_id();
			if (device_id.equals(nowdevice) || device.isRegister() == false)
				continue;

			query = new Query();
			query.addCriteria(Criteria.where("device_id").is(device_id));
			query.fields().include("flower");

			String existing_nick = mongoTemplate.findOne(query, DeviceDTO.class, "device").getFlower().getF_nick();

			if (existing_nick.equals(f_nick))
				return true;

		}

		return false;
	}

    public void setPhoto(String originalFilename) {
        
        String[] arr= originalFilename.split("\\$");
        System.out.println("Dao[           Ѿ     ]-"+arr[1]);
        
        Query query = new Query();
        Update update = new Update();
        query.addCriteria(Criteria.where("device_id").is(arr[0]));
        update.push("photo", originalFilename);
        mongoTemplate.updateFirst(query, update, "device");
     }


     public String[] getPhoto_List(String device_id) {
        Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

        return mongoTemplate.findOne(query, DeviceDTO.class, "device").getPhoto();

        
     }

	public DeviceDTO getFlower(String device_id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("device_id").is(device_id));
		query.fields().include("flower");
		return mongoTemplate.findOne(query, DeviceDTO.class, "device");
	}

}
