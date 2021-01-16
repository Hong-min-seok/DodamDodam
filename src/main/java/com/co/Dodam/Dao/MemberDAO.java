package com.co.Dodam.Dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.co.Dodam.Dto.memberDTO;

public class MemberDAO {

	@Autowired
	private MongoTemplate mongoTemplate;

	public Map<String, Object> idDuplication(Map<String, Object> info) {

		boolean id_exist = false;
		boolean nick_exist = false;

		Map<String, Object> retVal = new HashMap<String, Object>();

		Query query1 = new Query(new Criteria().andOperator(Criteria.where("userid").is(info.get("userid"))));

		Query query2 = new Query(new Criteria().andOperator(Criteria.where("nick").is(info.get("nick"))));

		if (mongoTemplate.findOne(query1, memberDTO.class, "member") != null) {
			System.out.println("id is duplicated");
			id_exist = true;
		}

		if (mongoTemplate.findOne(query2, memberDTO.class, "member") != null) {
			System.out.println("nick is duplicated");
			nick_exist = true;
		}

		retVal.put("id_exist", id_exist);
		retVal.put("nick_exist", nick_exist);

		return retVal;
	}

	public void memberInsert(Map<String, Object> info) {

		mongoTemplate.insert(info, "member");

	}

	public boolean loginProcess(Map<String, Object> loginmap) {

		Query query1 = new Query(new Criteria().andOperator(Criteria.where("userid").is(loginmap.get("userid"))));

		if (mongoTemplate.findOne(query1, memberDTO.class, "member") == null) {
			System.out.println("not a member");
			return false;
		}

		else if (mongoTemplate.findOne(query1, memberDTO.class, "member").getPw().equals(loginmap.get("pw"))) {
			System.out.println("id and pw is correct!");
			return true;
		}

		System.out.println("id and pw is wrong!");
		return false;
	}

	public memberDTO getMemberInfo(String userid) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(userid)));
		return mongoTemplate.findOne(query, memberDTO.class, "member");
	}

	public void quiteMember(Map<String, Object> info) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(info.get("userid"))));

		mongoTemplate.remove(query, "member");
		System.out.println("remove complete!");

	}

	public boolean pwcheck(Map<String, Object> info) {

		boolean result;

		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(info.get("userid"))));

		result = mongoTemplate.findOne(query, memberDTO.class, "member").getPw().equals(info.get("currentpw"));

		return result;
	}

	public void updatepw(Map<String, Object> info) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(info.get("userid"))));

		Update update = new Update();
		update.set("pw", info.get("pw"));

		mongoTemplate.updateFirst(query, update, "member");
		System.out.println("update complete!");
	}

	public boolean nickduplicationajax(Map<String, Object> info) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("nick").is(info.get("nick"))));

		if (mongoTemplate.findOne(query, memberDTO.class, "member") == null) {
			System.out.println("nick is not in DB");
			return false;
		}

		System.out.println("nick is in DB");
		return true;
	}

	public void memberModify(Map<String, Object> info) {

		Query query = new Query();
		Update update = new Update();

		query.addCriteria(Criteria.where("userid").is(info.get("userid")));

		update.set("nick", info.get("nick"));
		update.set("email", info.get("email"));

		mongoTemplate.updateMulti(query, update, "member");
		System.out.println("modify info complete!");

	}

	public String findEmail(Object id) {
	      Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(id)));
	      
	      String uid = "";
	      
	      try {
	         
	         uid = mongoTemplate.findOne(query, memberDTO.class, "member").getEmail();
	         
	      }catch(NullPointerException npe) {
	         return "-";
	      }

	      return uid;
	   }

	public void resetPw(String id, String newpw) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("userid").is(id)));

		Update update = new Update();
		update.set("pw", newpw);

		mongoTemplate.updateFirst(query, update, "member");
		System.out.println("update complete!");

	}

	public String findId(String email) {
	      Query query = new Query(new Criteria().andOperator(Criteria.where("email").is(email)));
	      
	      String Userid;
	      
	      try {
	         Userid = mongoTemplate.findOne(query, memberDTO.class, "member").getUserid();
	         
	      }catch(NullPointerException e) {
	         return "-";
	      }      
	      
	      return Userid;
	   }


}
