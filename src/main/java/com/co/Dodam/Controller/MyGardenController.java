package com.co.Dodam.Controller;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.co.Dodam.Dao.GardenDAO;
import com.co.Dodam.Dto.DeviceDTO;
import com.co.Dodam.Dto.DeviceDataDTO;
import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Dto.memberDTO;
import com.co.Dodam.Dto.member_deviceDTO;
import com.co.Dodam.Service.Dictionary.dictionaryDetailService;
import com.co.Dodam.Service.Dictionary.dictionaryListService;
import com.co.Dodam.Service.Member.MemberService;
import com.co.Dodam.Service.MyGarden.CalcDiffDays;
import com.co.Dodam.Service.MyGarden.CheckFnickDuplication;
import com.co.Dodam.Service.MyGarden.DeletePlantService;
import com.co.Dodam.Service.MyGarden.F_PhotoService;
import com.co.Dodam.Service.MyGarden.GetAllDeviceInfo;
import com.co.Dodam.Service.MyGarden.GetDeviceInfo;
import com.co.Dodam.Service.MyGarden.GetFlowerImg;
import com.co.Dodam.Service.MyGarden.ModifyPlantService;
import com.co.Dodam.Service.MyGarden.WaterCalendarService;
import com.co.Dodam.Service.MyGarden.inputMyplantsService;

@Controller
public class MyGardenController {

	@Autowired
	GardenDAO GardenDAO;
	
	@Autowired
	dictionaryListService dictionaryListService;
	@Autowired
	inputMyplantsService regisMyplantsService;
	@Autowired
	GetDeviceInfo GetDeviceInfo;
	@Autowired
	MemberService MemberService;
	@Autowired
	CalcDiffDays CalcDiffDays;
	@Autowired
	GetFlowerImg GetFlowerImg;
	@Autowired
	DeletePlantService DeletePlantService;
	@Autowired
	WaterCalendarService WaterCalendarService;
	@Autowired
	GetAllDeviceInfo GetAllDeviceInfo;
	@Autowired
	dictionaryDetailService dictionaryDetailService;
	@Autowired
	ModifyPlantService ModifyPlantService;
	@Autowired
	CheckFnickDuplication CheckFnickDuplication;
	@Autowired
	F_PhotoService f_PhothService;

	@RequestMapping("/regismyplants")
	public String regisMyPlants(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		String userid = user.getUserid();
		user = MemberService.getMemberInfo(userid);
		member_deviceDTO[] deviceList = user.getDevice();

		List<dictionaryDTO> plantslist = dictionaryListService.getDictionaryList();
		model.addAttribute("plants", plantslist);
		model.addAttribute("deviceList", deviceList);
		return "MyGarden/regisMyplants";
	}

	@RequestMapping("/inputmyplants")
	public String inputMyPlants(HttpServletRequest request, Model model) {
		regisMyplantsService.inputMyplantsService(request, model);

		return "MyGarden/inputmyplants";
	}

	@RequestMapping("/modifyplant")
	public String modifyplant(HttpServletRequest request, Model model) {

		DeviceDTO device = GetDeviceInfo.getDeviceInfo(request.getParameter("device_id"));
		List<dictionaryDTO> plantslist = dictionaryListService.getDictionaryList();

		model.addAttribute("plants", plantslist);
		model.addAttribute("device", device);

		return "MyGarden/modifyplant";
	}

	@RequestMapping("/modifyplantProcess")
	public String modifyplantProcess(HttpServletRequest request) {

		String device_id = request.getParameter("device_id");
		String f_name = request.getParameter("f_name");
		String f_nick = request.getParameter("f_nick");
		String f_shape = request.getParameter("f_shape");
		String f_date = request.getParameter("f_date");

		ModifyPlantService.modifyPlantService(device_id, f_name, f_nick, f_shape, f_date);

		return "redirect:mygarden";
	}

