package com.dosirak31.client.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.client.signup.dao.ClientDao;
import com.dosirak31.client.signup.vo.ClientVO;

import lombok.Setter;

@Service
public class ClientServiceImpl implements ClientService {
	// 의존객체가 DAO
	@Setter(onMethod_ = @Autowired)
	private ClientDao clientDao;
	
	// 회원가입 구현
	@Override
	public int clientSignup(ClientVO cvo) throws Exception {
		int result = 0;
		result = clientDao.clientSignup(cvo);
		return result;
	}

	@Override
	public int idCheck(String client_id) throws Exception  {
		return clientDao.idCheck(client_id);
	}
	
	

	
	
}
