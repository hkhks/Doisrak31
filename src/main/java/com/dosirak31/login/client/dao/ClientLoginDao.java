package com.dosirak31.login.client.dao;

import com.dosirak31.login.client.vo.ClientLoginVO;

public interface ClientLoginDao {
	
	public ClientLoginVO loginProcess(ClientLoginVO login);

	public ClientLoginVO idConfirm(ClientLoginVO login);

	public ClientLoginVO getUserByEmail(ClientLoginVO cvo);
	
	public ClientLoginVO selectMember(ClientLoginVO pwvo);
	
	public int pwupdate(ClientLoginVO cvo);
}
