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
       admin �α��� ���� ȭ������ ��
   *************************************************/
   @RequestMapping("/login")
   public String adminLoginForm() {
      
      return "login/admin/adminloginmain";
      
   }
   
   /**************************************************
       admin ���̵� ã�� ȭ������ ��
    *************************************************/
   @RequestMapping("/adsearchid")
   public String adSearchId() {
   
      return "login/admin/adsearchid";
   
   }

   /**************************************************
      admin ��й�ȣ ã�� ȭ������ ��
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
      admin �α���
    *************************************************/
   @PostMapping("/userlogin")
   public String loginProcess(AdminLoginVO login, Model model, HttpServletRequest request,RedirectAttributes ras) {
      //�α��� ��ư�� Ŭ���Ͽ� �α������� �� ����
      //���⼭ �α��� ������ ó��
      
      String url="";
      
      AdminLoginVO adminLogin = adminloginservice.loginProcess(login);
      
      if(adminLogin != null) { 
         
         model.addAttribute("admin_info",adminLogin);
         
         HttpSession session = request.getSession();

         session.setAttribute("admin_info", adminLogin); 
         
         url="successlogin"; //������ �α��� ������������ �̵� 
         
         return "redirect:"+url;
               
      }else {
         
         ras.addFlashAttribute("errorMsg","�α��� ����");
         
         //return "/client/loginmain";
         
         return "login/admin/faillogin";
      }
      
         
   }
   
   /**************************************************
      admin ���̵� ã�� 
    *************************************************/
   @PostMapping("/adidconfirm")
   public String adminIdConfirm(AdminLoginVO avo, Model model) { // �޾ƿ� ��(�̸�,��ȭ��ȣ)�� avo�� ����
   
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
   
      
      AdminLoginVO pwconfirm = adminloginservice.selectMember(avo); // ������ �Է¹��� ���� ������ ��ü �����ϴ��� Ȯ��
      
      if(pwconfirm != null) { //���̵�,�̸�,�̸����� ��ġ�ϴ� ��ü�� �����Ѵٸ�
         
         Random r = new Random(); //���� �� �����Ͽ� �̸��Ϸ� ��������
         int num = r.nextInt(999999); 
         
            session.setAttribute("admin_email", pwconfirm.getAdmin_email()); //������ �Է¹��� �̸��� ��������
            
            String email = pwconfirm.getAdmin_email(); 
            
            /*******************************************************
             * �̸��� ���� ���� �ۼ�
             *******************************************************/
              String subject = "[DOSIRAK31] ��й�ȣ ���� �̸��� �Դϴ�";
            
              String content = "�ȳ��ϼ��� ȸ����!!!<br/>"+ "dosirak31 ��й�ȣ ������ȣ�� " + num + " �Դϴ�.";
              
              String from = "dosirak31company@naver.com";
              
              String to = email;
              
              
              try {
                     MimeMessage mail = mailSender.createMimeMessage();
                     MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
                     
                     mailHelper.setFrom(from);
               
                     mailHelper.setTo(to);
                     mailHelper.setSubject(subject);
                     mailHelper.setText(content, true);
                  
                     mailSender.send(mail); // �̸����� ����
                  
                 }catch(Exception e) {
                    
                    e.printStackTrace(); //�̸��� ������ �������� ���
                 }
              
              
              ModelAndView mv = new ModelAndView(); 
              
              mv.setViewName("login/admin/ad_pw_auth"); //�̸��Ϻ�����-> ȸ���� �̸����� ��� -> ������ȣ Ȯ���������� -> ������ȣ Ȯ�� �������� ����
              
              mv.addObject("num", num); // ������ȣ ������ ���� ������ ���� Ȯ�� �������� �Ѱ���
              
              return mv;
                 
              
              
      
         
      }else { //�̸�, ���̵�, �̸����� ��ġ�ϴ� ȸ���� ����. -> ��ġ�ϴ� ȸ���� �����ϴ� �� ��
         
         ModelAndView mv = new ModelAndView();
         
         mv.setViewName("login/admin/failpwsearch");
         
         return mv;
      
      }
   }
   
   /**********************************************************************************************
        ���Ϸ� ���� ���� ������ȣ�� ����ڰ� �Է��� ������ȣ�� ��ġ�ϴ��� Ȯ��
    **********************************************************************************************/
   @RequestMapping("/adpwauth")
   public String adpwAuth(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num,HttpSession session, Model model){
      
      //������ȣ-num, ����ڰ� �Է��� ������ȣ - email_injeung �� ����
      //���Ϸ� ���� ������ȣ�� ����ڰ� �Է��� ������ȣ�� �������� Ȯ��
      
      String admin_email = (String)session.getAttribute("admin_email");
      
      model.addAttribute("admin_email",admin_email);
      
      if(email_injeung.equals(num)) {
         
         return "login/admin/adpw_new";
         
      }else {
         
         return "login/admin/ad_pw_auth_fail";
      }
      
      
      
   }
   
   /**********************************************************************************************
        ��й�ȣ �缳��
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
      
      return "login/admin/adminloginmain"; //     /WEB-INF/views/login/client/completelogout.jsp�� �̵� , ���̵� ã�� ȭ��
   }
   
   
   
   
   

   
}