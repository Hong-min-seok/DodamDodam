package com.co.Dodam.Service.MyGarden;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.listDAO;
import com.co.Dodam.Dto.memberDTO;

@Service
public class inputMyplantsService {

	@Autowired
	listDAO dao;

	public void inputMyplantsService(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		
		String userid = user.getUserid();
		String device_id = request.getParameter("device_id");
		System.out.println("device_id:"+device_id);
		String f_nick = request.getParameter("f_nick");
		System.out.println("f_nick:"+f_nick);
		String f_name = request.getParameter("f_name");
		System.out.println("f_name:"+f_name);
		String f_shape = request.getParameter("f_shape");
		String f_date = request.getParameter("f_date");
		
		model.addAttribute("f_nick", f_nick);
		model.addAttribute("f_shape", f_shape);

		// device document
		Map<String, Object> devicemap = new HashMap<String, Object>();

		// flower document
		Map<String, Object> flowermap = new HashMap<String, Object>();

		flowermap.put("f_nick", f_nick);
		flowermap.put("f_name", f_name);
		flowermap.put("f_date", f_date);
		flowermap.put("f_shape", f_shape);
		System.out.println("flower map�뿉 put �꽦怨�");

		devicemap.put("device_id", device_id);
		devicemap.put("flower", flowermap);
		System.out.println("device map�뿉 put �꽦怨�");

		if (!dao.check(device_id)) {
			dao.inputdevice(devicemap);
			System.out.println("device�뿉 insert �꽦怨�");
		} else {
			// �빐�떦 device_id�쓽 �떇臾쇱젙蹂� �닔�젙
			dao.updatedevice(devicemap);
			System.out.println("device�뿉 update �꽦怨�");

		}
		
		dao.register(userid, device_id);

	}
}
