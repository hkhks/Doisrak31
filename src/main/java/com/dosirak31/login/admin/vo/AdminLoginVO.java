package com.dosirak31.login.admin.vo;

import lombok.Data;

@Data
public class AdminLoginVO {
	
	private String admin_id; // 관리자 아이디
	private String admin_pw; // 관리자 비밀번호
	private String admin_name; // 관리자 이름
	private String admin_email; // 관리자 이메일
	private String admin_phone; // 관리자 전화번호
	private String admin_address; // 관리자 주소
	private String admin_date; // 관리자 회원가입일
	private String admin_update; // 관리자 회원정보 수정일 
	

}