	@RequestMapping("/watercalendar")
	public String watercalendar(HttpServletRequest request, Model model) throws ParseException {

		WaterCalendarService.waterCalendarService(request, model);

		try {

			String waterday = (String) model.asMap().get("water");

			long diffDays = CalcDiffDays.calcDiffDays(waterday);

			model.addAttribute("waterday", diffDays);

		} catch (Exception e) {
		}

		return "MyGarden/watercalendar";

	}

	@RequestMapping("/statistic")
	public String statistic(HttpServletRequest request, Model model) {

		String device_id = request.getParameter("device_id");
		DeviceDTO info = GetDeviceInfo.getDeviceInfo(device_id);
		dictionaryDTO dictinfo = dictionaryDetailService.getGrowingInfo(info.getFlower().getF_name());
		model.addAttribute("info", info);
		model.addAttribute("dictinfo", dictinfo);

		return "MyGarden/statistic";
	}

	@RequestMapping("/deleteplant")
	public String deleteplant(HttpServletRequest request, Model model) {

		DeviceDTO info = GetDeviceInfo.getDeviceInfo(request.getParameter("device_id"));
		model.addAttribute("f_nick", info.getFlower().getF_nick());
		model.addAttribute("f_shape", info.getFlower().getF_shape());
		model.addAttribute("device_id", info.getDevice_id());

		return "MyGarden/deleteplant";
	}

	@RequestMapping("/deleteplantprocess")
	public String deleteplantprocess(HttpServletRequest request, Model model) {

		String device_id = request.getParameter("device_id");
		DeletePlantService.deletePlantService(request);

		return "redirect:mygarden";
	}

	@RequestMapping("/mygarden")
	public String mygardenmain(HttpServletRequest request, Model model) throws ParseException {

		String device_id = (String) request.getParameter("device_id");
		DeviceDTO info = GetDeviceInfo.getDeviceInfo(device_id);
		String f_img;
		if (info != null) {

			String f_birth = info.getFlower().getF_date();
			long diffDays = CalcDiffDays.calcDiffDays(f_birth);
			model.addAttribute("dday", diffDays);

			try {
				f_img = GetFlowerImg.getFlowerImg(info.getFlower().getF_name());
			} catch (Exception e) {
				f_img = "resources/img/flowerselect/BasicPlant.png";
			}

			model.addAttribute("f_img", f_img);
		}
		model.addAttribute("info", info);

		return "MyGarden/myGardenMain";
	}

	@RequestMapping(value = "/getregisterplantsajax", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody ArrayList<DeviceDTO> getregisterplantsajax(HttpServletRequest request) {

		ArrayList<DeviceDTO> retVal = new ArrayList();

		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		String userid = user.getUserid();
		user = MemberService.getMemberInfo(userid);

		member_deviceDTO[] device = user.getDevice();

		for (int i = 0; i < device.length; i++) {
			if (device[i].isRegister() == true) {

				String device_id = ((member_deviceDTO) device[i]).getDevice_id();
				DeviceDTO info = GetDeviceInfo.getDeviceInfo(device_id);
				retVal.add(info);

			}
		}
		System.out.println(retVal.toString());
		return retVal;
	}

	@RequestMapping("/getTHM")
	public @ResponseBody List<DeviceDataDTO> getTHM(HttpServletRequest request) {
		List<DeviceDataDTO> retVal = new ArrayList<DeviceDataDTO>();

		DeviceDTO data = GetDeviceInfo.getDeviceInfo(request.getParameter("device_id"));

		retVal = data.getData();

		return retVal;
	}

	@RequestMapping("/getTHM_myavg")
	public @ResponseBody Map<String, Object> getTHM_myavg(HttpServletRequest request) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		// 데이터 배열로 받아오기
		ArrayList<DeviceDataDTO> data = GetDeviceInfo.getDeviceInfo(request.getParameter("device_id")).getData();

		int temptotal = 0;
		int humitotal = 0;
		int moistotal = 0;

		for (int i = 0; i < data.size(); i++) {
			temptotal += data.get(i).getTemp();
			humitotal += data.get(i).getHumi();
			moistotal += data.get(i).getMois();
		}

		retVal.put("tempavg", temptotal / data.size());
		retVal.put("humiavg", humitotal / data.size());
		retVal.put("moisavg", moistotal / data.size());

		return retVal;
	}

