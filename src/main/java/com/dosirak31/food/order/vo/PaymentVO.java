package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO extends OrdersVO{
	/*CREATE TABLE payment (
	payment_no NUMBER(5) NOT NULL,	--�����Ϸù�ȣ(������)
	order_no NUMBER(5) NOT NULL,	--�ֹ��Ϸù�ȣ(�ֹ�fk)
	payment_method VARCHAR2(100) NOT NULL,	--�������
	payment_delete NUMBER default 0,	--������ҿ���
	payment_date DATE default sysdate,	--�����Ͻ�
	client_no NUMBER(5) NOT NULL		--ȸ���Ϸù�ȣ(ȸ�����̺� fk)
);*/
	private int payment_no;
	private int order_no;
	private String payment_method;
	private int payment_delete;
	private String payment_date;
	private int client_no;
	
	
	
}
