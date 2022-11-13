package com.dosirak31.food.order.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdersVO extends DosirakVO{//�ֹ����̺�
	private int order_no;//�ֹ� ��ȣ(�ֹ����̺��� ���� ȸ���� ���¹�ȣ�� 1,2�� ��� �ֹ���ȣ�� �ִ��� Ȯ���ϰ� ������ �ֹ����̺�����ְ� �ֹ���)
	private String order_date;	//���¹�ȣ 2�϶� �� ��
	private String order_client_name;
	private String order_client_phone;
	private String order_address;//���¹�ȣ 2�϶� �� ��
	private int client_no;	//ȸ�� ��ȣ(session���� �޾ƿ�)
	private int order_status_no;//�ֹ����¹�ȣ 1.��ٱ��� 2.�ֹ� �� 3.�ֹ� �� 4.�ֹ� ���
}
