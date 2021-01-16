package com.co.Dodam.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.co.Dodam.Dao.AndroidDAO;
import com.co.Dodam.Dao.AndroidListDAO;
import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.AndroidMemberDTO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.DeviceDataDTO;
import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Dto.flowerDTO;
import com.co.Dodam.Dto.member_deviceDTO;
import com.co.Dodam.Service.MyGarden.GetDeviceInfo;

@Controller
public class AndroidController {

	@Autowired
	AndroidDAO androidMemberDAO;
	@Autowired
	GardenDAO gardenDAO;
	@Autowired
	AndroidListDAO androidListDAO;
	@Autowired
	GetDeviceInfo GetDeviceInfo;
	
	@RequestMapping(value="/AndroidLogin", method=RequestMethod.POST)
	@ResponseBody
	public Map<String ,String> AndroidRequestAndResponse(HttpServletRequest request){

		System.out.println("in Android Login");
		
		Map<String, String> result = new HashMap<String, String>();
		
		AndroidMemberDTO member = new AndroidMemberDTO();
		
		member = androidMemberDAO.getMember(request.getParameter("userid"), request.getParameter("pw"));
		
		if(member == null){
			
			return null;
			
		}
		
		result.put("userid", member.getUserid());
		result.put("pw", member.getPw());
		
		return result;
		
	}
	
	//---민석 추가 달력
	@RequestMapping(value="/AndroidCalendar", method=RequestMethod.POST)
	@ResponseBody
	public Map<String ,Object> AndroidCalendar(HttpServletRequest request){

		System.out.println("in Android Calendar");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		DeviceDTO device = new DeviceDTO();
		
		device = gardenDAO.getDeviceInfo(request.getParameter("device_id"));
		
		if(device == null){
			
			return null;
			
		}
		
		result.put("water", device.getWater());
		result.put("f_nick", device.getFlower().getF_nick());
		
		return result;
		
	}
	//---------민석---------
	
	//---------효경 추가-----------
	@RequestMapping(value="/AndroidMain", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, String> AndroidMain(HttpServletRequest request){
	      
	      System.out.println("in Android Main");
	      System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	      System.out.println("device_id:"+request.getParameter("device_id").toString());
	      Map<String, String> result = new HashMap<String, String>();
	      
	      DeviceDataDTO data = new DeviceDataDTO();
	      
	      ArrayList<DeviceDataDTO> dataArray = androidMemberDAO.getDeviceData(request.getParameter("device_id")).getData();
	      
	      data = dataArray.get(dataArray.size()-1);
	      System.out.println("data.Date:" + data.getDate());
	      
	      result.put("date", data.getDate());
	      result.put("time", data.getTime());
	      result.put("humi", String.valueOf(data.getHumi()));
	      result.put("temp", String.valueOf(data.getTemp()));
	      result.put("mois", String.valueOf(data.getMois()));
	      
	      return result;
	   }
	//-------효경 추가--------------

	
	//-------희경 보영---------
	@RequestMapping(value="/AndroidList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String ,Object> AndroidList(HttpServletRequest request){

		System.out.println("in Android List");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		member_deviceDTO[] deviceArr=androidListDAO.getDevice(request.getParameter("userid"));
		
		Map<String, flowerDTO> registerDeviceInfo = new HashMap<String, flowerDTO>();//�솕遺꾩씠 �벑濡앸릺�뼱�엳�뒗 湲곌린�쓽 �솕遺� �젙蹂�
		
		if(deviceArr == null){ //湲곌린�벑濡앹씠 �븳媛쒕룄 �븞�릺�뼱�엳�쓣 �븣
			
			return null;
			
		}
		
		for( member_deviceDTO m: deviceArr) { //true�씤 device�쓽 苑껋젙蹂� 李얘린
			if(m.isRegister()==true) {
				flowerDTO flowerDto=androidListDAO.getFlower(m.getDevice_id());
				result.put(m.getDevice_id(), flowerDto);
				
			}
		}

		
		return result;
	}
	
	@RequestMapping(value = "/Detail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AndroidDetail(HttpServletRequest request) {

		Map<String, Object> result = new HashMap<String, Object>();

		String device_id = request.getParameter("device_id");

		DeviceDTO deviceinfo = GetDeviceInfo.getDeviceInfo(device_id);

		String f_name = deviceinfo.getFlower().getF_name();

		dictionaryDTO flowerinfo = androidMemberDAO.getFlowerInfo(f_name);

		result.put("device_id", deviceinfo.getDevice_id());
		result.put("f_nick", deviceinfo.getFlower().getF_nick());
		result.put("f_shape", deviceinfo.getFlower().getF_shape());
		result.put("f_name", flowerinfo.getF_name());
		result.put("f_lang", flowerinfo.getF_lang());
		result.put("f_use", flowerinfo.getF_use());
		
		return result;

	}

	
	 @RequestMapping(value="/AndroidAddDevice", method = RequestMethod.POST)
	   @ResponseBody
	   public String AndroidAddDevice(HttpServletRequest request) {
	      String result = "";
	      
	      String user_id = request.getParameter("user_id");
	      String device_id = request.getParameter("device_id");
	      System.out.println("/AndroidAddDevice user_id : " + user_id);
	      System.out.println("/AndroidAddDevice device_id : " + device_id);
	      
	      try {
	         
	         androidMemberDAO.addDevice(device_id, user_id);
	         
	         result = device_id;
	         
	      }catch(Exception e) {
	         
	         e.printStackTrace();
	         result = "";
	         
	      }
	      
	      return result;
	      
	   }
}
