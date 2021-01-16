package com.co.Dodam.Service.Board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.co.Dodam.Dao.BoardDAO;

@Service
public class BoardModifyProcessService {

	@Autowired
	BoardDAO dao;

	public void boardModifyProcess(HttpServletRequest request, MultipartFile file) throws IOException {

		int index = Integer.parseInt(request.getParameter("index"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String curphoto = request.getParameter("curphoto");
		String savedName;

		if (curphoto == null) {

			try {

				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/upload/";
				savedName = file.getOriginalFilename();
				File target = new File(root_path + attach_path, savedName);
				FileCopyUtils.copy(file.getBytes(), target);

			} catch (Exception e) {
				savedName = null;
			}
		}

		else {
			try {

				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/upload/";
				savedName = file.getOriginalFilename();
				File target = new File(root_path + attach_path, savedName);
				FileCopyUtils.copy(file.getBytes(), target);

			} catch (Exception e) {
				savedName = curphoto;
			}
		}

		dao.boardModifyProcess(index, title, content, savedName);

	}
}
