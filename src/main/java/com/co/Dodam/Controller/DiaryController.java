package com.co.Dodam.Controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.co.Dodam.Dto.dictionaryDTO;
import com.co.Dodam.Service.Diary.Diary_DetailService;
import com.co.Dodam.Service.Diary.Diary_LikeService;
import com.co.Dodam.Service.Diary.Diary_ListService;
import com.co.Dodam.Service.Diary.Diary_ModifyService;
import com.co.Dodam.Service.Diary.Diary_PlantOneListService;
import com.co.Dodam.Service.Diary.Diary_WriteDefaultService;
import com.co.Dodam.Service.Diary.Diary_WriteService;
import com.co.Dodam.Service.Dictionary.dictionaryListService;

@Controller
public class DiaryController {
	@Autowired
	Diary_WriteService diary_WriteService;

	@Autowired
	Diary_DetailService diary_DetailService;

	@Autowired
	Diary_ListService diary_ListService;

	@Autowired
	Diary_LikeService diary_LikeService;

	@Autowired
	Diary_PlantOneListService diary_PlantOneListService;

	@Autowired
	Diary_WriteDefaultService diary_WriteDefaultService;
	
	@Autowired
	dictionaryListService dictionaryListService;
	
	@Autowired
	Diary_ModifyService diary_ModifyService;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "Dictionary/NewFile";
	}

	@RequestMapping("/diary")
	public String diary(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		diary_WriteDefaultService.flowerInfo(model);

		return "Diary/diary";
	}

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping("/diary_write")
	public String result(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		model.addAttribute("request", request);
		request.setAttribute("img", file.getOriginalFilename());

		diary_WriteService.Dwrite(model);

		String root_path = request.getSession().getServletContext().getRealPath("/");

		String attach_path = "resources/upload/";

		String savedName = file.getOriginalFilename();

		File target = new File(root_path + attach_path, savedName);

		FileCopyUtils.copy(file.getBytes(), target);

		return "redirect:diary_plantOneList?device_id=" + request.getParameter("device_id");
	}

	@RequestMapping("/diary_detail")
	public String diary_detail(HttpServletRequest request, Model model) throws ParseException {
		model.addAttribute("request", request);
		diary_DetailService.DGet(model);
		diary_LikeService.likeUp(request, model);

		return "Diary/diaryDetail";
	}

	@RequestMapping("/diary_list")
	public String diary_list(HttpServletRequest request, Model model) {

		String species = request.getParameter("species");
		String writer = request.getParameter("writer");
		String writerid = request.getParameter("writerid");
		
		List<dictionaryDTO> searchlist = dictionaryListService.getDictionaryList();
		model.addAttribute("searchlist", searchlist);

		model.addAttribute("species", species);
		model.addAttribute("writer", writer);
		model.addAttribute("writerid", writerid);

		if (species == null && writer == null && writerid == null) {
			diary_ListService.DList(request, model);
		} else {

			if (species != null && writer == null && writerid == null) {
				String searchtext = species;
				String searchcriteria = "꽃 종류";
				diary_ListService.DList(request, model, searchtext, searchcriteria);
			}

			else if (species == null && writer != null && writerid == null) {
				String searchtext = writer;
				String searchcriteria = "닉네임";
				diary_ListService.DList(request, model, searchtext, searchcriteria);
			}
			
			else if (species == null && writer == null && writerid != null) {
				String searchtext = writerid;
				String searchcriteria = "아이디";
				diary_ListService.DList(request, model, searchtext, searchcriteria);
			}
		}

		return "Diary/diaryList";
	}

	@RequestMapping(value = "/likeUp", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> likeUp(@RequestBody Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		System.out.println("index: : " + info.get("index"));

		retVal = diary_LikeService.likeUp(info);

		return retVal;
	}

	@RequestMapping("/diary_plantOneList")
	public String plantOne_diaryList(HttpServletRequest request, Model model) throws ParseException {
		model.addAttribute("request", request);
		diary_PlantOneListService.plantOneList(model);
		return "Diary/diaryList_plantOne";
	}

	@RequestMapping("/diaryDelete")
	public String diaryDelete(HttpServletRequest request) {

		diary_ListService.delete(request);

		return "Diary/diaryDeleteProcess";
	}

	@RequestMapping("/diaryModify")
	public String diaryModify(HttpServletRequest request, Model model) {

		diary_ListService.modify(request, model);

		return "Diary/diaryModify";
	}

	@RequestMapping("/diarysearch")
	public String diarysearch(HttpServletRequest request, Model model) throws UnsupportedEncodingException {

		String searchcriteria = request.getParameter("searchcriteria");
		String searchtext = request.getParameter("searchtext");

		String enctext = URLEncoder.encode(searchtext, "UTF-8");

		System.out.println(searchcriteria);
		System.out.println(searchtext);

		if (searchcriteria.equals("꽃 종류")) {

			return "redirect:diary_list?species=" + enctext + "&page=1";
		}

		else if (searchcriteria.equals("닉네임")){

			return "redirect:diary_list?writer=" + enctext + "&page=1";
		}
		
		else {

			return "redirect:diary_list?writerid=" + enctext + "&page=1";
		}

	}
	
	@RequestMapping("/diaryModify_Ok")
	public String diaryModify_Ok(HttpServletRequest request, Model model, MultipartFile file) throws IOException {
		System.out.println("diaryModify_Ok - 인덱스:"+request.getParameter("index"));

		request.setAttribute("img", file.getOriginalFilename());
		diary_ModifyService.modify_ok(request, model);
		
		String root_path = request.getSession().getServletContext().getRealPath("/");

		String attach_path = "resources/upload/";

		String savedName = file.getOriginalFilename();

		File target = new File(root_path + attach_path, savedName);

		FileCopyUtils.copy(file.getBytes(), target);


		return "redirect:diary_detail?index=" + Integer.parseInt(request.getParameter("index"));
	}

}
