package com.dosirak31.food.order.dao;

import java.util.List;

import com.dosirak31.food.order.vo.OrderDetailVO;
import com.dosirak31.food.order.vo.OrderGraphDTO;

public interface FoodOrderDao {
	public int bagInsert(OrderDetailVO odv);//��ٱ��Ͽ� insert
	public List<OrderDetailVO> bagList(int client_no);//��ٱ��Ϸ� �̵��ϱ�.select�ؿ���
	public int bagUpdate(OrderDetailVO odv);//���� ���� �� �ֹ����� ����
	public int bagDelete1(int dosirak_no);//���ö��� ����
	public int bagOrderNo(int order_no);//�ֹ��󼼹�ȣ ����� ��ȸ
	public int bagDelete2(int order_no);////�ֹ��󼼾����� �ֹ����̺� ����
	public int orderInsert(OrderDetailVO odv);//�ֹ��� insert
	public OrderDetailVO orderList(OrderDetailVO odv);//�ֹ���ȣ select
	public int paymentInsert(OrderDetailVO odv);//�������̺� insert
	public int orderUpdate(OrderDetailVO odv);//�ֹ� ���� �� ��� ���� update);//�������̺� insert
	
	public List<OrderDetailVO> orderhistory(OrderDetailVO odv);//�ֹ����� �������������� ��ȸ
	public int orderListCnt(OrderDetailVO odv);//����¡ó���� ���� list���� 
	
	public List<OrderDetailVO> orderDetailHistory(int order_no);//�ֹ� �� ����
	public int orderDelivery(OrderDetailVO odv);//��� ��ư-�߼�
	public int paymentDelete(OrderDetailVO odv);//������ҹ�ư
	
	public OrderGraphDTO orderBeforeWeek();//������ ����
	public OrderGraphDTO orderCurrentWeek();//�̹��� ����
	public OrderGraphDTO orderMonth();//����,������,�̹��� ����
}
