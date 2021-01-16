package com.co.Dodam.Service.Diary;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.DiaryDAO;
import com.co.Dodam.Dto.DeviceDataDTO;
import com.co.Dodam.Dto.DiaryDTO;


@Service("Diary_ModifyService")
public class Diary_ModifyService {
	@Autowired
	DiaryDAO dao;
	

	public void modify_ok(HttpServletRequest request, Model model) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		String img=(String) request.getAttribute("img");
		String title= request.getParameter("title");
		String content=request.getParameter("content");
		String review= request.getParameter("review");
		System.out.println("인덱스: "+ index);
		System.out.println(img);
		System.out.println(title);
		System.out.println(content);
		System.out.println(review);
		
		
		dao.modify_ok(index, img, title, content,review);
		
		
	}

}
