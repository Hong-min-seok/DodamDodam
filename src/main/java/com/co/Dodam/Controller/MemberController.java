package com.co.Dodam.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.co.Dodam.Dto.memberDTO;
import com.co.Dodam.Dto.member_deviceDTO;
import com.co.Dodam.Service.Member.MemberService;

@Controller
public class MemberController {

   @Inject
   JavaMailSender mailSender;

   @Autowired
   MemberService MemberService;

   @RequestMapping("/login")
   public String login() {
      return "Member/login";
   }

   @RequestMapping("/join")
   public String join() {

      return "Member/join";
   }

   @RequestMapping("/joincomplete")
   public String joincomplete(HttpServletRequest request) {

      String joinid = request.getParameter("joinid");
      String joinnick = request.getParameter("joinnick");
      String joinmail = request.getParameter("joinmail");
      String joinpw = request.getParameter("joinpw");

      Map<String, Object> info = new HashMap<String, Object>();

      info.put("userid", joinid);
      info.put("pw", joinpw);
      info.put("nick", joinnick);
      info.put("email", joinmail);
      info.put("device", new ArrayList<member_deviceDTO>());

      MemberService.memberInsert(info);

      return "Member/joincomplete";
   }

   @RequestMapping(value = "/memberduplicationajax", method = RequestMethod.POST, produces = { "application/json" })
   public @ResponseBody Map<String, Object> idDuplication(@RequestBody Map<String, Object> info) {

      Map<String, Object> retVal = new HashMap<String, Object>();

      retVal = MemberService.idDuplication(info);

      return retVal;
   }

   @RequestMapping("/loginprocess")
   public String loginprocess(HttpServletRequest request, Model model) {

      String userid = request.getParameter("input_id");
      String pw = request.getParameter("input_pw");
      
      String referrer = request.getParameter("input_referrer");
      
      String ref[] = referrer.split("/");
      
      
      Map<String, Object> loginmap = new HashMap<String, Object>();

      loginmap.put("userid", userid);
      loginmap.put("pw", pw);

      boolean loginchk = MemberService.loginprocess(loginmap);

      if (loginchk == true) {
         HttpSession session = request.getSession();

         memberDTO user = MemberService.getMemberInfo(userid);
         System.out.println(ref[ref.length-1]);

         session.setAttribute("user", user);
         return "redirect:"+ref[ref.length-1];
      }

      return "Member/loginfail";
   }

   @RequestMapping("/logout")
   public String logout(HttpServletRequest request) {
      HttpSession session = request.getSession();
      session.invalidate();
      return "redirect:Dodam";
   }

   @RequestMapping("/mypage")
   public String mypage(HttpServletRequest request) {
      return "Member/mypage";
   }

   @RequestMapping("/quitmember")
   public String quitemember(HttpServletRequest request) {
      return "Member/quitmember";
   }

   @RequestMapping("/quitprocess")
   public String quitprocess(HttpServletRequest request) {

      HttpSession session = request.getSession();
      memberDTO member = (memberDTO) session.getAttribute("user");
      System.out.println(member.getUserid());
      String userid = member.getUserid();

      String pw = request.getParameter("input_pw");

      Map<String, Object> info = new HashMap<String, Object>();
      info.put("userid", userid);
      info.put("pw", pw);

      boolean chk = MemberService.loginprocess(info);

      if (chk == false) {
         return "Member/quitefail";
      }

      MemberService.quiteMember(info);
      session.invalidate();
      return "Member/quitesuccess";
   }

   @RequestMapping("/changepw")
   public String changepw() {

      return "Member/changepw";
   }

   @RequestMapping(value = "/pwcheckajax", method = RequestMethod.POST, produces = { "application/json" })
   public @ResponseBody boolean pwcheck(@RequestBody Map<String, Object> info, HttpServletRequest request) {

      boolean retVal;

      HttpSession session = request.getSession();
      memberDTO user = (memberDTO) session.getAttribute("user");
      String userid = user.getUserid();

      info.put("userid", userid);

      retVal = MemberService.pwcheck(info);

      return retVal;
   }

   @RequestMapping("/changepwprocess")
   public String changepwprocess(HttpServletRequest request) {

      Map<String, Object> info = new HashMap<String, Object>();

      String pw = request.getParameter("newpw");

      HttpSession session = request.getSession();
      memberDTO user = (memberDTO) session.getAttribute("user");
      String userid = user.getUserid();

      info.put("userid", userid);
      info.put("pw", pw);

      MemberService.updatepw(info);

      return "Member/changepwprocess";
   }

   @RequestMapping("/changeinfo")
   public String changeinfo() {
      return "Member/changeinfo";
   }

   @RequestMapping(value = "/nickduplicationajax", method = RequestMethod.POST, produces = { "application/json" })
   public @ResponseBody boolean nickduplicationajax(@RequestBody Map<String, Object> info,
         HttpServletRequest request) {

      boolean retVal;

      HttpSession session = request.getSession();
      memberDTO user = (memberDTO) session.getAttribute("user");
      String curnick = user.getNick();

      if (curnick.equals(info.get("nick"))) {
         System.out.println("current nick and new nick are same");
         return false;
      }

      retVal = MemberService.nickduplicationajax(info);

      return retVal;
   }

   @RequestMapping("/changeinfoprocess")
   public String changeinfoprocess(HttpServletRequest request) {

      HttpSession session = request.getSession();
      memberDTO user = (memberDTO) session.getAttribute("user");

      String userid = user.getUserid();
      String nick = request.getParameter("nick");
      String email = request.getParameter("mail");

      Map<String, Object> info = new HashMap<String, Object>();
      info.put("userid", userid);
      info.put("nick", nick);
      info.put("email", email);

      MemberService.modifyMember(info);

      user = MemberService.getMemberInfo(userid);
      session.setAttribute("user", user);

      return "Member/changecomplete";
   }

