package com.dosirak31.food.order.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;

@Data
public class ClientVO extends CommonVO{
	

	private int client_no; //ȸ���Ϸù�ȣ
	private String client_id; //ȸ�����̵�
	private String client_pw; //ȸ����й�ȣ
	private String client_name; //ȸ���̸�
	private String client_email; //ȸ���̸���
	private String client_phone; //ȸ����ȭ��ȣ
	private String client_address; //ȸ���ּ�
	private String client_date; //ȸ��������
	private String client_update; //ȸ������������
	
	

}
