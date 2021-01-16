package com.co.Dodam.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.co.Dodam.Dto.dictionaryDTO;

public class listDAO {

	@Autowired
	private MongoTemplate mongoTemplate;

	public List<dictionaryDTO> getDictionaryList() {

		Query query = new Query();
		query.with(new Sort(Sort.Direction.ASC, "f_name"));

		List<dictionaryDTO> list = (List<dictionaryDTO>) mongoTemplate.find(query, dictionaryDTO.class, "dictionary");

		System.out.println("**plantsDAO-list==" + list);

		return list;
	}

	public List<dictionaryDTO> getDictionaryList(String init, int page) {

		Query query = new Query();
		query.with(new Sort(Sort.Direction.ASC, "f_name"));

		if (init != null) {

			query.addCriteria(Criteria.where("init").is(init));
		}

		List<dictionaryDTO> list = (List<dictionaryDTO>) mongoTemplate.find(query.skip((page - 1) * 12).limit(12),
				dictionaryDTO.class, "dictionary");

		System.out.println("**plantsDAO-list==" + list);

		return list;
	}

	public boolean check(String device_id) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("device_id").is(device_id)));

		if (mongoTemplate.findOne(query, Map.class, "device") != null) {
			System.out.println(device_id + " is in DB");
			return true;
		} else {
			System.out.println(device_id + " is not in DB");
			return false;
		}
	}

	public void inputdevice(Map<String, Object> devicemap) {
		mongoTemplate.insert(devicemap, "device");
	}

	public void updatedevice(Map<String, Object> devicemap) {

		Criteria criteria = new Criteria("device_id");
		criteria.is((String) devicemap.get("device_id"));

		Query query = new Query(criteria);
		Update update = new Update();

		update.set("flower.f_nick", (String) ((HashMap) devicemap.get("flower")).get("f_nick"));
		update.set("flower.f_name", (String) ((HashMap) devicemap.get("flower")).get("f_name"));
		update.set("flower.f_date", (String) ((HashMap) devicemap.get("flower")).get("f_date"));
		update.set("flower.f_shape", (String) ((HashMap) devicemap.get("flower")).get("f_shape"));

		mongoTemplate.updateMulti(query, update, "device");
	}

	public List<dictionaryDTO> getdictionaryDetail(String f_name) {

		System.out.println("�떇臾쇰룄媛� f_name:" + f_name);

		Query query = new Query(new Criteria().andOperator(Criteria.where("f_name").is(f_name)));

		List<dictionaryDTO> list = (List<dictionaryDTO>) mongoTemplate.find(query, dictionaryDTO.class, "dictionary");

		return list;
	}

	// ajax
	public List<dictionaryDTO> getDictionaryList(Map<String, Object> searchData) {
	      Query query = new Query();
	      //query.limit(10);
	      query.with(new Sort(Sort.Direction.ASC, "f_name"));
	      query.addCriteria(Criteria.where("f_name").regex((String)searchData.get("searchname")));
	      System.out.println("(String)searchData.get(\"searchname\"): "+ (String)searchData.get("searchname"));
	      
	      List<dictionaryDTO> list = (List<dictionaryDTO>)mongoTemplate.find(query, dictionaryDTO.class,"dictionary");
	      return list;
	   }


	/*
	 * public List<dictionaryDTO> getDictionaryInit(String init, int page) {
	 * 
	 * Query query = new Query(new
	 * Criteria().andOperator(Criteria.where("init").is(init)));
	 * 
	 * List<dictionaryDTO> list =
	 * (List<dictionaryDTO>)mongoTemplate.find(query.skip((page-1)*12).limit(12),
	 * dictionaryDTO.class,"dictionary");
	 * 
	 * return list; }
	 */

	public void register(String userid, String device_id) {
		Query query = new Query();
		Update update = new Update();

		System.out.println(userid);
		System.out.println(device_id);
		query.addCriteria(Criteria.where("userid").is(userid));
		query.addCriteria(Criteria.where("device.device_id").is(device_id));
		update.set("device.$.register", true);
		mongoTemplate.updateFirst(query, update, "member");

	}

	public int getListCount(HttpServletRequest request) {

		if (request.getParameter("init") == null) {

			Query query = new Query();

			return (int) mongoTemplate.count(query, "dictionary");

		} else {

			Query query = new Query();
			query.addCriteria(Criteria.where("init").is(request.getParameter("init")));

			return (int) mongoTemplate.count(query, "dictionary");
		}
	}
	
	  public List<dictionaryDTO> getdictionaryDetail(Map<String, Object> fname) {
	      
	      System.out.println("fname In listDAO=" + fname);
	      
	      Query query = new Query(new Criteria().andOperator(Criteria.where("f_name").is(fname.get("detail_fname"))));

	      System.out.println("query In listDAO: " + query);
	      
	      List<dictionaryDTO> list = (List<dictionaryDTO>) mongoTemplate.find(query, dictionaryDTO.class, "dictionary");
	      
	      System.out.println("list In listDAO: " + list);

	      return list;
	   }

	public dictionaryDTO getGrowingInfo(String fname) {
		
		Query query = new Query();
		query.addCriteria(Criteria.where("f_name").is(fname));
		return mongoTemplate.findOne(query, dictionaryDTO.class, "dictionary");
		
	}

}