   @RequestMapping("/findid")
   public String findid() {
      return "Member/findid";
   }

   @RequestMapping("/findpw")
   public String findpw() {
      return "Member/findpw";
   }

   @RequestMapping(value = "/sendEmail", method = RequestMethod.POST, produces = { "application/json" })
   public @ResponseBody Map<String, Object> sendEmail(@RequestBody Map<String, Object> info) {
      Map<String, Object> retVal = new HashMap<String, Object>();
      System.out.println("而⑦듃濡ㅻ윭 sendEmail");
      System.out.println("id: : " + info.get("id"));

      String id = (String) info.get("id");

      String email = MemberService.findEmail(id);

      System.out.println(id + " 쓽  씠硫붿씪: " + email);

      if (email.equals("-")) {
         retVal.put("id", "-");
         retVal.put("dice", null);
         retVal.put("msg", " 씤利앸쾲 샇媛   쟾 넚 릺 뿀 뒿 땲 떎.");
         return retVal;
      }

      Random r = new Random();
      int dice = r.nextInt(4589362) + 49311; // 씠硫붿씪濡 諛쏅뒗 씤利앹퐫 뱶 遺 遺 ( 궃 닔)

      String setfrom = "dodam@gamil.com";
      String tomail = email; // 諛쏅뒗 궗 엺 씠硫붿씪
      String title = "This is the membership authentication number email."; // email title
      String content =

            System.getProperty("line.separator") + // Written for line spacing

                  System.getProperty("line.separator") +

                  "Hello\r\n" + "Thank you for visiting Dodam Dodam."

                  + System.getProperty("line.separator") +

                  System.getProperty("line.separator") +

                  "Your Authentication number : " + dice

                  + System.getProperty("line.separator") +

                  System.getProperty("line.separator") +

                  "Please enter the authentication number on the Dodam Dodam homepage."; // content

      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

         messageHelper.setFrom(setfrom); // sender
         messageHelper.setTo(tomail); // recipient's Email
         messageHelper.setSubject(title); // Email title(Allow skip)
         messageHelper.setText(content); // Email Content

         mailSender.send(message);
      } catch (Exception e) {
         System.out.println(e);
      }
      retVal.put("id", id);
      retVal.put("dice", dice);
      retVal.put("msg", " 씤利앸쾲 샇媛   쟾 넚 릺 뿀 뒿 땲 떎.");
      return retVal;
   }

   @RequestMapping("/check_dice")
   public String check_email(HttpServletRequest request, HttpServletResponse response_equals) throws IOException {

      Map<String, Object> info = new HashMap<String, Object>();

      String id = request.getParameter("inputId");
      String dice = request.getParameter("dice");
      String inputDide = request.getParameter("inputDice");

      System.out.println("而⑦듃濡ㅻ윭: check_dice");
      System.out.println("id: " + id);
      System.out.println("dice: " + dice);
      System.out.println("inputDice: " + inputDide);

      if (dice.equals(inputDide)) {
         request.setAttribute("id", id);
         response_equals.setContentType("text/html; charset=UTF-8");
         PrintWriter out_equals = response_equals.getWriter();
         out_equals.println("<script>alert('Make your new Password..');</script>");
         out_equals.flush();
         return "Member/findpw_changepw";
      }

      response_equals.setContentType("text/html; charset=UTF-8");
      PrintWriter out_equals = response_equals.getWriter();
      out_equals.println("<script>alert('인증번호가 올바르지 않습니다. Please retry.');</script>");
      out_equals.flush();
      return "Member/findpw";
   }

   @RequestMapping("/resetPw")
   public String resetPw(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

      Map<String, Object> info = new HashMap<String, Object>();

      model.addAttribute("request", request);

      MemberService.resetPw(model);

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter printWriter = response.getWriter();
      printWriter.println("<script>alert('Success change Password');</script>");
      printWriter.flush();

      return "Member/login";
   }

    @RequestMapping(value = "/findId", method = RequestMethod.POST)
      public String mailSending(HttpServletRequest request, HttpServletResponse response) throws IOException {

         System.out.println("mailSending()메소드");
         
         String id = MemberService.findId(request.getParameter("email"));
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out_email = response.getWriter();

         if (id.equals("-")) {
            out_email.println("<script>alert('해당 이메일이 존재하지 않습니다. 다시 입력해주세요.');location.href='./findid';</script>");
            out_email.flush();
         }

         String setfrom = "dodam@gamil.com";
         String tomail = request.getParameter("email");
         String title = "[도담도담] 아이디 찾기 이메일";
         String content =

               System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

                     System.getProperty("line.separator") +

                     "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

                     + System.getProperty("line.separator") +

                     System.getProperty("line.separator") +

                     " 회원님의 아이디는 " + id + " 입니다. "

                     + System.getProperty("line.separator") +

                     System.getProperty("line.separator") +

                     "찾으신 아이디로 로그인해 주시길 바랍니다.";

         try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom);
            messageHelper.setTo(tomail);
            messageHelper.setSubject(title);
            messageHelper.setText(content);

            mailSender.send(message);
         } catch (Exception e) {
            System.out.println(e);
         }
         out_email.println("<script>alert('등록된 이메일로 아이디가 전송되었습니다.');location.href='./login';</script>");
         out_email.flush();

         return "Member/login";

      }


}