package com.dosirak31.client.signup.dao;

import com.dosirak31.client.signup.vo.ClientVO;

public interface ClientDao {
	
	public int clientSignup(ClientVO cvo) throws Exception; // ȸ������
	
	public int idCheck(String client_id) throws Exception; // ���̵� �ߺ� üũ
	
	
}
