package com.dosirak31.login.admin.dao;

import com.dosirak31.login.admin.vo.AdminLoginVO;

public interface AdminLoginDao {
	
	public AdminLoginVO adidconfirm(AdminLoginVO avo);
	
	public AdminLoginVO loginProcess(AdminLoginVO login);
	
	public AdminLoginVO selectMember(AdminLoginVO pwvo);

	public int pwupdate(AdminLoginVO avo);

	
}
