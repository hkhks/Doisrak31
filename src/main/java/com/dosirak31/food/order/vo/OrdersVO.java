package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdersVO extends DosirakVO{//주문테이블
	private int order_no;//주문 번호(주문테이블에서 같은 회원이 상태번호가 1,2일 경우 주문번호가 있는지 확인하고 없으면 주문테이블먼저넣고 주문상세)
	private String order_date;	//상태번호 2일때 들어갈 값
	private String order_client_name;
	private String order_client_phone;
	private String order_address;//상태번호 2일때 들어갈 값
	private int client_no;	//회원 번호(session으로 받아옴)
	private int order_status_no;//주문상태번호 1.장바구니 2.주문 전 3.주문 후 4.주문 취소
}
