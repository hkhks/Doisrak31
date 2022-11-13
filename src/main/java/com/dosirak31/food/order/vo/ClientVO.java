package com.dosirak31.food.order.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;

@Data
public class ClientVO extends CommonVO{
	

	private int client_no; //회원일련번호
	private String client_id; //회원아이디
	private String client_pw; //회원비밀번호
	private String client_name; //회원이름
	private String client_email; //회원이메일
	private String client_phone; //회원전화번호
	private String client_address; //회원주소
	private String client_date; //회원가입일
	private String client_update; //회원정보수정일
	
	

}
