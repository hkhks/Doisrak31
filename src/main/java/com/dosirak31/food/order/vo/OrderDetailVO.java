package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO extends PaymentVO {	//�ֹ������̺�
	private int order_no;	//�ֹ���ȣ(�ֹ����̺��� ���� ȸ���� ���¹�ȣ�� 1,2�� ��� �ֹ���ȣ�� �ִ��� Ȯ���ϰ� ������ �ֹ����̺�����ְ� �ֹ���)
	private int order_quantity;	//�ֹ�����
	private int order_price;	//�ֹ�����
	private int dosirak_no;		//���ö���ȣ(���ö� ���� �� �ֱ�)
}
