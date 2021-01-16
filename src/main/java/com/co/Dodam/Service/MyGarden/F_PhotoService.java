package com.co.Dodam.Service.MyGarden;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.taglibs.standard.extra.spath.Step;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.co.Dodam.Dao.GardenDAO;

@Service("F_PhotoService")
public class F_PhotoService {
   @Autowired
   GardenDAO dao;

   public void setPhoto(String originalFilename) {
      dao.setPhoto(originalFilename);
      
   }

   public ArrayList<String> getPhoto(String device_id, String date) throws ParseException {
      System.out.println("DB에서 값 가져옴.....");
      String[] photoList =dao.getPhoto_List(device_id);
      ArrayList<String> result= new ArrayList<String>();
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      
      
      if (date.contains("~")) {
         
         String[] selectDate= date.split(" ~ ");
         System.out.println(selectDate[0]+"*"+selectDate[1]);
         /*
          * Date start=formatter.parse(selectDate[0]); Date end=
          * formatter.parse(selectDate[1]);
          */

         Date start=formatter.parse(selectDate[0]);
         Date end= formatter.parse(selectDate[1]);
         System.out.println("start- "+start);
         System.out.println("end- "+end);
         
         for(String s: photoList) {
            
            String[] arr=s.split("\\$");

            System.out.println(arr[1].replace(".jpg", ""));
            
            Date photoDate= formatter.parse(arr[1].replace(".jpg", ""));
            System.out.println("photoDate-"+photoDate);
          
            if(photoDate.compareTo(start)==0) {
               System.out.println("photoDate==start");
               result.add(s);
            }
            else if(photoDate.compareTo(start)>0&&photoDate.compareTo(end)<0) {
               System.out.println("photoDate.compareTo(start)>0");
               result.add(s);
            }
            
            else if(photoDate.compareTo(end)==0) {
               System.out.println("photoDate.equals(end)");
               result.add(s);
            }
         }
         
         System.out.println("범위 선택했을 때: "+ result);
         return result;
         
      }else {
        
            for(String s : photoList) {
                String[] arr=s.split("\\$");

                Date photoDate = formatter.parse(arr[1].replace(".jpg", ""));
                Date inputDate=formatter.parse(date);
                
                if(photoDate.compareTo(inputDate)==0) {
                   result.add(s);
                   System.out.println("날짜 하나만 선택했을 때: "+ result);
                   return result;
                }
             }
         
      }
      return null;
      
      
   }
}