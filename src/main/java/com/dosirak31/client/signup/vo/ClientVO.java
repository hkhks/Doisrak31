package com.dosirak31.client.signup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ClientVO {
	private int client_no = 0;
	private String client_id ="";
	private String client_name = "";
	private String client_pw = "";
	private String client_email = "";
	private String client_phone = "";
	private String client_address = "";
	private String client_rrn ="";
	private Date client_date;
	private Date client_update;
	
}
