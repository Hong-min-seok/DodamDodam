package com.co.Dodam.Service.Board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.co.Dodam.Dao.BoardDAO;
import com.co.Dodam.Dto.CommentDTO;

@Service
public class BoardWriteService {

	@Autowired
	BoardDAO dao;

	public void boardWrite(HttpServletRequest request, Model model, MultipartFile file) throws IOException {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date time = new Date();
		String nowTime = format1.format(time);
		String savedName;

		System.out.println("nowTime : " + nowTime);

		Map<String, Object> board = new HashMap<String, Object>();
		int index = 0;

		ArrayList<Integer> indexArr = dao.getIndex();
		if (!indexArr.isEmpty()) {
			index = indexArr.get(0) + 1;
		}
		
		try {
			
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "resources/upload/";
			savedName = file.getOriginalFilename();
			File target = new File(root_path + attach_path, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
			
		} catch (Exception e) {
			savedName = null;
		}

		board.put("index", index);
		board.put("userid", request.getParameter("userid"));
		board.put("nick", request.getParameter("nick"));
		board.put("title", request.getParameter("title"));
		board.put("content", request.getParameter("content"));
		board.put("date", nowTime);
		board.put("photo", savedName);
		board.put("hit", 0);
		board.put("like", new ArrayList<String>());
		board.put("comment", new ArrayList<CommentDTO>());

		dao.BoardWrite(board);

	}

}
