package com.co.Dodam.Dao;

import java.util.ArrayList;
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

import com.co.Dodam.Dto.BoardDTO;

public class BoardDAO {
	
	@Autowired
	MongoTemplate mongoTemplate;
	
	public ArrayList<BoardDTO> getboardlist(int page) {
	      
	      Query query = new Query();
	      query.with(new Sort(Sort.Direction.DESC, "index"));
	      
	      
	      return (ArrayList<BoardDTO>) mongoTemplate.find(query.skip((page - 1) * 10).limit(10), BoardDTO.class, "board");
	   }

	public ArrayList<Integer> getIndex() {
		List<BoardDTO> board = mongoTemplate.findAll(BoardDTO.class, "board");
		ArrayList<Integer> indexArr = new ArrayList<Integer>();
		for (BoardDTO d : board) {
			indexArr.add(d.getIndex());
		}
		Collections.sort(indexArr, Collections.reverseOrder());
		for (int i : indexArr) {
			System.out.println(i);
		}
		return indexArr;
	}

	public void BoardWrite(Map<String, Object> board) {
		
		mongoTemplate.insert(board, "board");
		
	}

	public BoardDTO getBoardDetail(int index) {
		
		Query query = new Query(Criteria.where("index").is(index));
		
		BoardDTO board = (BoardDTO) mongoTemplate.findOne(query, BoardDTO.class, "board");
		
		return board;
	}

	public int getCommentIndex(int index) {
		
		Query query = new Query();
		query.addCriteria(Criteria.where("index").is(index));
		query.fields().include("comment");
		
		BoardDTO board = mongoTemplate.findOne(query, BoardDTO.class, "board");
		
		if (board.getComment().size() == 0) return 0;
		
		return board.getComment().get(board.getComment().size()-1).getIndex()+1;
	}

	public void boardCommentWrite(Map<String, Object> comment, int parent_index) {
		
		Query query = new Query();
		query.addCriteria(Criteria.where("index").is(parent_index));
		
		Update update = new Update();
		update.push("comment", comment);
		
		mongoTemplate.updateFirst(query, update, "board");
	}

	public void boardCommentDelete(int parent_index, int comment_index) {
		
		System.out.println(parent_index);
		System.out.println(comment_index);
		Query query = new Query(Criteria.where("index").is(parent_index));
		Update update = new Update().pull("comment", Query.query(Criteria.where("index").is(comment_index)));
		
		mongoTemplate.updateFirst(query, update, "board");
		
	}

	// 좋아요 했는지 안했는지 확인
	public boolean likeUp(String userid, int index) {
		Query query = new Query();
		query.addCriteria(Criteria.where("index").is(index));

		ArrayList<String> like = mongoTemplate.findOne(query, BoardDTO.class, "board").getLike();

		if (like.indexOf(userid) == -1) {
			return false;
		} else {
			return true;
		}
	}

	public Map<String, Object> likeUp(Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		String userid = (String) info.get("userid");
		int index = Integer.parseInt((String) info.get("index"));

		Query query = new Query();
		Update update = new Update();
		query.addCriteria(Criteria.where("index").is(index));
		query.fields().include("like");

		ArrayList<String> like = mongoTemplate.findOne(query, BoardDTO.class, "board").getLike();

		if (like.indexOf(userid) == -1) {
			System.out.println(userid + "디비에 없다");
			update.push("like", userid);
			mongoTemplate.updateFirst(query, update, "board");
			retVal.put("flag", true);
		} else {
			System.out.println(userid + "디비에 있다");
			update.pull("like", userid);
			mongoTemplate.updateFirst(query, update, "board");
			retVal.put("flag", false);
		}

		int count = mongoTemplate.findOne(query, BoardDTO.class, "board").getLike().size();
		retVal.put("like", count);
		return retVal;
	}

	public void boardDelete(int index) {
		
		Query query = new Query(Criteria.where("index").is(index));
		
		mongoTemplate.remove(query, "board");
		
	}

	public void boardModifyProcess(int index, String title, String content, String photo) {
		
		Query query = new Query(Criteria.where("index").is(index));
		Update update = new Update();
		
		update.set("title", title);
		update.set("content", content);
		update.set("photo", photo);
		
		mongoTemplate.updateFirst(query, update, "board");
	}

	public void hitUp(int index) {
		
		Query query = new Query(Criteria.where("index").is(index));
		Update update = new Update();
		update.inc("hit", 1);
		
		mongoTemplate.updateFirst(query, update, "board");
		
	}


}
