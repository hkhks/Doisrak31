package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO extends PaymentVO {	//주문상세테이블
	private int order_no;	//주문번호(주문테이블에서 같은 회원이 상태번호가 1,2일 경우 주문번호가 있는지 확인하고 없으면 주문테이블먼저넣고 주문상세)
	private int order_quantity;	//주문수량
	private int order_price;	//주문가격
	private int dosirak_no;		//도시락번호(도시락 생성 후 넣기)
}