	@RequestMapping("/getTHM_othersavg")
	public @ResponseBody Map<String, Object> getTHM_othersavg(@RequestBody Map<String, Object> info,
			HttpServletRequest request) {

		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println("getTHM_othersavg");
		System.out.println((String) info.get("f_name"));

		int temptotal = 0;
		int humitotal = 0;
		int moistotal = 0;

		int subtempavg = 0;
		int subhumiavg = 0;
		int submoisavg = 0;

		String f_name = (String) info.get("f_name");
		List<DeviceDTO> allDevice = GetAllDeviceInfo.getAllDeviceInfo(f_name);
		System.out.println("allDevice : " + allDevice.toString());

		for (int i = 0; i < allDevice.size(); i++) {

			ArrayList<DeviceDataDTO> deviceData = allDevice.get(i).getData();

			for (int j = 0; j < deviceData.size(); j++) {
				temptotal += deviceData.get(j).getTemp();
				humitotal += deviceData.get(j).getHumi();
				moistotal += deviceData.get(j).getMois();
			}

			subtempavg += temptotal / deviceData.size();
			subhumiavg += humitotal / deviceData.size();
			submoisavg += moistotal / deviceData.size();

		}

		try {

			retVal.put("tempavg", subtempavg / allDevice.size());
			retVal.put("humiavg", subhumiavg / allDevice.size());
			retVal.put("moisavg", submoisavg / allDevice.size());
		} catch (Exception e) {
			System.out.println("divde by zero exception!");
			retVal.put("tempavg", 0);
			retVal.put("humiavg", 0);
			retVal.put("moisavg", 0);
		}
		return retVal;
	}

	@RequestMapping("/f_nickDuplicationCheck")
	public @ResponseBody boolean f_nickDuplicationCheck(@RequestBody Map<String, Object> info,
			HttpServletRequest request) {

		boolean flag;
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("user");
		String userid = user.getUserid();
		String nowdevice = (String) info.get("now_device");

		user = MemberService.getMemberInfo(userid);
		member_deviceDTO[] deviceList = user.getDevice();

		String f_nick = (String) info.get("f_nick");

		flag = CheckFnickDuplication.checkFnickDuplication(deviceList, nowdevice, f_nick);

		return flag;

	}

	@RequestMapping(value = "Photo")
	public String Photo(HttpServletRequest request, Model model) {
		String device_id = request.getParameter("device_id");
		DeviceDTO deviceDTO = GardenDAO.getFlower(device_id);
		
		model.addAttribute("device_id", device_id);
		model.addAttribute("DeviceDTO", deviceDTO);
		return "MyGarden/PhotoSlider";
	}

	@RequestMapping(value = "/f_Photo", method = RequestMethod.POST)
	public String test(HttpServletRequest request, MultipartFile file, Model model) throws Exception {

		String root_path = request.getSession().getServletContext().getRealPath("/");

		String attach_path = "resources/f_Photo/";

		String savedName = file.getOriginalFilename();

		File target = new File(root_path + attach_path, savedName);

		FileCopyUtils.copy(file.getBytes(), target);

		f_PhothService.setPhoto(file.getOriginalFilename());
		return null;

	}

	@RequestMapping(value = "/f_PhotoGet", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> f_PhotoGet(@RequestBody Map<String, Object> info) throws ParseException {

		Map<String, Object> retVal = new HashMap<String, Object>();

		String date = (String) info.get("date");
		String device_id = (String) info.get("device_id");

		// String photoName=
		ArrayList<String> photoList = f_PhothService.getPhoto(device_id, date);

		retVal.put("photoList", photoList);
		System.out.println(retVal);
		return retVal;
	}
}
