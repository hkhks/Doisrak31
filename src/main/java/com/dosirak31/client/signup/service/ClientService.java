package com.dosirak31.client.signup.service;

import com.dosirak31.client.signup.vo.ClientVO;

public interface ClientService {
	
	public int clientSignup(ClientVO cvo) throws Exception; // 회원가입
	
	public int idCheck(String client_id) throws Exception; // 아이디 중복 체크
	
	
}
