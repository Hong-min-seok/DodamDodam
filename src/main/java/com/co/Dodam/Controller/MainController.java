package com.co.Dodam.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	
	@RequestMapping("Dodam")
	public String dodammain() {
		
		return "Main/Dodam_Main";
	}
	
	@RequestMapping("/movie")
	public String movie() {
		return "Main/movie";
	}
	
	@RequestMapping("/story")
	public String story() {
		return "Main/story";
	}
	
	@RequestMapping("/WrongApproach")
	public String error() {
		return "error/error";
	}
	
	@RequestMapping("test")
	public String test() {
		
		return "Main/test";
	}	
}
