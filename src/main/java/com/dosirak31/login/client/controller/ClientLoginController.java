package com.dosirak31.login.client.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.login.client.service.ClientLoginService;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/client/*")
@Log4j
public class ClientLoginController {

	
	private ClientLoginService clientLoginService;


	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/loginmain")
	public String loginForm() {
		
		log.info("client 로그인 화면 호출");
		
		return "login/client/loginmain";
		//     /WEB-INF/views/login/client/loginmain.jsp로 포워드(관리자 시작페이지로 구분)
		
		//redirect:는 맵핑을 요청하는것임 -> 컨트롤러에 다시 메서드 작성해야됨
		
	} 
	
	@RequestMapping("/searchid")
	public String serarchId() {
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp
	}
	
	@RequestMapping("/searchpw")
	public String searchPw() { 
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp
	}
	
	
	@RequestMapping("successlogin")
	public String successLogin() {
		
		return "login";
	}
	
	@RequestMapping("faillogin")
	public String failIdLogin() {
		
		return "login/client/faillogin";
	}
	
	
	

	@PostMapping("/userlogin")
	public String loginProcess(ClientLoginVO login, Model model, boolean rememberId, HttpServletResponse response, HttpServletRequest request,RedirectAttributes ras, ServletRequest context) {
		//로그인 버튼을 클릭하여 로그인폼이 온 상태
		//여기서 로그인 과정을 처리
		
		System.out.println(rememberId);
		
		String url="";
		
		
		
		ClientLoginVO clientLogin = clientLoginService.loginProcess(login);
		
		if(clientLogin != null) { // 아이디,비밀번호가 일치하면
			
			
			if(rememberId) { // 아이디를 저장하시겠습니까에 체크가 되어있으면, -- 쿠키 생성하여 아이디 저장
				Cookie cookie = new Cookie("id",login.getClient_id()); // 쿠키를 생성
				response.addCookie(cookie); //응답에 저장
				
			}else { // 아이디를 저장하겠습니까에 체크가 해제되어있으면 -- 쿠키를 삭제
				
				Cookie cookie = new Cookie("id",login.getClient_id());
				cookie.setMaxAge(0); 
				response.addCookie(cookie);
				
			}
			
			
			HttpSession session = request.getSession();
			
			session.setAttribute("client_info", clientLogin);
			
			
			url="successlogin"; //성공시 로그인 성공페이지로 이동 
			
			
			return "redirect:"+url;
					
		}else {
			
			ras.addFlashAttribute("errorMsg","로그인 실패");
			
			//return "/client/loginmain";
			
			return "login/client/faillogin";
		}
		
			
	}
	
	
	
	@RequestMapping("/idconfirm")
	public String idConfirm(ClientLoginVO login, Model model) {
		//아이디를 찾기 창에서 아이디, 전화번호가 온 상태
		//여기서 아이디찾기 과정을 처리
		
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //아이디, 전화번호가 일치하는 고객의 객체를 전달받음
		
		if(clientsearchid != null) {
			
			model.addAttribute("clientsearchid",clientsearchid);
			
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp
			
		}else {
			
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp
			
		}
		
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaoLogin(Model model, HttpServletRequest request){
		String kakaoemail=request.getParameter("kakaoemail"); //카카오 이메일 값을 받아와서 저장
		String kakaoname=request.getParameter("kakaoname");  //카카오 닉네임 값을 받아와서 저장
		
		
		ClientLoginVO cvo = new ClientLoginVO();//카카오 기본 정보를 VO객체에 담아줌
		cvo.setClient_email(kakaoemail); //카카오 이메일을 client_eamil 변수에 저장
		cvo.setClient_name(kakaoname);//카카오 닉네임을 client_name 변수에 저장
		
	
		if (clientLoginService.getUserByEmail(cvo) == null) { //카카오 이메일로 로그인 한 적이 있는지 확인
													//카카오 로그인 한 적이 없다면, 
			model.addAttribute("kakaoclient", cvo);//카카오 기본정보(이름, 이메일)이 담긴 객체를 카카오 회원가입 페이지로 넘겨준다.
			
			return "signup/client/kakao_join_form"; //카카오 회원가입 페이지로 맵핑
			
		}else {
			
			String url = "";
			
			//카카오 계정으로 로그인한 적이 있을 때 그 회원의 정보를 불러옴
			ClientLoginVO clientLogin = clientLoginService.getUserByEmail(cvo);
			
			HttpSession session = request.getSession();
			
			//회원 정보를 세션에 저장한다.
			session.setAttribute("client_info", clientLogin);
			
			
			url = "successlogin";
			
			return "redirect:"+url;
			
		}
		
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session,ServletRequest context) {
		
		String url = "";
		
		log.info("로그아웃 처리");
		
        url = "completelogout";
        
		session.invalidate();
        
		return "redirect:"+url;
	}
	
	
	@RequestMapping("completelogout")
	public String logout() {
		
		return "main"; //     /WEB-INF/views/login/client/completelogout.jsp로 이동 , 아이디 찾기 화면
	}
	
	
	@RequestMapping("/pwconfirm")
	public ModelAndView sendEmail(ClientLoginVO pwvo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		
		ClientLoginVO pwconfirm = clientLoginService.selectMember(pwvo); // 폼에서 입력받은 값(아이디,이름,이메일)을 보내서 객체 존재하는지 확인하고 해당 객체를 전달받음
		
		if(pwconfirm != null) { //아이디,이름,이메일이 일치하는 객체가 존재한다면
			
			Random r = new Random(); //난수 값 생성하여 이메일로 보낸것임
			int num = r.nextInt(999999); 
			
				session.setAttribute("client_email", pwconfirm.getClient_email()); //객체의 이메일을 세션에 저장해줌
				
				String email = pwconfirm.getClient_email(); 
				
				/*******************************************************
				 * 이메일 보낼 내용 작성
				 *******************************************************/
				String subject = "[DOSIRAK31] 비밀번호 인증 이메일 입니다";
				
		        String content = "안녕하세요 회원님!!!<br/>"+"dosirak31 비밀번호 인증번호는 " + num +" 입니다.";
		        
		        String from = "gyruddkssud@naver.com";
		        
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
	        	
	        	mv.setViewName("login/client/pw_auth"); //이메일 보냈음-> 회원은 이메일을 열어봄 -> 인증번호 확인했을것임 -> 인증번호 확인 페이지로 가자
	        	
	        	mv.addObject("num", num); // 인증번호 인증을 위해 난수도 같이 확인 페이지로 넘겨줌
	        	
	        	return mv;
	        		
	        	
		}else { //이름, 아이디, 이메일이 일치하는 회원이 없다. -> 일치하는 회원이 없습니다
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login/client/failpwsearch");
			
			return mv;
		
		}
	}
	
	/**********************************************************************************************
  	 메일로 보낸 랜덤 인증번호와 사용자가 입력한 인증번호가 일치하는지 확인
    **********************************************************************************************/
	@RequestMapping("/pwauth")
	public String pwAuth(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num,HttpSession session, Model model){
		
		//인증번호-num, 사용자가 입력한 인증번호 - email_injeung 이 도착
		//메일로 보낸 인증번호와 사용자가 입력한 인증번호가 동일한지 확인
		
		String client_email = (String)session.getAttribute("client_email");
		
		model.addAttribute("client_email",client_email);
		
		if(email_injeung.equals(num)) {
			
			return "login/client/pw_new";
			
		}else {
			
			return "login/client/pw_auth_fail";
		}
		
		
		
	}
	

	/**********************************************************************************************
  	  비밀번호 재설정
    **********************************************************************************************/
	@RequestMapping("/pw_new")
	public String pwNew(String first_pw, String second_pw, String client_email, HttpSession session){
		
		ClientLoginVO cvo = new ClientLoginVO();
		
		cvo.setClient_pw(first_pw);
		cvo.setClient_email(client_email);
		
		int result = clientLoginService.pwupdate(cvo);
		
		if(result == 1) { 
			
			return "login/client/completechangepw";
			
		}else {
			
			return "login/client/faillogin";
		}
		
	}
	
	
	
	
	

}
