package com.dosirak31.client.signup.service;

import com.dosirak31.client.signup.vo.ClientVO;

public interface ClientService {
	
	public int clientSignup(ClientVO cvo) throws Exception; // ȸ������
	
	public int idCheck(String client_id) throws Exception; // ���̵� �ߺ� üũ
	
	
}
