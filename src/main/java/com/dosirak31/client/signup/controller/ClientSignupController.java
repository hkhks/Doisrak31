package com.dosirak31.client.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dosirak31.client.signup.service.ClientService;
import com.dosirak31.client.signup.vo.ClientVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Controller
@RequestMapping("signup/client/*")
public class ClientSignupController {
	

		// service를 의존
		private ClientService clientService;

		// 회원가입 화면 get
		@GetMapping(value = "/signupForm")
		public String getClientSignup() throws Exception {
			log.info("client 회원가입 화면 호출 성공");
			
			return "signup/client/signupForm";
		}
		
		// 회원가입 화면 get
			@GetMapping(value = "/kakao_join_form")
			public String getKakaoClientSignup() throws Exception {
				log.info("client 회원가입 화면 호출 성공");
					
				return "signup/client/kakao_join_form";
			}
			
		// 아이디 중복 검사
		@RequestMapping(value = "/clientIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String clientIdChk(String client_id) throws Exception{
				
			log.info("clientIdChk() 호출");
			
			int result = clientService.idCheck(client_id);
			
			log.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}
				
		} // clientIdChk() 종료	
			
		
		// 회원가입 post
		@PostMapping(value = "/signup")
		public String postClientSignup(ClientVO cvo) throws Exception {
			log.info("clientSignup 회원가입 성공");
			
			int result = 0;
			String url = "";
			
			result = clientService.clientSignup(cvo);
			if(result == 1) {
				url = "/client/loginmain";
			} else {
				url = "/signup/client/signupForm";
			}
			return "redirect:"+url;
			
		}
		
		
}
