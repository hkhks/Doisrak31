package com.dosirak31.login.admin.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.login.admin.service.AdminLoginService;
import com.dosirak31.login.admin.vo.AdminLoginVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminLoginController {
   
   @Setter(onMethod_= @Autowired)
   private AdminLoginService adminloginservice;
   

   @Autowired
   private JavaMailSender mailSender;

   
   /**************************************************
       admin 로그인 메인 화면으로 감
   *************************************************/
   @RequestMapping("/login")
   public String adminLoginForm() {
      
      return "login/admin/adminloginmain";
      
   }
   
   /**************************************************
       admin 아이디 찾기 화면으로 감
    *************************************************/
   @RequestMapping("/adsearchid")
   public String adSearchId() {
   
      return "login/admin/adsearchid";
   
   }

   /**************************************************
      admin 비밀번호 찾기 화면으로 감
    *************************************************/
   @RequestMapping("/adsearchpw")
   public String adSearchPw() {

      return "login/admin/adsearchpw";

   }
   
   @RequestMapping("successlogin")
   public String successLogin() {
      
      return "food/admin/foodAdminBasicList";
   }
   

   /**************************************************
      admin 로그인
    *************************************************/
   @PostMapping("/userlogin")
   public String loginProcess(AdminLoginVO login, Model model, HttpServletRequest request,RedirectAttributes ras) {
      //로그인 버튼을 클릭하여 로그인폼이 온 상태
      //여기서 로그인 과정을 처리
      
      String url="";
      
      AdminLoginVO adminLogin = adminloginservice.loginProcess(login);
      
      if(adminLogin != null) { 
         
         model.addAttribute("admin_info",adminLogin);
         
         HttpSession session = request.getSession();

         session.setAttribute("admin_info", adminLogin); 
         
         url="successlogin"; //성공시 로그인 성공페이지로 이동 
         
         return "redirect:"+url;
               
      }else {
         
         ras.addFlashAttribute("errorMsg","로그인 실패");
         
         //return "/client/loginmain";
         
         return "login/admin/faillogin";
      }
      
         
   }
   
   /**************************************************
      admin 아이디 찾기 
    *************************************************/
   @PostMapping("/adidconfirm")
   public String adminIdConfirm(AdminLoginVO avo, Model model) { // 받아온 값(이름,전화번호)을 avo에 저장
   
         AdminLoginVO adminid = adminloginservice.adidconfirm(avo);
         
         
         if(adminid != null) {
            
            model.addAttribute("adminid",adminid);
            
            return "login/admin/successadidconfirm"; 
            
         }else {
            
            return "login/admin/failidsearch";
            
         }

   }
   
   @RequestMapping("/adpwconfirm")
   public ModelAndView sendEmail(AdminLoginVO avo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
   
      
      AdminLoginVO pwconfirm = adminloginservice.selectMember(avo); // 폼에서 입력받은 값을 보내서 객체 존재하는지 확인
      
      if(pwconfirm != null) { //아이디,이름,이메일이 일치하는 객체가 존재한다면
         
         Random r = new Random(); //난수 값 생성하여 이메일로 보낸것임
         int num = r.nextInt(999999); 
         
            session.setAttribute("admin_email", pwconfirm.getAdmin_email()); //폼에서 입력받은 이메일 저장해줌
            
            String email = pwconfirm.getAdmin_email(); 
            
            /*******************************************************
             * 이메일 보낼 내용 작성
             *******************************************************/
              String subject = "[DOSIRAK31] 비밀번호 인증 이메일 입니다";
            
              String content = "안녕하세요 회원님!!!<br/>"+ "dosirak31 비밀번호 인증번호는 " + num + " 입니다.";
              
              String from = "dosirak31company@naver.com";
              
              String to = email;
              
              
              try {
                     MimeMessage mail = mailSender.createMimeMessage();
                     MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
                     
                     mailHelper.setFrom(from);
               
                     mailHelper.setTo(to);
                     mailHelper.setSubject(subject);
                     mailHelper.setText(content, true);
                  
                     mailSender.send(mail); // 이메일을 보냄
                  
                 }catch(Exception e) {
                    
                    e.printStackTrace(); //이메일 보내기 오류나면 띄움
                 }
              
              
              ModelAndView mv = new ModelAndView(); 
              
              mv.setViewName("login/admin/ad_pw_auth"); //이메일보냈음-> 회원은 이메일을 열어봄 -> 인증번호 확인했을것임 -> 인증번호 확인 페이지로 가자
              
              mv.addObject("num", num); // 인증번호 인증을 위해 난수도 같이 확인 페이지로 넘겨줌
              
              return mv;
                 
              
              
      
         
      }else { //이름, 아이디, 이메일이 일치하는 회원이 없다. -> 일치하는 회원이 없습니다 ㅜ ㅜ
         
         ModelAndView mv = new ModelAndView();
         
         mv.setViewName("login/admin/failpwsearch");
         
         return mv;
      
      }
   }
   
   /**********************************************************************************************
        메일로 보낸 랜덤 인증번호와 사용자가 입력한 인증번호가 일치하는지 확인
    **********************************************************************************************/
   @RequestMapping("/adpwauth")
   public String adpwAuth(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num,HttpSession session, Model model){
      
      //인증번호-num, 사용자가 입력한 인증번호 - email_injeung 이 도착
      //메일로 보낸 인증번호와 사용자가 입력한 인증번호가 동일한지 확인
      
      String admin_email = (String)session.getAttribute("admin_email");
      
      model.addAttribute("admin_email",admin_email);
      
      if(email_injeung.equals(num)) {
         
         return "login/admin/adpw_new";
         
      }else {
         
         return "login/admin/ad_pw_auth_fail";
      }
      
      
      
   }
   
   /**********************************************************************************************
        비밀번호 재설정
    **********************************************************************************************/
   @RequestMapping("/adpw_new")
   public String pwNew(String first_pw, String second_pw, String admin_email, HttpSession session){
   
      AdminLoginVO avo = new AdminLoginVO();
   
      avo.setAdmin_pw(first_pw);
      avo.setAdmin_email(admin_email);
   
   int result = adminloginservice.pwupdate(avo);
   
   if(result == 1) {
      
      return "login/admin/completechangepw";
      
   }else {
      
      return "login/admin/faillogin";
   }
   
}
   
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      
      String url = "";
      
      session.invalidate();
        
        url = "completelogout";
        
        
      return "redirect:"+url;
   }
   
   
   @RequestMapping("completelogout")
   public String logout() {
      
      return "login/admin/adminloginmain"; //     /WEB-INF/views/login/client/completelogout.jsp占쏙옙 占싱듸옙 , 占쏙옙占싱듸옙 찾占쏙옙 화占쏙옙
   }
   
   
   
   
   

   
}