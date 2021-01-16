package com.co.Dodam.Service.MyGarden;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class CalcDiffDays {

	public long calcDiffDays(String s_date) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date beginDate = formatter.parse(s_date);
		System.out.println(beginDate);
		Date endDate = new Date();
		System.out.println(endDate);
		
		long diff = endDate.getTime() - beginDate.getTime();
		long diffDays = diff / (24*60*60*1000);
		
		return diffDays;
	}

}
