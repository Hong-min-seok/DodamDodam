package com.co.Dodam.Service.Member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.co.Dodam.Dao.MemberDAO;
import com.co.Dodam.Dto.memberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;

	public Map<String, Object> idDuplication(Map<String, Object> info) {
		
		Map<String, Object> retVal;
		retVal = dao.idDuplication(info);
		
		return retVal;
	}

	public void memberInsert(Map<String, Object> info) {
		
		dao.memberInsert(info);
		
	}

	public boolean loginprocess(Map<String, Object> loginmap) {
		
		boolean chk = dao.loginProcess(loginmap);
		
		return chk;
	}

	public memberDTO getMemberInfo(String userid) {
		
		return dao.getMemberInfo(userid);
	}

	public void quiteMember(Map<String, Object> info) {
		dao.quiteMember(info);
		
	}

	public boolean pwcheck(Map<String, Object> info) {
		
		
		return dao.pwcheck(info);
	}

	public void updatepw(Map<String, Object> info) {
		
		dao.updatepw(info);
		
	}

	public boolean nickduplicationajax(Map<String, Object> info) {

		return dao.nickduplicationajax(info);
	}

	public void modifyMember(Map<String, Object> info) {
		
		dao.memberModify(info);
		
	}

	public String findEmail(Object id) {
		// TODO Auto-generated method stub
		
		return dao.findEmail(id);
	}

	public void resetPw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		dao.resetPw(request.getParameter("id"), request.getParameter("newpw"));
		
	}
	
	public String findId(String email) {
	      // TODO Auto-generated method stub
	      return dao.findId(email);
	   }
	

}
