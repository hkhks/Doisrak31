package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO extends OrdersVO{
	/*CREATE TABLE payment (
	payment_no NUMBER(5) NOT NULL,	--결제일련번호(시퀀스)
	order_no NUMBER(5) NOT NULL,	--주문일련번호(주문fk)
	payment_method VARCHAR2(100) NOT NULL,	--결제방법
	payment_delete NUMBER default 0,	--결제취소여부
	payment_date DATE default sysdate,	--결제일시
	client_no NUMBER(5) NOT NULL		--회원일련번호(회원테이블 fk)
);*/
	private int payment_no;
	private int order_no;
	private String payment_method;
	private int payment_delete;
	private String payment_date;
	private int client_no;
	
	
	
}
