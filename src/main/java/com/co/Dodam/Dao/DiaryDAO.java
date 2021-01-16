package com.co.Dodam.Dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.DeviceDataDTO;
import com.co.Dodam.Dto.DiaryDTO;
import com.co.Dodam.Dto.flowerDTO;
import com.co.Dodam.Dto.memberDTO;

public class DiaryDAO {

	@Autowired
	private MongoTemplate mongoTemplate;

	public void DWrite(Map<String, Object> diary) {
		mongoTemplate.insert(diary, "diary");

	}

	public DiaryDTO DGet(int index) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("index").is(index)));

		return mongoTemplate.findOne(query, DiaryDTO.class, "diary");

	}

	public ArrayList<Integer> getIndex() {
		List<DiaryDTO> diary = mongoTemplate.findAll(DiaryDTO.class, "diary");
		ArrayList<Integer> indexArr = new ArrayList<Integer>();
		for (DiaryDTO d : diary) {
			indexArr.add(d.getIndex());
		}
		Collections.sort(indexArr, Collections.reverseOrder());
		for (int i : indexArr) {
			System.out.println(i);
		}
		return indexArr;
	}

	public List<DiaryDTO> DList(int page) {
		System.out.println("da0::DList");

		Query query = new Query();
		query.with(new Sort(Sort.Direction.DESC, "index"));

		return mongoTemplate.find(query.skip((page - 1) * 12).limit(12), DiaryDTO.class, "diary");
	}

	public Map<String, Object> likeUp(Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		String userid = (String) info.get("userid");
		int index = Integer.parseInt((String) info.get("index"));

		Query query = new Query();
		Update update = new Update();
		query.addCriteria(Criteria.where("index").is(index));

		ArrayList<String> like = mongoTemplate.findOne(query, DiaryDTO.class, "diary").getLike();

		if (like.indexOf(userid) == -1) {
			System.out.println(userid + "디비에 없다");
			update.push("like", userid);
			mongoTemplate.updateFirst(query, update, "diary");
			retVal.put("flag", true);
		} else {
			System.out.println(userid + "디비에 있다");
			update.pull("like", userid);
			mongoTemplate.updateFirst(query, update, "diary");
			retVal.put("flag", false);
		}

		int count = mongoTemplate.findOne(query, DiaryDTO.class, "diary").getLike().size();
		retVal.put("like", count);
		return retVal;
	}

	public void hitUp(int index) {
		Query query = new Query().addCriteria(Criteria.where("index").is(index));
		Update update = new Update();
		update.inc("hit", 1);
		mongoTemplate.updateFirst(query, update, "diary");
	}

	public int getListCount() {

		Query query = new Query();
		return (int) mongoTemplate.count(query, "diary");

	}

	public List<DiaryDTO> plantOneList(String device_id) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));
		query.with(new Sort(Sort.Direction.DESC, "index"));
		return mongoTemplate.find(query, DiaryDTO.class, "diary");
	}

	public String getPlantDay(Object device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		try {
			
			return mongoTemplate.findOne(query, DeviceDTO.class, "device").getFlower().getF_date();
		} catch (Exception e) {
			return "No Data";
		}
	}

	public flowerDTO flowerInfo(String device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		return mongoTemplate.findOne(query, DeviceDTO.class, "device").getFlower();
	}

	public DeviceDataDTO getDeviceData(String device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		ArrayList<DeviceDataDTO> dataArr = mongoTemplate.findOne(query, DeviceDTO.class, "device").getData();
		if (dataArr == null) {
			DeviceDataDTO deviceDataDTO = new DeviceDataDTO();
			deviceDataDTO.setMois(0);
			deviceDataDTO.setHumi(0);
			deviceDataDTO.setTemp(0);
			return deviceDataDTO;
		}
		return dataArr.get(dataArr.size() - 1);
	}

	public String getF_nick(String device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		return mongoTemplate.findOne(query, DeviceDTO.class, "device").getFlower().getF_nick();
	}

	public void deleteDiary(String index) {

		System.out.println(index);
		Query query = new Query();
		query.addCriteria(Criteria.where("index").is(Integer.parseInt(index)));

		mongoTemplate.remove(query, "diary");

	}

	public boolean likeUp(String userid, int index) {

		Query query = new Query();
		query.addCriteria(Criteria.where("index").is(index));

		ArrayList<String> like = mongoTemplate.findOne(query, DiaryDTO.class, "diary").getLike();

		if (like.indexOf(userid) == -1) {
			return false;
		} else {
			return true;
		}
	}

	public List<DiaryDTO> DList(int page, String searchtext, String searchcriteria) {
		
		
		Query query = new Query();
		query.with(new Sort(Sort.Direction.DESC, "index"));

		if (searchcriteria.equals("꽃 종류")) {
			System.out.println("꽃 종류 검색!");
			query.addCriteria(Criteria.where("f_name").regex(searchtext));
		}
		
		else if (searchcriteria.equals("닉네임")){
			query.addCriteria(Criteria.where("nick").is(searchtext));
		}
		
		else if (searchcriteria.equals("아이디")){
			query.addCriteria(Criteria.where("userid").is(searchtext));
		}
		
		
		return mongoTemplate.find(query.skip((page - 1) * 12).limit(12), DiaryDTO.class, "diary");
	}
	
	public void modify_ok(int index, String img, String title, String content, String review) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("index").is(index)));

		Update update = new Update();
		update.set("img", img);
		update.set("title", title);
		update.set("content", content);
		update.set("review", review);

		mongoTemplate.updateFirst(query, update, "diary");
		System.out.println("Diary update complete!");
		
	}

}
