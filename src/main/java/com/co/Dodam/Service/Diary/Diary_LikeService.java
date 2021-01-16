package com.co.Dodam.Service.Diary;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DiaryDTO;
import com.co.Dodam.Dto.memberDTO;

@Service("Diary_LikeService")
public class Diary_LikeService {
	@Autowired
	DiaryDAO dao;

	public Map<String, Object> likeUp(Map<String, Object> info) {

		Map<String, Object> retVal;
		retVal = dao.likeUp(info);
		return retVal;
	}

	public void likeUp(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("flag", false);
		} else {

			String userid = user.getUserid();
			int index = Integer.parseInt(request.getParameter("index"));
			boolean flag = dao.likeUp(userid, index);
			System.out.println("여기까지 왔다");
			model.addAttribute("flag", flag);
		}
	}

}
