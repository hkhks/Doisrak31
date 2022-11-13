package com.dosirak31.login.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.login.admin.dao.AdminLoginDao;
import com.dosirak31.login.admin.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Setter(onMethod_= @Autowired)
	public AdminLoginDao adminlogindao;

	@Override
	public AdminLoginVO adidconfirm(AdminLoginVO avo) {
		
		AdminLoginVO adidconfirm = adminlogindao.adidconfirm(avo);
		
		return adidconfirm;
	}

	
	//admin로그인 처리
	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		
		AdminLoginVO clientLogin = adminlogindao.loginProcess(login);
		
		return clientLogin;
	}


	@Override
	public AdminLoginVO selectMember(AdminLoginVO pwvo) {
		
		AdminLoginVO pwselect = adminlogindao.selectMember(pwvo);
		
		return pwselect;
	}


	@Override
	public int pwupdate(AdminLoginVO avo) {
		
		int pwupdate = adminlogindao.pwupdate(avo);
		
		return pwupdate;
	}
	
}

